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
    p = scanf()
    q = scanf()
  
  proc binSearch():float=
    var
      left = 0.0
      right = 1E16
      eps = 1E-5
    while left+eps<right:
      #echo left, ", ", right
      var mid = (left+right)/2
      if mid^2<p+q*mid*log2(mid):
        left=mid
      else:
        right=mid
    return left
  return binSearch()




    
  

  
echo solve()