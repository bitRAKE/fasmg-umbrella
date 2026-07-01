> [!WARNING]
> This software is unfinished. Keep your expectations low.

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

---

Getting Started:
---
The only requirements are a supported Windows version and a command prompt with `git` on the search path. The repository uses the `fasmg` submodule declared in `.gitmodules`, so clone recursively or initialize submodules before building:
```cmd
git clone --recursive https://github.com/bitRAKE/fasmg-umbrella
cd fasmg-umbrella
environment.cmd
```

If the repository was cloned without `--recursive`, initialize the assembler submodule first:
```cmd
git submodule update --init --recursive
```

`environment.cmd` prepends `fasmg\core` to `PATH` and sets `INCLUDE` to the repository root, `addon\packages\x64\include`, and `fasmg\packages\x86\include` so examples can locate the umbrella headers.

Examples:
---
- In the `examples` directory, several small programs can be built with fasmg. Individual examples can be built with `fasmg path\to\example.asm`, or `rebuild.cmd` will build the examples enumerated in that script and write its log to `.wip\debug.log`.
- `rebuild.cmd` also enters `examples\in-tale` to run `menu.cmd` and `tools` to run `tools\build.cmd` when those directories are present.
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
- <https://docs.microsoft.com/en-us/windows/apps/windows-app-sdk/> (github [SDK][3], [UI][4])

Universal Windows Platform (UWP)
- <https://docs.microsoft.com/en-us/windows/uwp/get-started/universal-application-platform-guide>
- <https://docs.microsoft.com/en-us/uwp/win32-and-com/alternatives-to-windows-apis-uwp>

Windows API sets
- <https://docs.microsoft.com/en-us/windows/win32/apiindex/windows-apisets?redirectedfrom=MSDN>

---

TOOLS:
---
- [WinAPI Search by Dennis A. Babkin](https://dennisbabkin.com/winapisearch/)
- [Api Set Viewer v0.8 (C)2019 by Pavel Yosifovich](https://github.com/zodiacon/ApiSetView)

![GitHub repo size][1] ![GitHub code size in bytes][2] ![visitors][5]

[1]: https://img.shields.io/github/languages/code-size/bitRAKE/fasmg-umbrella?style=for-the-badge
[2]: https://img.shields.io/github/repo-size/bitRAKE/fasmg-umbrella?style=for-the-badge
[3]: https://github.com/microsoft/WindowsAppSDK
[4]: https://github.com/microsoft/microsoft-ui-xaml/
[5]: https://visitor-badge.glitch.me/badge?page_id=bitRAKE/fasmg-umbrella
