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
    bx = scan()*1000
    by = scan()*1000
    bh = scan()
  
  proc dfs(h,x,y:int):int=
    #echo h,", ", x, ", ", y
    if h>=x and h>=y:
      return 0
    else:
      if h<x:
        result.max=1+dfs(h*4,x,y*2)
      if h<y:
        result.max=1+dfs(h*4,x*2,y)
  return dfs(bh,bx,by)

   

  
echo solve()