#SingleInstance,Force
#IfWinActive Minecraft
#NoTrayIcon

;Used for AutoPearl to select the hotbar to select after throwing pearl;
Hotbar := "1|2|3|4|5|6|7|8|9"


Scrolling_Text := "--Astray.PUB---"
ScriptText1 := "*******************|1.9+ scripts|***********************"
ScriptText2 := "*****************|Additional scripts|***********************"
X1 := -120
Killsay := "Sit"


;Main GUI;
;-----------------------;
Gui, +AlwaysOnTop
Gui, font,cPurple s12, Consolas
Gui,show, w500 h500, Astray.PUB
Gui,color,Black
;-----------------------;

;GUI elements
;-----------------------;'
Gui,add,checkbox,cPurple x0 y60 vAuto_Anchor gAutoAnchor, Auto Anchor

Gui,add,checkbox,cPurple x0 y80 vAuto_Pearl gAutoPearl, Auto Pearl

gui,add,DropDownList,cPurple x125 y75 w20 h300 vDDL1 gAutoPearl, %Hotbar%

Gui,add,text,cPurple x%X1% y0 vMovingText, %Scrolling_Text%

Gui,add,checkbox,cPurple x0 y100 vAuto_Pot gAutoPot, Auto Pot

Gui,add,text,cPurple x0 y30, %ScriptText1%

Gui,add,text,cPurple x0 y250, %ScriptText2%

Gui,add,checkbox, x0 y120 vKill_Say gKillSay, KillSay


gosub, Start_Moving
;-----------------------;

;G-labels\subtasks;
;-----------------------;
AutoAnchor:
Gui, Submit, NoHide
return

AutoPearl:
Gui, Submit, NoHide
return

Start_Moving:
Gui,Submit,NoHide
Loop{
X1 ++
if(X1>=500)
    {
        X1:= -120
        GuiControl,Move,MovingText,x%X1%
    }
    else
    {
    GuiControl,Move,MovingText,x%X1%
    }
    Sleep, 10
}

return

AutoPot:
Gui, Submit, NoHide
return

KillSay:
Gui, Submit, NoHide
return

;-----------------------;

;CheckBox keybinds;
;-----------------------;
#If Auto_Anchor
q::
Send {8}
MouseClick, Right
Sleep, 30
Send {9}
MouseClick, Right
Sleep, 30
Send {8}
MouseClick, Right
Sleep, 30
return

#If Auto_Pearl
MButton::
Send {6}
MouseClick, Right
Send  {%DDL1%}
return

#If Auto_Pot
v::
MouseMove, 0, -100, 1, R
Send {8}
MouseClick, Right
Sleep, 30
Send {9}
MouseClick, Right
Sleep, 30
MouseMove, 0, 100, 1, R
return

#If Kill_Say
;Ajust chat keybind as needed;
g::
Send, b
Sleep, 100
Send, %KillSay%
Send, {Enter}
return

#If Start_Moving
return

;-----------------------;


GuiClose:
ExitApp
