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
    x = scan()
    d = initTable[int,int]()
    vals = initHashSet[int]()
  for i in 0..<n:
    var v = scan()
    vals.incl(v)
    if d.hasKeyOrPut(v,1):
      d[v]+=1
  for v in vals:
    if d.hasKey(v) and d.hasKey(x xor v):
      if v == (x xor v):
        result+=d[v]*(d[v]-1)
      else:
        result+=d[v]*d[x xor v]
  result = result.div(2)

  

  

  
echo solve()