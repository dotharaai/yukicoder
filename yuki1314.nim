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



proc solve():string=
  var
    (n,k) = (scan(),scan())
    lose = (n-1) div (k+1)
    win = (n-1) - lose
    first = (win+1) div 2
  if win mod 2 == 1:
    first+=lose
  if first > (n-1)-first:
    return "Win"
  elif first == (n-1)-first:
    return "Draw"
  else:
    return "Lose"
  
    



  
echo solve()