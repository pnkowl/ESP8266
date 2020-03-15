
function f1(payload,text)
  --print("\n"..text)
  --dofile("_payload2_input.lua")
  --print("ide_payload:",payload)

  length=string.len(payload)
  t1=tmr.now()
  local a,b,c,d,e=string.find(payload, "([A-Z]+) /([^?]*)%??(.*) HTTP")
  t2=tmr.now()
  if (c==nil) then c="" end
  if (d==nil) then d="" end
  if (e==nil) then e="" end
  if (string.len(c)>20) then c=string.sub(c,1,20).."+++" end
  if (string.len(d)>20) then d=string.sub(d,1,20).."+++" end
  if (string.len(e)>20) then e=string.sub(e,1,20).."+++" end
  t3=tmr.now()

  ide_payload=nil; ide_payload2=nil
  collectgarbage(); collectgarbage()
  t4=tmr.now()
  --print(tmr.now()..","..text..": t10="..t1-t0..", t21="..t2-t1..", t32="..t3-t2..", t43="..t4-t3..", len="..length.."\na="..a.."\nb="..b.."\nc="..c.."\nd="..d.."\ne="..e.."\n")
  print(tmr.now()..","..text..": t10="..t1-t0..", t21="..t2-t1..", t32="..t3-t2..", t43="..t4-t3..", len="..length..", a="..a..", b="..b..", c="..c..", d="..d..", e="..e..", ")
  --tmr.wdclr()
  t0=t4
end

t0=tmr.now()
dofile("_payload2_input.lua"); f1(ide_payload,"pass 1")

dofile("_payload2_input.lua"); f1(ide_payload2,"pass 2")

dofile("_payload2_input.lua"); f1(ide_payload,"pass1 again")

dofile("_payload2_input.lua"); f1(ide_payload3,"pass 3")

dofile("_payload2_input.lua"); f1(ide_payload4,"pass 4")

dofile("_payload2_input.lua"); f1(ide_payload5,"pass 5")

dofile("_payload2_input.lua") f1(ide_payload6,"pass 6")

dofile("_payload2_input.lua"); f1(ide_payload,"pass1 again")

dofile("_payload2_input.lua") f1(ide_payload7,"pass 7")
dofile("_payload2_input.lua") f1(ide_payload7a,"pass 7a")
dofile("_payload2_input.lua") f1(ide_payload7b,"pass 7b")
dofile("_payload2_input.lua") f1(ide_payload8,"pass 8")
dofile("_payload2_input.lua") f1(ide_payload9,"pass 9")


