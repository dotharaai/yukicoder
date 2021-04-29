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
proc scanf(): float64 = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():float64=
  var
    (n,m)=(scanf(),scanf())
  var
    p = scanf()
  if n==1 or m==1:
    if n==1 and m==1:
      return p
    elif n==1:
      return p^2*2+(m-2)*p^3
    else:
      return p^2*2+(n-2)*p^3
  else:
    return 4*p^3 + (n-2+m-2)*2*p^4 + (n-2)*(m-2)*(p^5)
      

  
  
echo solve()