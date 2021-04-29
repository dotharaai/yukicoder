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



proc solve():int{.discardable.}=
  var
    x = scan()
  for bit in 1..61:
    #echo (x xor bit).toBin(61)
    if (x xor bit).toBin(61).count('1')==bit:
      if (x xor bit)<=2*10^18:
        return x xor bit
  return -1

  

  
echo solve()