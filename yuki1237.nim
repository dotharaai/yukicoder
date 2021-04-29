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
    m=10^9+7
    a = newseqwith(n,scan())
  if 0 in a:
    return -1
  elif a.filterIt(it>=4).len>0:
    return m
  else:
    var v = a.mapIt(it^(fac(it)))
    var t = 1
    for i in 0..<n:
      if t*v[i]>m:
        return m
      else:
        t*=v[i]
    return m mod t





  
echo solve()