import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc f(x:int):int=
  if x==0:
    return 6
  elif x==1:
    return 2
  elif x==2:
    return 5
  elif x==3:
    return 5
  elif x==4:
    return 5
  elif x==5:
    return 5
  elif x==6:
    return 6
  elif x==7:
    return 4
  elif x==8:
    return 7
  elif x==9:
    return 6

proc solve():int=
  var
    p = read()#.toSeq.mapIt(it.toint)
    n = read()
    negative = false
  
  if p[0]=='-':
    p = p[1..<p.len]
    negative = true
  var
    t = p.toSeq.mapIt(it.toInt)

  


  
echo solve()