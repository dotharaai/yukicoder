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



proc solve():float=
  var
    s = read()
    n = s.len
    dp = newseqwith(n,0)
    occ = newseqwith(26,-1)
  dp[0]=1
  occ[s[0].ord-'a'.ord]=0
  for i in 1..<n:
    dp[i]=dp[i-1] + i - occ[s[i].ord-'a'.ord]
    occ[s[i].ord-'a'.ord]=i
  return 2.0*sum(dp).toFloat/(n.float*(n+1).float)




  
echo solve()