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
    n = read()
    dp = newseqwith(n.len()+1,newseqwith(2,0))
  # 2桁の完全な3の倍数は別途数える
  # 3桁以上の完全な3の倍数は各桁が3の倍数のもののみ
  dp[0][0]=1
  for i in 0..<n.len:
    if n[i].toInt.mod(3)==0:
      dp[i+1][0] = dp[i][0]
      if n[i].toInt>0:
        dp[i+1][1] = dp[i][1]*4 + dp[i][0]*((n[i].toInt).div(3))
      else:
        dp[i+1][1]=dp[i][1]*4
    else:
      dp[i+1][1]=dp[i][1]*4 + dp[i][0]*((n[i].toInt).div(3)+1)
  result = dp[n.len].sum()
  #echo dp
  for i in 1..min(99,n.parseInt):
    if i>=10 and (i.mod(10)+i.div(10)).mod(3)==0 and i.mod(10).mod(3)!=0:
      result+=1
  result-=4
  
    
  
echo solve()