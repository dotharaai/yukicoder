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
    (h,w,q)=(scan(),scan(),scan())
    yxs = newseqwith(q,(scan(),scan()))
    remain = h*w
    stdnt = initTable[int,int]()
  for i in 0..<q:
    var(y,x)=yxs[i]
    if stdnt.hasKey(x):
      if stdnt[x]>y:
        remain-=(stdnt[x]-y)
        stdnt[x]=y
    else:
      stdnt[x]=y
      remain-=(h-y)+1
    echo remain

  

  

solve()