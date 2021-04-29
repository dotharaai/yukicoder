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


proc f(n:int):int=
  if n<10:
    return n
  else:
    var
      v = 0
      n = n
    while n>0:
      v+=n.mod(10)
      n = n.div(10)
    return f(v)


proc solve():int=
  var
    n = scan()
    v = newseqwith(n,f(scan()))#.foldr(a*b)
  return f(v.foldr(f(a*b)))
  
  
  
echo solve()