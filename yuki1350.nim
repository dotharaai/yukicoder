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
    (a,b,k)=(scan(),scan(),scan())
    g = lcm(a,b)
  
  proc moreThanK(mid:int):bool=
    return (mid).div(a)+(mid).div(b) - (mid).div(g) >= k


  proc binsearch(left,right:int):int=
    #echo fmt"{left}, {right}"
    if left+1==right:
      return right
    else:
      var mid = (left+right).div(2)
      if moreThanK(mid):
        return binsearch(left,mid)
      else:
        return binsearch(mid,right)
  if a==b:
    return a*k
  result = binsearch(0,10^18)

  

echo solve()