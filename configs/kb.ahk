#Requires AutoHotkey v2.0

CapsLock & *:: Return
CapsLock:: Send "{Esc}"

CapsLock & Esc:: 
{
    SetCapsLockState (GetKeyState("CapsLock", "T")) ? "Off" : "On"
    return
}

; copypaste
CapsLock & u:: Send "^c"
CapsLock & i:: Send "^v" 

; yfgcrl/
CapsLock & y:: Return
CapsLock & f:: Return
CapsLock & g:: Send "{[}"
CapsLock & c:: Send "{{}"
CapsLock & r:: Send "{}}"
CapsLock & l:: Send "{]}"
CapsLock & /:: Send "{?}"

; idhtns
; CapsLock & i:: Send "{Home}"
CapsLock & d:: Send "{Left}"
CapsLock & h:: Send "{Down}"
CapsLock & t:: Send "{Up}"
CapsLock & n:: Send "{Right}"
CapsLock & S:: Send "{End}"

; bmwvz
CapsLock & b:: Send "{#}"
CapsLock & m:: Send "{%}"
CapsLock & w:: Send "{&}"
CapsLock & v:: Send "{$}"

; ',.
CapsLock & ':: Send "!{F4}"
CapsLock & ,:: Send "^{F4}"

CapsLock & z::
Capslock & =:: Send "^/"

;--- alt key mods
#HotIf GetKeyState("Alt")
CapsLock & d:: Send "!{Left}"
CapsLock & h:: Send "!{Down}"
CapsLock & t:: Send "!{Up}"
CapsLock & n:: Send "!{Right}"
CapsLock & /:: Send "{!}"
#HotIf

;--- shift key mods
#HotIf GetKeyState("Shift")
CapsLock & d:: Send "+{Left}"
CapsLock & h:: Send "+{Down}"
CapsLock & t:: Send "+{Up}"
CapsLock & n:: Send "+{Right}"
#HotIf

;--- ctrl key mods
#HotIf GetKeyState("Ctrl")
CapsLock & d:: Send "^{Left}"
CapsLock & h:: Send "^{Down}"
CapsLock & t:: Send "^{Up}"
CapsLock & n:: Send "^{Right}"
#HotIf

~LShift::
{
    KeyWait("LShift")
    If (A_TimeSinceThisHotkey < 300 and A_PriorKey = "LShift") {
        Send "("
    }
    return
}

~RShift::
{
    KeyWait("RShift")
    If (A_TimeSinceThisHotkey < 300 and A_PriorKey = "RShift") {
        Send ")"
    }
    return
}

SC029::
{
    KeyWait("SC029")
    If (A_TimeSinceThisHotkey < 300 and A_PriorKey = "``") {
        SendInput "``"
    }
    return
}

SC029 & Space:: Send "0"
SC029 & g:: Send "7"
SC029 & c:: Send "8"
SC029 & r:: Send "9"
SC029 & h:: Send "4"
SC029 & t:: Send "5"
SC029 & n:: Send "6"
SC029 & m:: Send "1"
SC029 & w:: Send "2"
SC029 & v:: Send "3"
SC029 & z:: Send "."

!SC029:: Send "!{SC029}"
^SC029:: Send "^{SC029}"
+SC029:: Send "+{SC029}"
