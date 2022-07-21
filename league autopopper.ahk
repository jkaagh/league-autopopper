#Requires AutoHotkey v2.0-beta
Coordmode("Mouse", "Screen")

MyGui := Gui(, "League Autopopper")
MyGui.MarginX := 20
MyGui.MarginY := 20
MyGui.Add("Text",, "Now waiting for queue... Check the box when you are in champ select or ingame.")
MyGui.MarginY := 0
MyGui.Add("Text",, "Make sure the league client is not the active window.")
MyGui.MarginY := 20
guiCheckbox := MyGui.Add("Checkbox", "vCheckbox", "Disabled.")

MyGui.Show()
MyGui.OnEvent("Close", closeapp)

closeapp(asdf) {
    ExitApp
}

while(true){
    Sleep(500)


    ; if league is active and not disabled
    if(WinActive("League of Legends") && guiCheckbox.value == 0){
        Sleep(2000)

        MoveMouse()
        Click()
        WinActivate("Title of Window")
    }
}

MoveMouse()
{
    WinGetPos(&xPos, &yPos, &xWidth, &yWidth, "League of Legends")

    x := xWidth / 2
    y := yWidth * 0.8
    MouseMove(xPos, yPos)
    MouseMove(x, y, 0, "R")
}