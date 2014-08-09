#!/bin/bash
#
# 連続Runeフォント生成スクリプト (generate.pe呼び出しスクリプト)

ThisPath=$(cd $(dirname $0);pwd)

# グリフ名一覧
FontNames=('RuneAssignMN_Sans' 'RuneAssignMN_SansHumanicLike' 'RuneAssignMN_Serif')
# バージョン番号 "mejour.minor" (minor = build date time per second)
Version="1.$(date '+%Y%m%d%H%M%S')"

for FontName in ${FontNames[@]}; do
	fontforge -script "$ThisPath/generate_rune.pe" $FontName $Version
done


