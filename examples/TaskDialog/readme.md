
#### TaskDialog - moving beyond the MessageBox.

This is an exploration of the [TaskDialog][1] addition to Windows UI programming, and patterns in [fasmg][2].

[Kenny Kerr][3][![GitHub](https://img.shields.io/badge/-GitHub-181717?style=flat-square&logo=github)](https://github.com/kennykerr) [![Website](https://img.shields.io/badge/-Website-0A0A0A?style=flat-square&logo=InternetExplorer&logoColor=white)](https://kennykerr.ca/)
 put together the original sample program in C++ when Windows Vista was still in beta. I thought it was such a good idea that I've mirrored his effort in x86-64 assembly. Obviously, we don't need ATL/WTL or the wrapper he created - it's mostly just [SendMessage][4].

Often lines of code in assembly are comparable given the right model. In fasmg we can construct domain models fitting a large array of problems.

[1]: https://docs.microsoft.com/en-us/windows/win32/controls/task-dialogs-overview
[2]: https://github.com/tgrysztar/fasmg
[3]: https://weblogs.asp.net/kennykerr/Windows-Vista-for-Developers-_1320_-Part-2-_1320_-Task-Dialogs-in-Depth
[4]: https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-sendmessage
