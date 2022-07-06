If Wscript.Arguments.Count = 0 Then
        Wscript.echo "No parameters found"
Else
    i=0
        Do until i = Wscript.Arguments.Count
        Parms = Parms & "Param " & i & " = " & Wscript.Arguments(i) & " " & vbcr
        i = i+1
        loop
        Wscript.echo parms
End If