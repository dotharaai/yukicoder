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
    (n,d) = (scan(),scan())
    t = newseqwith(n,0)
    k = newseqwith(n,0)
    dp = newseqwith(n,newseqwith(2,-int.high.div(2)))
  for i in 0..<n:
    (t[i],k[i])=(scan(),scan())
  dp[0][0] = t[0]
  dp[0][1] = k[0]-d
  for i in 1..<n:
    dp[i][0] = max(dp[i-1][0],dp[i-1][1]-d) + t[i]
    dp[i][1] = max(dp[i-1][0]-d,dp[i-1][1]) + k[i]
  return dp[n-1].max()



echo solve()