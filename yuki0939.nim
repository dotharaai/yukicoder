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
    bit = 32
    a = scan().toBin(bit+1)
    b = scan().toBin(bit+1)
    dp = newseqwith(bit+1,newseqwith(2,0))
  dp[0][0]=1
  for i in 1..bit:
    if a[i]=='1' and b[i]=='1':
      dp[i][0]=dp[i-1][0]
      dp[i][1]=dp[i-1][1]
    elif a[i]=='0' and b[i]=='0':
      dp[i][0]=dp[i-1][0]
      dp[i][1]=dp[i-1][1]
    elif a[i]=='0' and b[i]=='1':
      dp[i][0]=0
      dp[i][1]=dp[i-1][1]*2+dp[i-1][0]
    else:
      dp[i][0]=0
      dp[i][1]=0
  #echo dp
  return dp[bit].sum()

    


    


  
echo solve()