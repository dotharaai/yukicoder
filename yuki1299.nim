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
    md = 998244353
    (n,k) = (scan(),scan())
    s = newseqwith(n,scan()).sum().mod(md)
  proc modPow(x,n:int):int=
    var
      x=x
      n = n
    result = 1
    while n>0:
      if (n and 1) > 0:result=result*x mod md
      x = x*x mod md
      n = n shr 1
    return
  
  result=(modPow(2,k)*s).mod(md)
  


  return 


  
  
  
  
echo solve()