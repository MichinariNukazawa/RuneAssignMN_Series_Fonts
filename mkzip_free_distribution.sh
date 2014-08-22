#!/bin/bash
#
# フリー配布版（BOOTH配布用)zipファイルを生成する
#
# (Widnows用に、ファイル名がCP932で格納されたzipを生成する。
#  必要: sudo apt-get install convmv -y)


ThisPath=$(cd $(dirname $0);pwd)

# 引数の個数をチェック
if [ 2 -ne $# ] ; then
	echo "error: invalid args: \"$@\"(num:$#)" 1>&2
	# "example: ./mkzip_free.sh RuneAssignMN 1.20140809235940"
	echo "Usage: ./(this) FontSeriesName Version"
	exit 1
fi

# エンコーディング変換コマンド(ファイル名)の有無を確認
convmv --help > /dev/null
RET=$?
if [ 1 -ne $RET ] ; then
	echo "error: call convmv:$RET" 
	exit $RET
fi

# フォント名
FontSeriesName=$1
# フォントのバージョン番号
Version=$2


nameZip="${FontSeriesName}_free_ver${Version}"

cd "$ThisPath"
echo  "$ThisPath"

# 再配布ファイルをディレクトリに集める
rm -f "$nameZip.zip"
mkdir "$nameZip"
for i in "$FontSeriesName*.otf" ; do cp $i "$nameZip/" ; done
cp "RuneToAssignLatinList.jpg" "$nameZip/"
cp "RuneAssignMNシリーズフォントフリー版_ライセンス.txt" "$nameZip/"
# zipする前に、ファイル名をCP932でエンコーディング変換する
convmv -f utf8 -t cp932 -r --notest "$nameZip/"
pushd "$nameZip/"
zip -9 -r "../$nameZip.zip" *
popd
rm -rf "$nameZip"


