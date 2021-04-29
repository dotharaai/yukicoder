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



proc solve():float=
  var
    (a,b,c,d,e,f)=(scanf(),scanf(),scanf(),scanf(),scanf(),scanf())

  c = c/a
  d = d/a
  e = e/a
  f = f/a
  return sqrt(f-e+(c*c+d*d)/4.0)
  
  
echo solve()