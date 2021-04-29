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


const md = 998244353


proc solve():int=
  var
    n = scan()
    m = scan()
    dp = newseqwith(m+1,0)
  if n == 1:
    return 1
  dp[0]=1
  for i in 1..m:
    if i-n>=0:
      dp[i]=dp[i-n]+dp[i-1]
    else:
      dp[i]=dp[i-1]
    dp[i].mod=md
  return dp[m]


  
  
  

  
echo solve()