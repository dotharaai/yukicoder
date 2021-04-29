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
    n = scan()
    d = scan()
    a = newseqwith(n,(0,0))
    r = newseqwith(n,0)

  for i in 0..<n:
    a[i] = (scan(),i)
  a.sort(SortOrder.Descending)
  var j = 0
  for i in 0..<n:
    while j < n and a[i][0]-a[j][0]<d:
      j+=1
    r[a[i][1]] = n-j
  echo r.join("\n")
solve()