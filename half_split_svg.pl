#!/usr/bin/perl
#
# SVGをグリフごとに分割
# usage: perl split_svg.pl svg_sheet.svg list.txt
#
# customize base script from:
#http://d.hatena.ne.jp/mashabow/20120314/1331744357

use strict;
use warnings;
use autodie;
use utf8;
use 5.010;
binmode STDOUT, ":utf8";

use constant OUT_DIR => "glyphs";
use constant PIXELS_PER_EM_COL =>  500; # x,width
use constant PIXELS_PER_EM_ROW => 1000; # y,height
use constant UNITS_PER_EM_COL  =>  500;
use constant UNITS_PER_EM_ROW  => 1000;

use XML::Simple;

my ($svg_file, $list_file) = @ARGV;

# SVG 読み込み
my $svg = XMLin($svg_file, forcearray => 1, keyattr => []);

# 行数・列数を求める
my $row_max = int ($svg->{height} / PIXELS_PER_EM_ROW) - 1;
my $col_max = int ($svg->{width} / PIXELS_PER_EM_COL) - 1;

# outline レイヤーを探す
my $groups = $svg->{g};
my $group_outline;
foreach my $group (@$groups) {
  if ($group->{'inkscape:label'} eq "outline") {
	$group_outline = $group;
	last;
  }
}
die "outlineレイヤーが存在しません" unless defined $group_outline;

# 変換行列を求める
my $transform = $group_outline->{transform};
my ($a, $b, $c, $d, $e, $f) = (1, 0, 0, 1, 0, 0);
if (!defined $transform) {
  # noop
} elsif ($transform =~ m/translate\((?<tx>-?\d+(.\d+)?(e-?\d+)?),(?<ty>-?\d+(.\d+)?(e-?\d+)?)\)/) {
  $e = $+{tx};
  $f = $+{ty};
} elsif ($transform =~ m/matrix\((?<a>-?\d+(.\d+)?(e-?\d+)?),(?<b>-?\d+(.\d+)?(e-?\d+)?)\),(?<c>-?\d+(.\d+)?(e-?\d+)?),(?<d>-?\d+(.\d+)?(e-?\d+)?),(?<e>-?\d+(.\d+)?(e-?\d+)?),(?<f>-?\d+(.\d+)?(e-?\d+)?)/) {
  $a = $+{a};  $c = $+{c};  $e = $+{e};
  $b = $+{b};  $d = $+{d};  $f = $+{f};
} else {
  die "未対応のtransformです: $transform"
}

# グリフごとに path を格納する変数
my @glyphs = ();
foreach my $row (0 .. $row_max) {
  foreach my $col (0 .. $col_max) {
	$glyphs[$row][$col] = [];
  }
}

# @glyphs にパスを格納
my $paths = $group_outline->{path};
foreach my $path (@$paths) {
  my @data_args = split /\s+/, $path->{d};
  my $new_data = "";
  my ($col, $row);
  my $is_moveto_point = 1;
  my $is_conv_point = 0;
  foreach my $data_arg (@data_args) {
	#if ($data_arg =~ m/((?<A>\w?)\s*)?(?<x>-?\d+(.\d+)?),(?<y>-?\d+(.\d+)?)/) {
	#if ($data_arg =~ m/[A-Z]/) {
	#  $is_moveto_point = 1;
	#}else 
	if ($data_arg =~ m/(?<x>-?\d+(.\d+)?),(?<y>-?\d+(.\d+)?)/) {
	  my $x = $+{x};
	  my $y = $+{y};
	  if ($is_moveto_point) {
	  	print("$x,$y\n");
		$x = $a * $x + $c * $y + $e;
		$y = $b * $x + $d * $y + $f;
		$col = int ($x / PIXELS_PER_EM_COL);
		$row = int ($y / PIXELS_PER_EM_ROW);
		$is_moveto_point = 0;
		$is_conv_point = 100;
		
		print ("$row,$col:$x,$y\n");
	  }
	  if ($is_conv_point){
		$x %= PIXELS_PER_EM_COL;
		$y %= PIXELS_PER_EM_ROW;
#		if(100 == $is_conv_point){
			$is_conv_point = 0;
#		}
	  }
	  $x *= UNITS_PER_EM_COL / PIXELS_PER_EM_COL;
	  $y *= UNITS_PER_EM_ROW / PIXELS_PER_EM_ROW;

	  $data_arg = "$x,$y";
	}
	else{

			
		if ($data_arg =~ m/\d+(.\d+)?/) {
		  if ($is_conv_point){
			print ("NUM:$data_arg\n");
			if (3 == $is_conv_point){
				$data_arg %= PIXELS_PER_EM_ROW;
	#			$y %= PIXELS_PER_EM_ROW;
			}else{
				$data_arg %= PIXELS_PER_EM_COL;
			}
			$is_conv_point = 0;
		  }
		}elsif ($data_arg =~ m/[A-Z]/) {
			if($data_arg =~ m/H/){
			  $is_conv_point = 2;
			}
			elsif($data_arg =~ m/V/){
			  $is_conv_point = 3;
			}
			elsif($data_arg =~ m/L/){
			  $is_moveto_point = 1;
			  $is_conv_point = 1;		
			}
			else{
			  $is_conv_point = 1;
			}
		}
		elsif ($data_arg =~ m/[a-z]/) {
			$is_conv_point = 0;
		}
		else{
			$is_conv_point = 0;
		}
	}
	$new_data .= "$data_arg ";
  } 
  next if ($col < 0 || $col_max < $col || $row < 0 || $row_max < $row);
  $path->{d} = $new_data;
  push @{$glyphs[$row][$col]}, $path;
}

# リスト読み込み
my @glyphname_list = ();
open my $fh_list, '<:utf8', $list_file;
while (my $line = <$fh_list>) {
  chomp $line;
  my @list = map { sprintf "u%04x", (unpack "U*", $_) } split / +/, $line;
  push @glyphname_list, \@list;
}
close $fh_list;

# 各グリフの SVG を生成
mkdir OUT_DIR if !-d OUT_DIR;
foreach my $row (0 .. $row_max) {
  foreach my $col (0 .. $col_max) {
	my $svg;
	$svg->{'xmlns:sodipodi'} = "http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd";
	$svg->{'xmlns:inkscape'} = "http://www.inkscape.org/namespaces/inkscape";
	$svg->{width} = UNITS_PER_EM_COL;
	$svg->{height} = UNITS_PER_EM_ROW;
	$svg->{path} = $glyphs[$row][$col];
	my $svg_string = '<?xml version="1.0" encoding="UTF-8"?>';
	$svg_string .= "\n" . XMLout($svg, RootName => "svg");
	my $glyphname = $glyphname_list[$row][$col];
	next if (!defined $glyphname || $glyphname eq "u3000"); # u3000：全角スペース
	open my $fh_out, '>', OUT_DIR . "/$glyphname.svg";
	print $fh_out $svg_string;
	close $fh_out;
  }
}

exit 0;
