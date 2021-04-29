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
    inf = int.high.div(2)
    a = newseqwith(n,scan())
    minL = newseqwith(n,inf)
    minR = newseqwith(n,inf)
  minL[0]=a[0]
  minR[n-1]=a[n-1]
  result=inf
  for i in 1..<n:
    minL[i]=min(minL[i-1],a[i])
    minR[n-i-1]=min(minR[n-i-1+1],a[n-1-i])
  #echo minL
  #echo minR
  for i in 1..<n-1:
    if (minL[i-1]<a[i] and a[i]>minR[i+1]) or
    (minL[i-1]>a[i] and a[i]<minR[i+1]):
      result.min=(minL[i-1]+a[i]+minR[i+1])
  if result == inf:
    return -1
    


  
  

echo solve()