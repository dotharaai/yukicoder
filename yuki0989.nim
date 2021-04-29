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
    m = scan()
    k = scan()
    op = read()
    b = newseqwith(m,scan()).sorted(SortOrder.Ascending)
    a = newseqwith(n,scan()).sorted(SortOrder.Descending)
    aidx=0
  
  if op=="*":
    for bidx in 0..<m:
      while aidx<n and a[aidx]*b[bidx]>=k:
        aidx+=1
      result+=aidx
  else:
    for bidx in 0..<m:
      while aidx<n and a[aidx]+b[bidx]>=k:
        aidx+=1
      result+=aidx
      
      

  
echo solve()