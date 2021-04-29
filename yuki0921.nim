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
    dp = newseqwith(n,newseqwith(2,0))
    cont = newseqwith(n,0)
  dp[0][1]=1
  dp[0][0] = 0
  cont[0]=1
  for i in 1..<n:
    dp[i][0]=max(dp[i-1])
    if a[i]==a[i-1]:
      dp[i][1]=max(dp[i-1][1]+1, dp[i-1][0]+1)
      cont[i]=cont[i-1]+1
    elif a[i]>a[i-1]:
      cont[i]=1
      dp[i][1]=max(dp[i-1][1]+1-cont[i-1],dp[i-1][0]+1)
    elif a[i]<a[i-1]:
      dp[i][1]=max(dp[i-1][1],dp[i-1][0]+1)
      cont[i]=1
  #echo dp.join("\n")
  return dp[n-1].max




echo solve()