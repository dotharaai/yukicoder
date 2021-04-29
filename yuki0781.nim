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



proc solve():int{.discardable.}=
  var
    x = scan()
    y = scan()
  for r in x..y:
    var
      c = r^2
      p = 1
      cnt = 0
    while p^2<c:
      if (c-p^2).float.sqrt == (c-p^2).float.sqrt.floor:
        #echo p
        cnt+=1
      p+=1
    result.max=cnt*3
    
  

  
echo solve()