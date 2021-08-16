HotKeySet("p", "start")
HotKeySet("{ESC}", "end")

while 1
   Sleep(50)
WEnd

Func _RoundDown($nVar, $iCount)
    Return Round((Int($nVar * (10 ^ $iCount))) / (10 ^ $iCount), $iCount)
EndFunc

Func start()
   Global $bet_Amt = 0.00013000
   ; Set the bet amount
   MouseClick("LEFT", 218, 274, 1, 1)
   Sleep(1000)
   Send($bet_Amt)
   Sleep(1000)
   ; Click the Start button
   MouseClick("LEFT", 314, 710, 1, 1)
   Sleep(1000)
   while 1
	  $CROSSBOX = PixelSearch(358, 709, 361, 712, 0x172B37, 1)
	  if IsArray($CROSSBOX) Then
		 Sleep(1000)
	  Else
		 ; Set the bet amount
		 MouseClick("LEFT", 218, 274, 1, 1)
		 Sleep(1000)
		 Send($bet_Amt)
		 Sleep(1000)
		 ; Click the Start button
		 MouseClick("LEFT", 314, 710, 1, 1)
		 Sleep(1000)
	  EndIf
   WEnd
EndFunc

Func end()
   MouseClick("LEFT", 314, 710, 1, 1)
   Sleep(1000)
   Exit
EndFunc
