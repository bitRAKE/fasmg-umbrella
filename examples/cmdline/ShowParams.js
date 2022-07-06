if (WScript.Arguments.Count() ==0) {
  WScript.Echo("No parameters found");
}
else {
  var objArgs = WScript.Arguments;
  var parms = ""
  for (i=0, n=objArgs.length; i<n; i++) {
    parms += '\nParam '+i+'='+objArgs(i);
  }
  WScript.Echo(parms);
}