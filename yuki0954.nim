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
    a = newseqwith(5,scan().int64).reversed()
    f0 = 1
    f1 = 1
  while f0 < int.high.div(2):
    if f0==a[0]:
      var (t0,t1) = (f0,f1)
      for i in 0..<5:
        if a[i]==t0:
          result.max=i+1
        else:
          break
        if t0 >= int.high.div(2):
          break
        (t0,t1) = (t1,t0+t1)
    (f0,f1) = (f1,f0+f1)
        

  
  

  
echo solve()