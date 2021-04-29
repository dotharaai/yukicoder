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
    p = newseqwith(n,0)
    a = newseqwith(n,0)
    dp = newseqwith(n,newseqwith(2,0))
  for i in 0..<n:
    (p[i],a[i])=(scan(),scan())

  # dp[i][0]: iターン目でai本以外倒した
  # dp[i][1]: iターン目でai本倒した（i+1ターン目で倒した本数にa(i+1)を加える）
  if a[0]==p[0]:
    dp[0][0]=p[0]-1
    dp[0][1]=a[0]
  else:
    dp[0][0]=p[0]
    dp[0][1]=a[0]

  for i in 1..<n:
    if p[i]==a[i]:
      dp[i][0]=max(dp[i-1][0]+p[i]-1,dp[i-1][1]+(p[i]-1)*2)
      dp[i][1]=max(dp[i-1][0]+p[i],dp[i-1][1]+p[i]*2)
    else:
      dp[i][0]=max(dp[i-1][0]+p[i],dp[i-1][1]+p[i]*2)
      dp[i][1]=max(dp[i-1][0]+a[i],dp[i-1][1]+a[i]*2)
  #echo dp
  return max(dp[n-1])
  

  
echo solve()