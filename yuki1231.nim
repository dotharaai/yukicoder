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
    d = newseqwith(n,newseqwith(10,-int.high.div(4)))
  d[0][0] = 0
  d[0][a[0].mod(10)] = 1

  for i in 0..<n-1:
    for m in 0..9:
      d[i+1][(m+a[i+1]).mod(10)].max=max(d[i][m]+1,d[i][(m+a[i+1]).mod(10)])
  #echo d.join("\n")
  return d[n-1][0]

  
  
echo solve()