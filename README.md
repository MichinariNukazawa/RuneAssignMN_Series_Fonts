RuneAssignMN Series Fonts. イラスト・デザイン向けルーン文字フォント
====

##概要
イラスト制作で簡単に使えるように作られたルーン文字のフォントです。  

ラテン・アルファベットの"A〜z"にルーン文字を割り当ててあります。  
ふつうの英文にこのフォントを使用するだけで、簡単にルーンで書かれた文章を"でっちあげる"ことができます。  

フォントのデザインは[サンプル][ghpages_index]ページで見ることができます。  
また、[ブログ記事][blog_article]が用意される予定です。  


##より専門的な説明
A-z以外の記号を含むLatin1の領域は半角空白で埋めてあるため、記号はすべて空白になり表示されません。  
これは、ライセンスフリーな英文の長文を用意すれば、本フォントを適用するだけで、ルーン文字のみで書かれた文に見える絵が作れるということです。  
ライセンスフリーな英文に適用すればルーン文字のみで書かれた文に見える絵を用意することができます。  
ただし、一部環境でデフォルトのフォントによる通常の記号に置き換わってしまう問題を確認しています。  
(Gimp2.8にて確認)  

本フォントは、A〜zを入力するだけで手軽にルーン文字が使えるよう作成されました。  
ルーン文字に割り当てられているユニコード領域にはグリフを置いていません。  
また、すべてのルーン文字を収録していません。(ルーン文字は83文字ありますが、今回フォントに収録したのは26文字です。)  

参考：ラテン・アルファベット領域のアルファベットと記号  
!"#$%&'()*+,-./  
0123456789:;<=>?  
@ABCDEFGHIJKLMNO  
PQRSTUVWXYZ[¥]^_  
`abcdefghijklmno  
pqrstuvwxyz{|}‾  

##フォントのライセンス
大まかな説明：  
 イラスト・デザインに自由に使うことができます。ただし、責任は使用者が負うこととします。  
 また、フォントそのものを再配布する場合は、かならずライセンス・取得元URL・フォント追加を含めてアップデートされる場合がある旨を表記してください。  
 使用・紹介してくださったことを事後連絡していただけると嬉しいです(もちろん、これは義務ではありません)。  
 ライセンスは予告なく変更される場合があります  
(というか、わかりやすく整理する予定です。  
 が、絵かきの方は気にせず自由に使ってください)。  
 素材元としての記載・見本・献本も喜びます(もちろん、これも義務ではありません)。  


詳しい説明:  
 使用者は以下の２つから選択することができます。  
　1. 2条項BSDライセンス(2-clause BSD license)  
　または  
　2. イラストで使用したフォントについて明記しない場合などはこちら。  
　 フォント作者が負うこととなる責任を使用者が負うことを条件として、2条項BSDライセンスから下記の条項を取り除いたもの。  
　  「バイナリ形式で再頒布する場合、頒布物に付属のドキュメント等の資料に、上記の著作権表示、本条件一覧、および下記免責条項を含めること。」  
　  2条項BSDライセンスが破られていた場合、自動的にこちらのライセンスが適用されるものとする。  

どちらの場合も、画像(.jpgなど)およびフォントのバイナリを含む画像生成データ(.aiファイルなど)は「バイナリ形式」として扱います。  
また同じく、どちらの場合も、フォントファイルは「ソースコード形式」として扱います  


##フォント以外のライセンス
2条項BSDライセンス(2-clause BSD license)  
ただし、スクリプトは  
『mashabow＠しろもじ作業室（http://shiromoji.net, mashabow@shiromoji.net）』  
様の公開してくださっているスクリプトを元に作成したものです。  
この部分のライセンスについては「不明」です。  
また、[サンプル][ghpages_index]で使用している画像は、このフォントを紹介する際は自由に使ってください。  


##フォント制作手順
全自動ではなく、手作業が含まれています。  
作業環境はIllustraterを除いてLinux(Ubuntu14.04)を想定しています。  
 * Illustraterでフォントデザイン
 * Illustrater上でアウトライン化
 * SVG分割スクリプト(half_split_svg.pl)で分割可能になるようInkScapeでSVGを加工
 * SVGファイルを分割
 * グリフSVGファイルの入ったディレクトリを"glyph_${フォント名}"にリネーム
 * グリフ生成スクリプト(generate_rune.pe)でフォントを生成
 (または一括呼び出しスクリプト(generate_runes.sh)を起動してフォントを生成)  
詳細は[ブログ記事][blog_article](予定)を参照してください。  

##謝辞
以下のサイトを参考にさせていただきました。  

しろもじ作業室 の日本語かなフォント作成記事とスクリプト  
http://d.hatena.ne.jp/mashabow/20120314/1331744357

FontForge 公式ドキュメント  
http://fontforge.org/ja/

ルーン文字のUnicode表  
http://www.unicode.org/charts/PDF/U16A0.pdf

B.F.ジョンソン式の割り当て表  
http://seesaawiki.jp/w/qvarie/d/%B3%C8%C4%A5%A5%EB%A1%BC%A5%F3%CA%B8%BB%FA
http://lingua.melroch.se/modern_english_runes.pdf

Wikipedia のルーン文字の記事  
http://ja.wikipedia.org/wiki/%E3%83%AB%E3%83%BC%E3%83%B3%E6%96%87%E5%AD%97

Deciphering the runes 研究ページ  
http://wiki.puella-magi.net/Deciphering_the_runes

IllustraterABC TIPSページの補填記事のIllustraterの設定  
http://www.slowgun.org/abc/ts12.html



##BSDライセンス

Copyright (c) 2014, Michinari Nukazawa  
All rights reserved.  
ソースコード形式かバイナリ形式か、変更するかしないかを問わず、以下の条件を満たす場合に限り、再頒布および使用が許可されます。  

 * ソースコードを再頒布する場合、上記の著作権表示、本条件一覧、および下記免責条項を含めること。
 * バイナリ形式で再頒布する場合、頒布物に付属のドキュメント等の資料に、上記の著作権表示、本条件一覧、および下記免責条項を含めること。

本ソフトウェアは、著作権者およびコントリビューターによって「現状のまま」提供されており、明示黙示を問わず、商業的な使用可能性、および特定の目的に対する適合性に関する暗黙の保証も含め、またそれに限定されない、いかなる保証もありません。著作権者もコントリビューターも、事由のいかんを問わず、 損害発生の原因いかんを問わず、かつ責任の根拠が契約であるか厳格責任であるか（過失その他の）不法行為であるかを問わず、仮にそのような損害が発生する可能性を知らされていたとしても、本ソフトウェアの使用によって発生した（代替品または代用サービスの調達、使用の喪失、データの喪失、利益の喪失、業務の中断も含め、またそれに限定されない）直接損害、間接損害、偶発的な損害、特別損害、懲罰的損害、または結果損害について、一切責任を負わないものとします。  


Copyright (c) 2014, Michinari Nukazawa  
All rights reserved.  

Redistribution and use in source and binary forms, with or without  
modification, are permitted provided that the following conditions are met:  

1. Redistributions of source code must retain the above copyright notice,  
   this list of conditions and the following disclaimer.  
2. Redistributions in binary form must reproduce the above copyright notice,  
   this list of conditions and the following disclaimer in the documentation  
   and/or other materials provided with the distribution.  

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND  
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED  
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE  
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR  
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES  
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;  
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND  
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT  
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS  
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.  

##LICENSE About
Select to 2-clause BSD license or other.  
"other" to please read Japanese license text.  

##連絡先
michinari.nukazawa@gmail.com

[ghpages_index]: http://michinarinukazawa.github.io/RuneAssignMN_Series_Fonts/
[blog_article]: http://blog.michinari-nukazawa.com/
