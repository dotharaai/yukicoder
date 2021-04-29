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
    (n,k) = (scan(),scan())
    a = newseqwith(n,scan())
    c = newseqwith(n-k+1,0)
    q = scan()
    x = newseqwith(q,(0,0))
    res = newseqwith(q,0)

  for i in 0..<q:
    x[i]=(scan(),i)

  c[0]=a[0..<k].sum()
  for i in 1..<n-k+1:
    c[i]=c[i-1]-a[i-1]+a[i+k-1]
  
  c.sort(SortOrder.Ascending)
  x.sort(SortOrder.Ascending)
  #echo c
  #echo x
  var idx=0
  for (v, i) in x:
    while idx<c.len and c[idx]<=v:
      idx+=1
    #echo fmt"({v},{i}),{idx}"
    res[i] = idx
  echo res.join("\n")



  


solve()