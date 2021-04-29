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
    (n,q)=(scan(),scan())
    a = newseqwith(n,scan())
    cumxor = newseqwith(n,0)
    lr = newseqwith(q,(scan()-1,scan()))

  cumxor[0]=a[0]
  for i in 1..<n:
    cumxor[i]=cumxor[i-1] xor a[i]
  cumxor = @[0] & cumxor
  for (l,r) in lr:
    echo cumxor[r] xor cumxor[l]
  

  
  
solve()