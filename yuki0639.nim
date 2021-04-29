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



proc solve():int=
  var
    n = scan()
    d = initTable[int,int]()
  d[0]=1
  proc f(x:int):int=
    #echo x
    if d.hasKey(x):
      return d[x]
    else:
      result = f(x div 3) + f(x div 5)
      d[x]=result
      return result
  return f(n)
  
  
  
echo solve()