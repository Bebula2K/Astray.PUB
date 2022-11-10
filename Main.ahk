#SingleInstance,Force
#IfWinActive Minecraft
#NoTrayIcon

;Used for AutoPearl to select the hotbar to select after throwing pearl;
Hotbar := "1|2|3|4|5|6|7|8|9"

Scrolling_Text := "--Astray.PUB---"
X1 := -120


;Main GUI;
;-----------------------;
Gui, +AlwaysOnTop
Gui, font,cPurple s12, Consolas
Gui,show, w250 h250, Astray.PUB
Gui,color,Black
;-----------------------;

;GUI elements
;-----------------------;'
Gui,add,checkbox,cPurple x0 y30 vAuto_Anchor gAutoAnchor, Auto Anchor

Gui,add,checkbox,cPurple x0 y50 vAuto_Pearl gAutoPearl, Auto Pearl

gui,add,DropDownList,cPurple x125 y45 w20 h300 vDDL1 gAutoPearl, %Hotbar%

Gui,add,text,cPurple x%X1% y0 vMovingText, %Scrolling_Text%

Gui,add,checkbox,cPurple x0 y70 vAuto_Pot gAutoPot, Auto Pot


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
if(X1>=250)
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
;-----------------------;

;CheckBox keybinds;
;-----------------------;
#If Auto_Anchor
q::
Send {8}
MouseClick, Right
Send {9}
MouseClick, Right
Send {8}
MouseClick, Right
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
Send {9}
MouseClick, Right
MouseMove, 0, 100, 1, R
return

#If Start_Moving
return
;-----------------------;


GuiClose:
ExitApp