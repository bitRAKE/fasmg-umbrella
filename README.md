# fasmg-umbrella
Umbrella libraries for modern windows development.

The umbrella libraries try to increase consistency in windows development, thru target selection via a single library:

	Name Suffix:
		OneCore*
			All editions of Windows 7 and later
		WindowsApps*
			Win11 app development platform, WinUI 3+
		windowscoreheadless*
			Win10+ containers, Nano Server

	Name Postfix:
		*UAP
			Universal Windows Platform (UWP) editions, Win10+
			Desktop, IoT, HoloLens, but not Nano Server
		*_apiset
			access functions through apiset instead of DLL - same coverage
		*_downlevel
			?minimal support for older windows versions, driver development?


Some things to note:
---
- Not all combinations of {suffix}{postfix} exist.
- Backward compatiblity is not a goal of umbrella libraries.



QUESTION & ANSWER:
---
	Q. If {APISET} just forwards to {DLL}, why can't I use all the
	   functions exported by {DLL}?
	A. The target windows versions of {APISET} don't have a uniform
	   interface to all the functions in {DLL}. The choice of excluding
	   those targets is outside the scope of umbrella libraries.


REFERENCES:
---
OneCore
- <https://docs.microsoft.com/en-us/windows-hardware/drivers/develop/building-for-onecore>

WindowsApps
- <https://docs.microsoft.com/en-us/windows/apps/windows-app-sdk/>

Universal Windows Platform (UWP)
- <https://docs.microsoft.com/en-us/windows/uwp/get-started/universal-application-platform-guide>
- <https://docs.microsoft.com/en-us/uwp/win32-and-com/alternatives-to-windows-apis-uwp>

TOOLS:
---
- [Api Set Viewer v0.8 (C)2019 by Pavel Yosifovich](https://github.com/zodiacon/ApiSetView)
