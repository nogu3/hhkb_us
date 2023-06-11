#Requires AutoHotkey v2.0

; Main
; https://www.naporitansushi.com/autohotkey/# 
; official
; https://ahkscript.github.io/ja/docs/v2/Hotkeys.htm#Intro

; 実行中のスクリプトがもうひとつ起動されたとき、自動的に既存のプロセスを終了して新たに実行開始する
#SingleInstance Force
; Send、SendRaw、Click コマンドおよび Mouse 系コマンドを処理する際に、システムに一連の操作イベントをまとめて送り込む. inputモード=最速
SendMode "Input"
; スクリプトの作業ディレクトリを実行スクリプトが置いてあるディレクトリにする
SetWorkingDir A_ScriptDir

; alt tab
LAlt & w::AltTab