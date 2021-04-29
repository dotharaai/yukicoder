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
    a = newseqwith(n,scan())
    dp = newseqwith(n+1,newseqwith(2^15,false))
  
  dp[0][0]=true
  for i in 0..<n:
    for v in 0..<2^15:
      dp[i+1][v xor a[i]] = dp[i][v] or dp[i+1][v xor a[i]] or dp[i][v xor a[i]]
  return dp[n].mapIt(it.int).sum()


  
echo solve()