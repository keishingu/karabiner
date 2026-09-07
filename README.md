# Keyboard mappings

macOSのKarabiner-Elements設定と、WindowsのAutoHotkey v2設定を同じリポジトリで管理します。

## Windows

`windows/karabiner.ahk` は、JISキーボード上の次の物理配置を前提にしています。

| 物理位置 | Windowsから見えるキー | 動作 |
| --- | --- | --- |
| 左下（macOSではCommand） | 左Win | WindowsのCtrl（通常のコピー、貼り付けなど） |
| CapsLockによく使われる位置 | 左Ctrl | F13に変換し、KarabinerのControlレイヤーとして使用 |
| 右下（macOSでは右Command） | 右Win | F7（カタカナ変換） |
| 右Shift | 右Shift | F6（ひらがな変換） |

主なControlレイヤーは以下です。

| 入力 | 出力 |
| --- | --- |
| Ctrl + H/J/K/L | ←/↓/↑/→ |
| Ctrl + A/E | 行頭/行末 |
| Ctrl + F | →（1文字進む） |
| Ctrl + D | Delete |
| Ctrl + N/P | ↓/↑ |
| Ctrl + Tab | Ctrl + Tab（次のタブ） |
| Ctrl + Shift + Tab | Ctrl + Shift + Tab（前のタブ） |
| Ctrl + Space | Enter |
| Ctrl + Shift + Space | Shift + Enter |
| Ctrl + 左Win + Space | Ctrl + Enter |
| Ctrl + B | Backspace |
| Ctrl + X | Ctrl + K |
| Ctrl + I | F2 |
| Ctrl + S | Win + Shift + S（範囲スクリーンショット） |
| Ctrl + 1〜9 | F1〜F9 |
| Ctrl + Alt + H/L | Ctrl + ←/→（単語移動） |
| Ctrl + Alt + A | Ctrl + ↑（段落先頭方向） |

### 起動

AutoHotkey v2をインストールした状態で `windows/karabiner.ahk` をダブルクリックします。
ログイン時に自動起動する場合は、`Win + R` → `shell:startup` で開いたフォルダに、このファイルのショートカットを置きます。

### キーを調べる

`windows/key-inspector.ahk` を起動し、調べたいキーを押してからKey history画面で `F5` を押します。表示される `VK` と `SC` で、キートップ表記ではなくWindowsが実際に受け取ったキーを確認できます。`Ctrl + Alt + Esc` で終了します。

## macOS

Karabiner-Elementsでは `karabiner.json` を使用します。macOS側の修飾キー配置（左下をCommand、CapsLock位置をControl）はKarabiner設定外のため、OSまたはキーボード本体側でも設定してください。
