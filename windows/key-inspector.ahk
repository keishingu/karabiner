#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent
InstallKeybdHook()

if A_Args.Length && A_Args[1] = "--validate"
    ExitApp

MsgBox(
    "調べたいキーを何度か押した後、Key history画面でF5を押してください。"
    . "`n`nVK/SC欄が実際の仮想キー／スキャンコードです。"
    . "`nこの確認ツールを終了するには Ctrl+Alt+Esc を押します。",
    "JIS keyboard key inspector"
)

KeyHistory(100)

F12::KeyHistory(100)
^!Esc::ExitApp()
