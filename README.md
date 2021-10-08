# kuvsconfig
Visual Studio Code セットアップスクリプト (Linux)

## 年次更新手順

1. root権限で:
    - 昨年度の /usr/local/share/kuvsconfig が存在しない場合
    ```
    % cd /usr/local/share
    % git clone https://github.com/nisshymura/kuvsconfig.git
    % cd kuvsconfig 
    ```
    - 昨年度の /usr/local/share/kuvsconfig が存在する場合
    ```
    % cd /usr/local/share/kuvsconfig
    % git pull
    ```
2. Visual Studio Code のパッケージダウンロードサイト https://marketplace.visualstudio.com/VSCode より必要な拡張機能の最新版を検索してダウンロードする。
    - 各拡張機能の'Download Extension'のリンクからVSIXファイルをダウンロード
4. ダウロードしたVSIXファイルを、VDI の /usr/local/share/kuvsconfig/extensions/ 配下にコピー。(古いVSIXファイルがあれば削除)
3. スクリプトファイル vsconfig.sh 中の pkglist 変数で列挙しているVSIXファイル名を新しくダウンロードしたVSIXファイル名で置き換える。
4. スクリプト vsconfig.sh 中の変数 ROOTDIR が /usr/local/share/vsconfig に設定されていることを確認。
5. スクリプトファイル /usr/local/share/vsconfig/vsconfig.sh に実行権限を与える。
5. スクリプトファイル /usr/local/share/vsconfig/vsconfig.sh を /usr/local/bin/vsconfig.sh としてsymbolic link (/usr/local/bin に古いスクリプトファイルがあれば削除する)
6. Terminal で kuvsconfig.sh スクリプトを実行すればうまく動作するはず。
