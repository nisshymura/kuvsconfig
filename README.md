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
3. ダウロードしたVSIXファイルを、VDI の /usr/local/share/kuvsconfig/extensions/ 配下にコピー。(古いVSIXファイルがあれば削除)
4. スクリプトファイル vsconfig.sh 中の pkglist 変数のリストにダウンロードしたVSIXファイル名を列挙(1ファイル1行。古いファイル名は削除。)
5. スクリプト vsconfig.sh 中の変数 ROOTDIR が /usr/local/share/vsconfig に設定されていることを確認。
6. スクリプトファイル /usr/local/share/vsconfig/vsconfig.sh に実行権限を与える。
7. スクリプトファイル /usr/local/share/vsconfig/vsconfig.sh を /usr/local/bin/vsconfig.sh としてsymbolic link (/usr/local/bin に古いスクリプトファイルがあれば削除する)
8. Terminal で vsconfig.sh スクリプトを実行すればうまく動作するはず。
