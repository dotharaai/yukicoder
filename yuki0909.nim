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



proc solve()=
  var
    n = scan()
    x = newseqwith(n,scan())
    y = newseqwith(n,scan())
    dist = int.high.div(4)
  for i in 0..<n:
    dist.min=y[i]+x[i]
  echo dist
  echo 0
  for i in 0..<n:
    echo min(dist,x[i])
  echo dist
  
  
    
  
solve()