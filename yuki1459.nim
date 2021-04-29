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



proc solve(n:int):int=
  var
    m = 1
  result=int.high
  if n==1:
    return 1
  while (m+1)*(m)<n*2:
    m+=1
  
  
  return m
  
  
#for i in 1..11:
  #echo i, ", ", solve(i)

  
echo solve(scan())