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


const v = 50
var
  
  dp:array[-2..v+5,array[-2..v+5,array[-50..v*v+50,int]]]

proc solve():auto=
  var
    n = scan()
    m = scan()
    x = scan()
    y = scan()
    z = scan()
    a = newseqwith(n,scan())

    count = 0
  if a.filterIt(it>=x).len>m:
    return "Handicapped"
  dp[-1][0][0]=1
  for i in 0..<n:
    for j in 0..i+1:
      for d in 0..v*v:
        if a[i]>=x:# 必ず使う
          dp[i][j][d] = dp[i-1][j-1][d-a[i]]
        elif a[i]<=y: # 必ず使わない
          dp[i][j][d] = dp[i-1][j][d]
        else:
          dp[i][j][d] = dp[i-1][j-1][d-a[i]]+dp[i-1][j][d]
        #echo fmt"dp[{i}][{j}][{d}] = {dp[i][j][d]}"
  #echo dp[0].join("\n")
  #echo ""
  #echo dp[n-1].join("\n")
  for j in 1..m:
    count+=dp[n-1][j][j*z]
  return $count

  
        

  
echo solve()