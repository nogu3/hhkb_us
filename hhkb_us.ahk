#Requires AutoHotkey v2.0

; Main
; https://www.naporitansushi.com/autohotkey/# 
; official
; https://ahkscript.github.io/ja/docs/v2/Hotkeys.htm#Intro

; use keyboard hook
#UseHook
; This AutoHotkey is auto restart when another AutoHotkey script.
#SingleInstance Force
; working dir is script run dir.
SetWorkingDir A_ScriptDir

; [functions]
; alone and withctrl is keybind.
CombinationCtrl(alone, withctrl) {
    if GetKeyState("Control") {
        Send withctrl
        return 
    }
    
    Send alone
}

; key is valid when single
SinglePress(lastkey, sendkey) {
    KeyWait lastkey
    If (A_PriorKey = lastkey)
    {
        Send sendkey
    }
    return
}

; [single press]
Space:: SinglePress("Space", "{Space}")
!Space:: SinglePress("Space", "!{Space}")
~LControl:: SinglePress("LControl", "{Enter}")

; [key combination]
; allow
Space & j:: CombinationCtrl("{left}", "{home}") 
Space & l:: CombinationCtrl("{right}", "{end}") 
~Space & i::up
~Space & k::down

; delete
~Space & s::backspace
~Space & d::delete

; semicolon and colon
^Enter::Send "{`;}"
+Enter::Send "{`:}"
; for slack
!Enter:: ^Enter

; LAlt -> eisuu
LAlt::Send "{vk1Dsc07B}"

; RAlt -> kana
RAlt::Send "{vk1Csc079}"

; numbers
RAlt & w::Send "{1}"
RAlt & e::Send "{2}"
RAlt & r::Send "{3}"
RAlt & s::Send "{4}"
RAlt & d::Send "{5}"
RAlt & f::Send "{6}"
RAlt & x::Send "{7}"
RAlt & c::Send "{8}"
RAlt & v::Send "{9}"
RAlt & a::Send "{0}"

; [system]
; alt tab
LAlt & w::AltTab

; screen lock
; https://stackoverflow.com/questions/42314908/how-can-i-lock-my-computer-with-autohotkey
^r::DllCall("LockWorkStation")

; shift + alt + space is undefine for vscode shortcut
!+Space::return

; screen shot
^+s::#+s