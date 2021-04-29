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
    n = scan()
    a = 0
    b = 0
  for i in 0..<n-1:
    var
      (ta,tb) = (scan(),scan())
    a+=ta
    b+=tb
  if n==2:
    if a!=b:
      return 0
    elif a==0 or b==0:
      return 0
    else:
      return 1
  if a==0 and b==0:
    return 0
  elif a==0 or b==0:
    return 1
  else:
    echo a,", ", b
    return min(a,b)+1
  

  
echo solve()