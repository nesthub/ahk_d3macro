#NoEnv
#Singleinstance force
#Include getPixel.ahk
#Persistent
SendMode, Input
boucle = 0
goto Restart

; ACTIVE DESACTIVE LA FONCTION
^z::
	if (boucle = 0)	{
		Send {SPACE down}
		Send {Z down}
		boucle = 1
	}
	else if (boucle = 1) {
		Send {SPACE up}
		Send {Z up}
		boucle = 0
	}
return

Restart:
	settimer, Bootstrap, 1000
return

Macro:
		
	; RECUPERE LE CD
	poneyPixel := fastPixelGetColor(924, 1114) ; 1185306 = UP
	akaraPixel := fastPixelGetColor(847, 1112) ; 1448470 = UP
	loisPixel := fastPixelGetColor(997, 1114) ; 1580313 = UP
	blindPixel := fastPixelGetColor(699, 1112) ; 1448471 = UP
	blindMidPixel := fastPixelGetColor(731, 1173) ; 986895 != PAS UP
	jugementPixel := fastPixelGetColor(625, 1112) ; 1448470 = PAS UP
	
	; MACRO OFF -> PAS DE TP ACTIF -> CD PONEY UP -> CAST AKA OU LOIS QUAND UP
	if (boucle = 0 && poneyPixel = "1185306") {				
			if (akaraPixel = "1448470") {
				Send r
			}
			Sleep 50
			if (loisPixel = "1580313") {
				MouseClick, right
			}
	} else if (boucle = 1) {
		Send {SPACE down}
		Send {Z down}
		; LOIS AKA
		if (akaraPixel = "1448470") {
			Send r
			goto Restart
		}
		if (loisPixel = "1580313") {
			MouseClick, right
			goto Restart
		}
	}
	goto Restart
return

Bootstrap:
	settimer, Bootstrap, off
	
	; BLOQUE SI PAS SUR DIABLO
	IfWinActive, Diablo III
	{
		
		; PREND UN SCREEN
		updateFastPixelGetColor()
		
		; BLOCK LE SCRIPT SI ACTION DE TELEPORT
		tp1Pixel := fastPixelGetColor(863, 359) ; 10267317 = TP CITY ACTIF
		tp2Pixel := fastPixelGetColor(1056, 359) ; 10267317 = TP CITY ACTIF
		if (tp1Pixel = "10267317" && tp2Pixel = "10267317") {
			goto Restart
		}
		; BLOQUE LE SCRIPT SI MENU GAUCHE / DROITE / CENTRAL OUVERT
		menuG1Pixel := fastPixelGetColor(561, 13) ; 7250912 = menu gauche pixel 1 + pixel 2 = ouvert
		menuG2Pixel := fastPixelGetColor(574, 13) ; 7646696 = menu gauche pixel 1 + pixel 2 = ouvert
		if (menuG1Pixel = "7250912" && menuG2Pixel = "7646696") {
			goto Restart
		}
		menuD1Pixel := fastPixelGetColor(1895, 13) ; 7250912 = menu droite pixel 1 + pixel 2 = ouvert
		menuD2Pixel := fastPixelGetColor(1908, 13) ; 7646696 = menu droite pixel 1 + pixel 2 = ouvert
		if (menuD1Pixel = "7250912" && menuD2Pixel = "7646696") {
			goto Restart
		}
		menuC1Pixel := fastPixelGetColor(1485, 59) ; 6856413 = menu central pixel 1 + pixel 2 = ouvert
		menuC2Pixel := fastPixelGetColor(1499, 59) ; 6790360 = menu central pixel 1 + pixel 2 = ouvert
		if (menuC1Pixel = "6856413" && menuC2Pixel = "6790360") {
			goto Restart
		}

		menuEchap1 := fastPixelGetColor(213, 269) ; 6906189 = menu central pixel 1 + pixel 2 = ouvert
		menuEchap2 := fastPixelGetColor(312, 269) ; 4933432 = menu central pixel 1 + pixel 2 = ouvert
		if (menuEchap1 = "6906189" && menuEchap2 = "4933432") {
			goto Restart
		}
		mainMenu1 := fastPixelGetColor(232, 1186) ; 1052688 = menu central pixel 1 + pixel 2 = ouvert
		mainMenu2 := fastPixelGetColor(234, 1186) ; 1052688 = menu central pixel 1 + pixel 2 = ouvert
		if (mainMenu1 = "1052688" && mainMenu2 = "1052688") {
			goto Restart
		}

		chat1 := fastPixelGetColor(23, 996) ; 2097 = menu central pixel 1 + pixel 2 = ouvert
		chat2 := fastPixelGetColor(46, 996) ; 2097 = menu central pixel 1 + pixel 2 = ouvert
		if (chat1 = "2097" && chat2 = "2097") {
			goto Restart
		}
		chat3 := fastPixelGetColor(23, 1178) ; 2097 = menu central pixel 1 + pixel 2 = ouvert
		chat4 := fastPixelGetColor(46, 1178) ; 2097 = menu central pixel 1 + pixel 2 = ouvert
		if (chat3 = "2097" && chat4 = "2097") {
			goto Restart
		}
		contact1 := fastPixelGetColor(1900, 178) ; 3226690 = menu central pixel 1 + pixel 2 = ouvert
		contact2 := fastPixelGetColor(1900, 181) ; 3226690 = menu central pixel 1 + pixel 2 = ouvert
		if (contact1 = "3226690" && contact2 = "3226690") {
			goto Restart
		}
		carte1 := fastPixelGetColor(1108, 74) ; 6529734 = menu central pixel 1 + pixel 2 = ouvert
		carte2 := fastPixelGetColor(1109, 74) ; 6529734 = menu central pixel 1 + pixel 2 = ouvert
		if (carte1 = "6529734" && carte2 = "6529734") {
			;msgSplash = STOP: CARTE
			;SplashTextOn, 150, 1, %msgSplash%, a
			;WinMove, %msgSplash%, , 5, 5
			goto Restart
		}
		
		goto Macro
	}
	goto Restart
return