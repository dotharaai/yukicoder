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
  proc ask(x:int):bool=
    echo fmt"? {x}"
    var v = read()
    if v=="out":
      return false
    else:
      return true

  proc binsearch(left,right:int):int=
    if left+1==right:
      return left
    else:
      var mid = (left+right).div(2)
      if not ask(mid):
        mid+=1
        if not ask(mid):
          return binsearch(left,mid-1)
        else:
          return binsearch(mid,right)
      else:
        return binsearch(mid,right)
  return binsearch(0,10^3+1)



      


    

  

  
echo fmt"! {solve()}"