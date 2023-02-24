; Main FYI
; https://www.naporitansushi.com/autohotkey/# 
; official
; https://sites.google.com/site/autohotkeyjp/reference/Introduction

; 実行中のスクリプトがもうひとつ起動されたとき、自動的に既存のプロセスを終了して新たに実行開始する
#SingleInstance, Force
; Send、SendRaw、Click コマンドおよび Mouse 系コマンドを処理する際に、システムに一連の操作イベントをまとめて送り込む. inputモード=最速
SendMode Input
; スクリプトの作業ディレクトリを実行スクリプトが置いてあるディレクトリにする
SetWorkingDir, %A_ScriptDir%

Space::
    KeyWait, Space, T0.2
    If (ErrorLevel == 0){
        Send, {Space}
        return
    }
    return
   
;allow
~Space & i::Send, {up}
~Space & k::Send, {down} 

;https://tex2e.github.io/blog/keyboard/ahk-triple-key
;left or Home
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

;ime on/off FYI
;https://dtptransit.design/misc/windows/customize-keyboards-for-Japanese-input-method.html

;LAlt -> eisuu
LAlt::Send, {vk1Dsc07B}

;RAlt -> kana
RAlt::Send, {vk1Csc079}

; alt tab menu FYI
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
