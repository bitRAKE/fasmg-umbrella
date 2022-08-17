# fasmg-umbrella
Umbrella libraries for modern windows development (using [fasmg](https://github.com/tgrysztar/fasmg)).


The umbrella libraries try to increase consistency in windows development, thru target selection via a single library:

	Name Suffix:
		OneCore*
			All editions of Windows 7 and later
		WindowsApps*
			Win11 app development platform, WinUI 3+
		windowscoreheadless*
			Win10+ containers, Nano Server
		mincore*
			IoT

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


Examples:
---
- In the `\examples` directory several small programs can be build with fasmg. A clone of the repository should be sufficient, `envionment.cmd` from a command prompt establishes the needed changs to the environment.
- File naming makes a distinction between several types of source code: `.asm` are main project files, `.inc` generates code at inclusion, and `.g` files create abstractions (no code generation at inclusion).

---

Question & Answer:
---
- [ ] Q. If {APISET} just forwards to {DLL}, why can't I use all the functions exported by {DLL}?
- [x] A. The target windows versions of {APISET} don't have a uniform interface to all the functions in {DLL}. Fine-grained exclusion of targets is outside the scope of umbrella libraries.

- [ ] Q. Something.
- [x] A. Something else.

---

REFERENCES:
---
Windows umbrella libraries
- <https://docs.microsoft.com/en-us/windows/win32/apiindex/windows-umbrella-libraries>

OneCore
- <https://docs.microsoft.com/en-us/windows-hardware/drivers/develop/building-for-onecore>

WindowsApps
- <https://docs.microsoft.com/en-us/windows/apps/windows-app-sdk/>

Universal Windows Platform (UWP)
- <https://docs.microsoft.com/en-us/windows/uwp/get-started/universal-application-platform-guide>
- <https://docs.microsoft.com/en-us/uwp/win32-and-com/alternatives-to-windows-apis-uwp>

Windows API sets
- <https://docs.microsoft.com/en-us/windows/win32/apiindex/windows-apisets?redirectedfrom=MSDN>

TOOLS:
---
- [WinAPI Search by Dennis A. Babkin](https://dennisbabkin.com/winapisearch/)
- [Api Set Viewer v0.8 (C)2019 by Pavel Yosifovich](https://github.com/zodiacon/ApiSetView)

![GitHub repo size][1] ![GitHub code size in bytes][2]

[1]: https://img.shields.io/github/languages/code-size/bitRAKE/fasmg-umbrella?style=for-the-badge
[2]: https://img.shields.io/github/repo-size/bitRAKE/fasmg-umbrella?style=for-the-badge
