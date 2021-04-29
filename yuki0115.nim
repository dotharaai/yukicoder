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



proc solve()=
  var
    (n,d,k) = (scan(),scan(),scan())
    dp = newseqwith(n+1,newseqwith(k+1,newseqwith(d+1,-1)))
  dp[0][0][0]=0
  for i in 1..n:
    for j in 1..k:
      for el in 0..d:
        if dp[i-1][j][k] != -1:
          dp[i][j][el] = dp[i-1][j][k]
        elif k-i>=0 and dp[i-1][j-1][k-i] != -1:
          dp[i][j][el] = k-i
  echo dp[n][k][d]

        


  
solve()