# vscode (windows) で processing 環境を作る

1. `scoop install processing`
2. 拡張を入れる

```
名前: Processing Language
ID: tobiah.language-pde
説明: Processing Language Support for VSCode
バージョン: 1.4.6
パブリッシャー: Tobiah Zarlez
VS Marketplace リンク: https://marketplace.visualstudio.com/items?itemName=Tobiah.language-pde
```

3. パスを通す
<!-- 永続するっぽい -->

```powershell
$ENV:Path="~\scoop\apps\processing\3.5.4\processing-java.exe;"+$ENV:Path
```

4. 実行方法は、そのスクリプトを開いて、Ctrl + Shift + B
5. ライブラリを追加するには、`processing.exe` で GUI からライブラリを追加する。本体の方に追加される。
