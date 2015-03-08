;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Copyright: 2015 Samuel Denton, III <samwyse@gmail.com>
;
; Script Function:
;	Template script ([color=red]you can customize this template by editing
;       "ShellNew\Template.ahk" in your Windows folder[/color])
;
; Licensed under the GNU GENERAL PUBLIC LICENSE, Version 2, June 1991
; See the included LICENSE file, or visit www.fsf.org
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.


DelayFor1 := 0
Saving := 0
NumberOfArguments := 0
CmdLine := ""

NumberOfParameters = %0%
Loop, %NumberOfParameters%
{
	if ( Saving = 0 ) {
		FoundPos := RegExMatch(%A_Index%, "^[-/](\w+)(.*)", SubPat)
		if ( FoundPos = 0 ) {
			Saving = 1
		} else {
			NumberOfArguments := NumberOfArguments + 1
			if ( IsLabel( SubPat1 ) )
				GoSub %SubPat1%
		}
	}
	; Note: we can't use 'else' here
	if ( Saving = 1 ) {
		if ( InStr( %A_Index%, A_Space ) ) {
			CmdLine := CmdLine . """" . %A_Index% . """" . A_Space
		} else {
			CmdLine := CmdLine . %A_Index% . A_Space
		}
	}
}

if CmdLine {
	Sleep 1000 * DelayFor1
	Run, %CmdLine%
} else {
}

return

help:
h:
MsgBox,
(
Delay running a program or command until certain conditions are met.

WAITFORIT [command/program] [parameters]

WAITFORIT [/DELAY[:seconds]]
	[command/program] [parameters]
)

return

delay:
FoundPos := RegExMatch(SubPat2, "^[:=](\d+)$", DelayFor)
if ( FoundPos = 0 )
	DelayFor1 := 30
return
