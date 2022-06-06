#!/bin/bash

###  Visual Studio Code 初期設定ツール

##### !!!!!!  このツールの場所を置き換えたとき、要設定変更 #########################
#ROOTDIR=$HOME/vsconfig
ROOTDIR=/usr/local/share/vsconfig

## !!!!!! 拡張機能は各機能を予め  https://marketplace.visualstudio.com/VSCode
## !!!!!! から検索し、[Download Extension] VSIX 形式でダウンロードして extensions/ 以下に配置しておく。

## インストール希望 パッケージ名 (5個)
## C/C++, C/C++ Advanced Lint, LaTeX Workshop, Highlight Bad Chars, Error Lens

## !!!!!! インストールするVSIXファイル名は以下に1行ずつ列挙しておく。
## !!!!!! とりあえずテスト用に古いエントリーが入れてあるので、これは最新版に置き換え。
pkglist=(
James-Yu.latex-workshop-8.2.0.vsix 
)


#### ここから下は変更の必要はないはず #########################################################

## default path to vscode setting file 'settings.json'
VSEXTDIR=$HOME/.vscode/extensoins
VSCONFDIR=$HOME/.config/Code/User

## Path to extension files & JSON files
EXTDIR=$ROOTDIR/extensions
CONFDIR=$ROOTDIR/JSON

# 拡張パッケージの追加は、以下のvscodeコマンドライン起動による。
# https://code.visualstudio.com/docs/editor/extension-gallery#_command-line-extension-management
# code --extensions-dir <dir>
#     Set the root path for extensions.
# code --list-extensions
#     List the installed extensions.
# code --show-versions
#     Show versions of installed extensions, when using --list-extension.
# code --install-extension (<extension-id> | <extension-vsix-path>)
#     Installs an extension.
# code --uninstall-extension (<extension-id> | <extension-vsix-path>)
#     Uninstalls an extension.
# code --enable-proposed-api (<extension-id>)
#     Enables proposed API features for extensions. Can receive one or more extension IDs to enable individually.


echo "[[[Visual Studio Code 初期設定ツール (Version 0.2)]]]"

pgrep -u $USER -c -x code >& /dev/null
if [ $? -eq 0 ]; then
    echo "Error!!! Visual Studio Code が実行中のようです．Visual Studio Codeを終了し，このウィンドウを閉じた後で再度試みてください．"
    exit 5;
fi

echo ">>> 拡張パッケージを更新し，設定ファイルを更新・バックアップします．<<<"
echo "実行してよろしいですか？ [y/n]"
read ANSWER

case $ANSWER in
    "Y" | "y" | "yes" | "Yes" | "YES" ) echo ">>> 初期設定を始めます．終了までしばらくこのままお待ちください... <<<";;
    * ) echo ">>> 初期設定をキャンセルしました．このウィンドウを閉じてください．<<<"; exit 1;;
esac
    
stamp=`date '+%Y%m%d-%H%M%S'`  # time stamp

if [ -d $VSEXTDIR ]; then
    mv -f $VSEXTDIR ${VSEXTDIR}-${stamp}
    mkdir $VSEXTDIR
    echo "+ 旧拡張パッケージフォルダ ${VSEXTDIR} は ${VSEXTDIR}-${stamp}.json にバックアップされました．"
fi

for i in ${pkglist[@]}; do
    if [ -f $EXTDIR/$i ]; then
        echo "++ 拡張パッケージ ${i} を更新しています..."
        code --install-extension $EXTDIR/$i 
    else
        echo "Error!!! 拡張パッケージ ${i} が見つかりません．"
        exit 2;
    fi
done

if [ -f $VSCONFDIR/settings.json ]; then
    mv -f $VSCONFDIR/settings.json  $VSCONFDIR/settings-${stamp}.json
    echo "+ 旧設定ファイル ${VSCONFDIR}/settings.json は ${VSCONFDIR}/settings-${stamp}.json にバックアップされました．"
fi

if [ -f ${CONFDIR}/settings.json ]; then
    cp -f ${CONFDIR}/settings.json $VSCONFDIR
    echo "+ 設定ファイル ${VSCONFDIR}/settings.json を更新しました．"
else 
    echo "Error!!! 設定ファイル settings.json の更新版が見つかりません．"
    exit 2;
fi

echo ">>> 初期設定が正常に終了しました．このウィンドウを閉じてください．<<<"
exit 0
