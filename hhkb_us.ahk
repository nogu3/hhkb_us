; Main
; https://www.naporitansushi.com/autohotkey/# 
; official
; https://sites.google.com/site/autohotkeyjp/reference/Introduction

; 実行中のスクリプトがもうひとつ起動されたとき、自動的に既存のプロセスを終了して新たに実行開始する
#SingleInstance, Force
; Send、SendRaw、Click コマンドおよび Mouse 系コマンドを処理する際に、システムに一連の操作イベントをまとめて送り込む. inputモード=最速
SendMode Input
; スクリプトの作業ディレクトリを実行スクリプトが置いてあるディレクトリにする
SetWorkingDir, %A_ScriptDir%

; exclude fortnite
#IfWinActive, FortniteClient-Win64-Shipping.exe
Return
#IfWinActive

; delay single space
Space::
    KeyWait, Space, T0.2
    If (ErrorLevel == 0){
        Send, {Space}
        return
    }
    return

; delay alt + space(for command rancher)
!Space::
    KeyWait, Space, T0.2
    If (ErrorLevel == 0){
        Send, !{Space}
        return
    }
    return
   
;allow
Space & i::
  ; vscode settings
  if GetKeyState("LShift") && GetKeyState("LAlt") {
    Send, +!{up}
    return
  }

  if GetKeyState("LAlt") {
    Send, !{up}
    return
  }

  Send, {up} 
  return

Space & k::
  ; vscode settings
  if GetKeyState("LShift") && GetKeyState("LAlt") {
    Send, +!{down}
    return
  }

  if GetKeyState("LAlt") {
    Send, !{down}
    return
  }

  Send, {down} 
  return

;left or Home
;https://tex2e.github.io/blog/keyboard/ahk-triple-key
Space & j::
  if GetKeyState("LControl") {
    Send, {home}
    return
  }
  Send {left}
  return

; right or End　
Space & l:: 
  if GetKeyState("LControl") {
    Send, {end}
    return
  }
  Send {right}
  return

;delete  
~Space & s::Send, {backspace} 
~Space & d::Send, {delete}

;semicolon 
^Enter::Send, {`;}
+Enter::Send, {`:}

;ime on/off
;https://dtptransit.design/misc/windows/customize-keyboards-for-Japanese-input-method.html

;LAlt -> eisuu
LAlt::Send, {vk1Dsc07B}

;RAlt -> kana
RAlt::Send, {vk1Csc079}

; number
RAlt & w::Send, {1} 
RAlt & e::Send, {2}
RAlt & r::Send, {3}
RAlt & s::Send, {4}
RAlt & d::Send, {5}
RAlt & f::Send, {6}
RAlt & x::Send, {7}
RAlt & c::Send, {8}
RAlt & v::Send, {9}
RAlt & a::Send, {0}

; screen lock
; https://stackoverflow.com/questions/42314908/how-can-i-lock-my-computer-with-autohotkey
^r::DllCall("LockWorkStation")

; alt tab menu
; https://zenn.dev/eetann/articles/2020-12-24-my-ahk-script

<!w::
  Send !^{Tab}
  IsAltTabMenu := true
  return

#If (IsAltTabMenu)
    s::Send {Left}
    d::Send {Down}
    e::Send {Up}
    f::Send {Right}
    a::
        Send {Enter}
        IsAltTabMenu := false
    Return
    Space::
        Send {Space}
        IsAltTabMenu := false
    Return
    Esc::
        Send {Esc}
        IsAltTabMenu := false
    LButton::
        Send {LButton}
        IsAltTabMenu := false
#If
