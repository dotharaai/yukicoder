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



proc cPow(x,n,m:int):int=
  var
    n = n
    x = x
  result=1
  while n>0:
    if (n and 1)>0:
      result = (result*x).mod(m)
    x = (x*x).mod(m)
    n = n  shr 1

proc solve():int=
  var
    (n,k,m)=(scan(),scan(),scan())
    p = newseqwith(n,scan()).sorted()
    e = newseqwith(n,scan()).sorted()
    a = newseqwith(n,scan()).sorted()
    h = newseqwith(n,scan()).sorted()
  for i in 0..<n:
    var dif = max(@[p[i],e[i],a[i],h[i]])-min(@[p[i],e[i],a[i],h[i]])
    #echo dif,", ", k,", ",cPow(dif,k,m)
    result+=cPow(dif,k,m)
    result.mod=m
  
  
      

  

  
echo solve()