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
    (n,m) = (scan(),scan())
    a = newseqwith(n,sum(newseqwith(m,scan())))
    dp = newseqwith(n,newseqwith(2,0))
  dp[0][1]=a[0]
  for i in 1..<n:
    dp[i][0].max=max(dp[i-1][0],dp[i-1][1]-a[i])
    dp[i][1].max=max(dp[i-1][1],dp[i-1][0]+a[i])
  return dp[n-1].max()
  
  

  
  
  

  

  
echo solve()