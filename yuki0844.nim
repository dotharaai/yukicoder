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
    (n,m,a)=(scan(),scan(),scan())
    leftedges = newseqwith(n,newseq[int]())
    scores = newseqwith(n,newseq[int]())
    dp = newseqwith(n,0)
  for i in 0..<m:
    var
      l = scan()-1
      r = scan()-1
      p = scan()
    leftedges[r].add(l)
    scores[r].add(p)
  if 0 in leftedges[0]:
    dp[0].max=scores[0][0]-a
  for right in 1..<n:
    for idx in 0..<leftedges[right].len:
      if leftedges[right][idx]==0:
        dp[right].max=scores[right][idx]-a
      else:
        dp[right].max=dp[leftedges[right][idx]-1]+scores[right][idx]-a
  echo dp
  return dp[^1]+a

  
    

  
echo solve()