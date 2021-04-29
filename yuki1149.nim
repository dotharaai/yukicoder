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
    offs = 0
  if n.mod(2)==0:
    echo fmt"{2} {n.div(2)}"
  else:
    echo fmt"{1} {n.div(2)+1}"
  while true:
    var
      t = scan()
      k:int
      x:int
    if t==0:
      return
    elif t==3:
      (k,x)=(scan(),scan())
      echo fmt"{k} {n+2-x-k}"
      
      


  
echo solve()