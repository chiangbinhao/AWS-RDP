HotKeySet("p", "start")
HotKeySet("{ESC}", "end")

while 1
   Sleep(50)
WEnd

Func _RoundDown($nVar, $iCount)
    Return Round((Int($nVar * (10 ^ $iCount))) / (10 ^ $iCount), $iCount)
EndFunc

Func start()
   Global $bet_Amt = 0.00137
   Global $Num_of_Wins = 10
   Global $autobetEnded = True
   Global $run_count = 0
   while 1
	  if $autobetEnded = True Then
		 ; Select the Bet Amount Textbox
		 MouseClick("LEFT", 469, 253, 1, 1)
		 Sleep(1000)
		 ; Paste the Bet Amount into the Textbox
		 Send($bet_Amt)
		 Sleep(1000)
		 ; Select the Stop on Profit Textbox
		 MouseClick("LEFT", 471, 585, 1, 1)
		 Sleep(1000)
		 ; Paste the Stop Amount into the Textbox
		 Send($bet_Amt*$Num_of_Wins)
		 Sleep(1000)
		 ; Press the Start Autobet button
		 MouseClick("LEFT", 547, 705, 1, 1)
		 Sleep(1000)
		 $bet_Amt = _RoundDown($bet_Amt+($bet_Amt*$Num_of_Wins/1100),8)
		 $autobetEnded = False
		 $run_count = $run_count + 1
	  Else
		 ; Check if autobet is finished
		 $CROSSBOX = PixelSearch(552, 380, 604, 393, 0x0F212E, 1)
		 if IsArray($CROSSBOX) Then
			$autobetEnded = True
			if $run_count = 5 Then
			   $run_count = 0
			   ; Open Fairness
			   MouseClick("LEFT", 1447, 770, 1, 1)
			   Sleep(1000)
			   ; Press Change button 2 times
			   MouseClick("LEFT", 1170,607, 1, 1)
			   Sleep(1500)
			   MouseClick("LEFT", 1170,607, 1, 1)
			   Sleep(1500)
			   ; Close Fairness
			   MouseClick("LEFT", 1208, 226, 1, 1)
			   Sleep(1000)
			EndIf
			; Create a random delay between 1 and 5 mins
			Sleep(Random(60000, 300000, 1))
		 EndIf
	  EndIf
   WEnd
EndFunc

Func end()
   Exit
EndFunc
