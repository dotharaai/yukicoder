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



proc solve():string=
  var
    s = read()
    p = "kadomatsu"
    dp = newseqwith(s.len+1,newseqwith(p.len+1,false))
  dp[0].fill(true)
  for y in 0..<s.len:
    for x in 0..<p.len:
      dp[y+1][x+1] = dp[y+1][x] or (dp[y][x] and p[x]==s[y])
  #echo dp.join("\n")

  if dp[s.len][p.len]:
    return "Yes"
  else:
    return "No"

  
echo solve()