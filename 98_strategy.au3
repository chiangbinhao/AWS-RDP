HotKeySet("p", "start")
HotKeySet("{ESC}", "end")

while 1
   Sleep(50)
WEnd

Func _RoundDown($nVar, $iCount)
    Return Round((Int($nVar * (10 ^ $iCount))) / (10 ^ $iCount), $iCount)
EndFunc

Func start()
   Global $bet_Amt = 0.24
   Global $multiplier = 100
   ; Set the bet amount
   MouseClick("LEFT", 203, 274, 1, 1)
   Sleep(1000)
   Send($bet_Amt)
   Sleep(1000)
   ; Click the Start button
   MouseClick("LEFT", 312, 709, 1, 1)
   Sleep(1000)
   while 1
	  $CROSSBOX = PixelSearch(358, 707, 362, 711, 0x172B37, 1)
	  if IsArray($CROSSBOX) Then
		 Sleep(1000)
	  Else
		 ; Create a random sleep delay between 30sec and 2mins
		 Sleep(Random(10000, 15000, 1))
		 ; Switch to Manual
		 MouseClick("LEFT", 234, 204, 1, 1)
		 Sleep(1000)
		 ; Set the bet amount
		 MouseClick("LEFT", 203, 274, 1, 1)
		 Sleep(1000)
		 Send($bet_Amt*$multiplier)
		 Sleep(1000)
		 ; Click the Start button
		 MouseClick("LEFT", 315, 407, 1, 1)
		 Sleep(3000)
		 $LOSE = PixelSearch(1302, 190, 1341, 208, 0x203642, 1)
		 if IsArray($LOSE) Then
			Exit
		 Else
			; Switch back to strategy
			 MouseClick("LEFT", 423, 205, 1, 1)
			 Sleep(1000)
			 ; Set the bet amount
			 MouseClick("LEFT", 203, 274, 1, 1)
			 Sleep(1000)
			 Send($bet_Amt)
			 Sleep(1000)
			 ; Click the Start button
			 MouseClick("LEFT", 312, 709, 1, 1)
			 Sleep(1000)
		 EndIf
	  EndIf
   WEnd
EndFunc

Func end()
   MouseClick("LEFT", 314, 710, 1, 1)
   Sleep(1000)
   Exit
EndFunc
