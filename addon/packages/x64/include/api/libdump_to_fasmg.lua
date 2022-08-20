function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

if arg[1]==nil or not file_exists(arg[1]) then
  print("usage: lua54.exe " .. arg[0] .. ' "<filename>"')
  if not(arg[1]==nil) then
	print("\tunable to use: " .. arg[1])
  end
  return
end

out,fileName,ordinal,header = "","",-1,true
files = {}
func = {}
for line in io.lines(arg[1]) do
  if string.find(line,"Dump of file ")==1 then
    fileName = string.match(line,"[^\\/]+%.[^.]+$")
    fileName = string.match(fileName,"^[^.]+") .. ".fincg"
    --print(fileName)
  elseif string.find(line,"  DLL name     : ")==1 then
    -- strip DLL extensions
    dllName = string.sub(string.match(line,"[^:]+$"), 2, -5)
    if files[dllName]==nil then
      files[dllName] = 1
    else
      files[dllName] = files[dllName] + 1
    end
  elseif string.find(line,"  Symbol name  : ")==1 then
    _symbol = string.sub(string.match(line,"[^:]+$"), 2, -1)
  elseif string.find(line,"  Type         : ")==1 then
    _type = string.sub(string.match(line,"[^:]+$"), 2, -1)
  elseif string.find(line,"  Name type    : ")==1 then
    _nametype = string.sub(string.match(line,"[^:]+$"), 2, -1)
  elseif string.find(line,"  Hint         : ")==1 then
    _hint = 0 + string.sub(string.match(line,"[^:]+$"), 2, -1)
  elseif string.find(line,"  Name         : ")==1 then
    _name = string.sub(string.match(line,"[^:]+$"), 2, -1)
    if not (_name==_symbol) then
      -- all mangled names seem to be stored undecorated?
      if not (_nametype=="undecorate") then
        print(dllName .. "\n" .. _nametype .. "\n" .. _symbol)
      end
    end
    -- store function for use later
    if _type=="code" then
      if func[dllName]==nil then
        func[dllName] = {}
      end
      func[dllName][files[dllName]] = _name
    end
  end
end

a = {}
for n in pairs(func) do table.insert(a, n) end
table.sort(a)

-- create iterators for API use:
out = ""
for i,j in pairs(a) do
  out = out .. "__IMPORTS equ \"" .. j .. "\",\\\n"
  for n,m in pairs(func[j]) do
    out = out .. m .. ",\\\n"
  end
  out = string.sub(out,1,-4) .. "\n\n"
end
io.write(out)
