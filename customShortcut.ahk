;open applications or activate if already running

#Persistent
SetTitleMatchMode, 2
tapTimeout := 400
tapCounts := {}

HandleTap(key, winTitle, exePath := "", className := "", closeOnTriple := false) {
    global tapCounts, tapTimeout
    if !tapCounts.HasKey(key)
        tapCounts[key] := {count: 0}
    tapCounts[key].count += 1
    SetTimer, % key "Tap", % -tapTimeout
}

DoAction(key, winTitle, exePath := "", className := "", closeOnTriple := false) {
    global tapCounts
    count := tapCounts[key].count
    tapCounts[key].count := 0

    if WinExist(winTitle) {
        WinGet, id, ID, %winTitle%
        if (count = 1)
            WinActivate, ahk_id %id%
	else if (count = 2)
	    WinRestore, ahk_id %id%
        else if (count = 3)
            WinMaximize, ahk_id %id%
        else if (count = 4)
            WinClose, ahk_id %id%

    } else if (count = 1 && exePath != "") {
        Run, %exePath%
    }
}


Numpad1::
HandleTap("Numpad1", "ahk_exe Cursor.exe", "C:\Users\Thato\AppData\Local\Programs\cursor\Cursor.exe")
return
Numpad1Tap:
DoAction("Numpad1", "ahk_exe Cursor.exe", "C:\Users\Thato\AppData\Local\Programs\cursor\Cursor.exe")
return

Numpad2::
HandleTap("Numpad2", "ahk_exe Notion.exe", "C:\Users\Thato\AppData\Local\Programs\Notion\Notion.exe")
return
Numpad2Tap:
DoAction("Numpad2", "ahk_exe Notion.exe", "C:\Users\Thato\AppData\Local\Programs\Notion\Notion.exe")
return

Numpad3::
HandleTap("Numpad3", "ahk_exe chrome.exe", "chrome.exe", "", true)
return
Numpad3Tap:
DoAction("Numpad3", "ahk_exe chrome.exe", "chrome.exe", "", true)
return

Numpad4::
HandleTap("Numpad4", "ahk_exe chatGPT.exe", "chatGPT.exe")
return
Numpad4Tap:
DoAction("Numpad4", "ahk_exe chatGPT.exe", "chatGPT.exe")
return

Numpad5::
HandleTap("Numpad5", "ahk_class CabinetWClass", "explorer.exe", "CabinetWClass")
return
Numpad5Tap:
DoAction("Numpad5", "ahk_class CabinetWClass", "explorer.exe", "CabinetWClass")
return

Numpad6::
HandleTap("Numpad6", "ahk_exe winword.exe", "winword.exe")
return
Numpad6Tap:
DoAction("Numpad6", "ahk_exe winword.exe", "winword.exe")
return

Numpad7::
HandleTap("Numpad7", "ahk_exe Code.exe", "C:\Users\Thato\AppData\Local\Programs\Microsoft VS Code\Code.exe")
return
Numpad7Tap:
DoAction("Numpad7", "ahk_exe Code.exe", "C:\Users\Thato\AppData\Local\Programs\Microsoft VS Code\Code.exe")
return

Numpad8::
HandleTap("Numpad8", "ahk_exe GitHubDesktop.exe", "C:\Users\Thato\AppData\Local\GitHubDesktop\GitHubDesktop.exe")
return
Numpad8Tap:
DoAction("Numpad8", "ahk_exe GitHubDesktop.exe", "C:\Users\Thato\AppData\Local\GitHubDesktop\GitHubDesktop.exe")
return


Numpad9::
HandleTap("Numpad9", "ahk_exe freeCodeCamp.exe", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=idcicjmfdnncfmmgoogecnlfbkglgcak)
return
Numpad9Tap:
DoAction("Numpad9", "ahk_exe freeCodeCamp.exe", "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=idcicjmfdnncfmmgoogecnlfbkglgcak)
return

;Brings the browser to the front if it's open, else open the link

NumpadEnd::
IfWinExist, thato-t | Netlify - Google Chrome
  WinActivate
else
 Run, https://app.netlify.com/teams/thato-t/sites
return

NumpadDown::
IfWinExist, Thato-t (Albanos) - Google Chrome
  WinActivate
else
 Run, https://github.com/Thato-t
return

NumpadPgDn::
IfWinExist, Clusters | Cloud: MongoDB Cloud - Google Chrome
  WinActivate
else
 Run, https://cloud.mongodb.com/v2/67b59624a138cf0d1c745dd1#/clusters
return

NumpadLeft::
IfWinExist, Recent jobs - Find recent jobs posted daily - Google Chrome
  WinActivate
else
 Run, https://recentjobs.co.za/
return


;hotstrings

:*:gcfx::git commit -m 'fix:
:*:gcft::git commit -m 'feat:
:*:gcic::git commit -m 'Initial commit'
:*:gcr::git commit -m 'refactor:
:*:gad::git add .
:*:gs::git status
:*:gc::git checkout
:*:gme::git merge
:*:gdb::git -d branch
:*:gcb::git checkout -b
