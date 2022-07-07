ShowParams.exe test \\\
ShowParams.exe "test \\\
ShowParams.exe "C:\TEST A\\"
ShowParams.exe "\"C:\TEST A\\\""
ShowParams.exe "a b c"  d  e
ShowParams.exe "ab\"c"  "\\"  d
ShowParams.exe a\\\b d"e f"g h
ShowParams.exe a\\\"b c d
ShowParams.exe a\\\\"b c" d e
ShowParams.exe "a b c""
ShowParams.exe \"Call Me Ishmael\"
ShowParams.exe \""Call Me Ishmael"\"
ShowParams.exe "\"Call Me Ishmael\""
ShowParams.exe "Call Me Ishmael"
ShowParams.exe ""Call Me Ishmael""
ShowParams.exe """Call Me Ishmael"""
ShowParams.exe """"Call Me Ishmael""""
ShowParams.exe """""Call Me Ishmael"""""
