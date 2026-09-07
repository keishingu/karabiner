#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook

SendMode "Input"
SetWorkingDir A_ScriptDir

if A_Args.Length && A_Args[1] = "--validate"
    ExitApp

; -----------------------------------------------------------------------------
; Physical modifier layout
;
; macOS physical key       Windows physical key       Windows behavior
; Command at bottom-left   Left Windows               Ctrl (normal shortcuts)
; Control at Caps position Left Ctrl                  F13 custom layer
; Right Command            Right Windows              F7 (katakana conversion)
; Right Shift              Right Shift                F6 (hiragana conversion)
;
; Left Windows is mapped to Right Ctrl so it remains distinguishable from the
; physical Ctrl used by the custom layer below.
; -----------------------------------------------------------------------------

LCtrl::F13
LWin::RCtrl
RWin::F7
RShift::F6

LayerKeyIsDown() {
    ; LCtrl is the physical key at the Caps position. A physical F13 also works.
    return GetKeyState("LCtrl", "P") || GetKeyState("F13", "P")
}

AnyAltIsDown() {
    return GetKeyState("LAlt", "P") || GetKeyState("RAlt", "P")
}

NoExtraLayerModifierIsDown() {
    return !GetKeyState("LShift", "P")
        && !AnyAltIsDown()
        && !GetKeyState("LWin", "P")
        && !GetKeyState("RWin", "P")
}

LayerAndLeftShiftOnly() {
    return LayerKeyIsDown()
        && GetKeyState("LShift", "P")
        && !AnyAltIsDown()
        && !GetKeyState("LWin", "P")
        && !GetKeyState("RWin", "P")
}

LayerAndCommandOnly() {
    return LayerKeyIsDown()
        && GetKeyState("LWin", "P")
        && !GetKeyState("LShift", "P")
        && !AnyAltIsDown()
        && !GetKeyState("RWin", "P")
}

LayerAndOptionOnly() {
    return LayerKeyIsDown()
        && AnyAltIsDown()
        && !GetKeyState("LShift", "P")
        && !GetKeyState("LWin", "P")
        && !GetKeyState("RWin", "P")
}

PushUnique(items, item) {
    for existing in items {
        if existing = item
            return
    }
    items.Push(item)
}

; Send an exact shortcut without leaking the held layer modifiers into it.
; Physical LCtrl is restored as F13 and physical LWin as RCtrl because of the
; remaps above.
SendClean(keys) {
    heldLogicalModifiers := []

    if GetKeyState("LCtrl", "P")
        PushUnique(heldLogicalModifiers, "F13")
    if GetKeyState("F13", "P")
        PushUnique(heldLogicalModifiers, "F13")
    if GetKeyState("RCtrl", "P")
        PushUnique(heldLogicalModifiers, "RCtrl")
    if GetKeyState("LWin", "P")
        PushUnique(heldLogicalModifiers, "RCtrl")
    if GetKeyState("LShift", "P")
        PushUnique(heldLogicalModifiers, "LShift")
    if GetKeyState("LAlt", "P")
        PushUnique(heldLogicalModifiers, "LAlt")
    if GetKeyState("RAlt", "P")
        PushUnique(heldLogicalModifiers, "RAlt")

    for modifier in heldLogicalModifiers
        Send "{" modifier " up}"

    try {
        Send keys
    } finally {
        for modifier in heldLogicalModifiers
            Send "{" modifier " down}"
    }
}

; Ctrl + Command + Space -> Command + Enter
; On Windows, Command semantics are Ctrl semantics.
#HotIf LayerAndCommandOnly()
*Space::SendClean("^{Enter}")

; Ctrl + Shift + Space -> Shift + Enter
#HotIf LayerAndLeftShiftOnly()
*Space::SendClean("+{Enter}")

; Ctrl + Option + H/L -> word navigation
; Ctrl + Option + A -> paragraph beginning
; Windows uses Ctrl+Arrow where macOS uses Option+Arrow.
#HotIf LayerAndOptionOnly()
*h::SendClean("^{Left}")
*l::SendClean("^{Right}")
*a::SendClean("^{Up}")

; Karabiner Control layer. LCtrl is converted to F13, while LWin is converted to
; the ordinary Windows Ctrl used for copy/paste and other app shortcuts.
#HotIf LayerKeyIsDown() && NoExtraLayerModifierIsDown()
*a::SendClean("{Home}")
*e::SendClean("{End}")
*f::SendClean("{Right}")
*d::SendClean("{Delete}")
*n::SendClean("{Down}")
*p::SendClean("{Up}")
*h::SendClean("{Left}")
*j::SendClean("{Down}")
*k::SendClean("{Up}")
*l::SendClean("{Right}")
*Space::SendClean("{Enter}")
*b::SendClean("{Backspace}")
*x::SendClean("^k")
*i::SendClean("{F2}")
*s::SendClean("#+s")
*1::SendClean("{F1}")
*2::SendClean("{F2}")
*3::SendClean("{F3}")
*4::SendClean("{F4}")
*5::SendClean("{F5}")
*6::SendClean("{F6}")
*7::SendClean("{F7}")
*8::SendClean("{F8}")
*9::SendClean("{F9}")

#HotIf
