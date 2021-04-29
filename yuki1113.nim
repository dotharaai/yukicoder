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



proc solve():string=
  var
    a = scan()
    b = scan()
    g = gcd(a,b)
    d = 1
    r = 0
  while d^2<=g:
    if g.mod(d)==0:
      if d^2!=g:
        r+=2
      else:
        r+=1
    d+=1
  if r.mod(2)==0:
    return "Even"
  else:
    return "Odd"


  
  

  
echo solve()