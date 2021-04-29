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



proc modPow(x,n,c:int):int=
  var
    x=x
    n=n
  result=1
  while n>0:
    if (n and 1)>0:
      result*=x
      result.mod=c
    x*=x
    x.mod=c
    n = n shr 1

proc solve():int=
  var
    (a,b,c)=(scan(),scan(),scan())
    mds = newseqwith(c,0)
  
  for i in 0..<c:
    mds[i]=modPow(i+1,b,c)
  #echo mds
  result=(mds.sum()*a.div(c)+mds[0..<a.mod(c)].sum()).mod(c)
  
  

  
echo solve()