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
    (n,m,c)=(scan(),scan(),scan())
    a = newseqwith(n,scan()).sorted(SortOrder.Ascending)
    b = newseqwith(m,scan()).sorted(SortOrder.Descending)
    ia=0
    ib=0
    cnt = 0
  while ia<n:
    while ib<m and a[ia]*b[ib]>c:
      ib+=1
    cnt+=ib
    ia+=1
  return cnt.float/(n*m).float


  
  

  
echo solve()