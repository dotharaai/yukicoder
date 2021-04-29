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
    a = newseqwith(2*n,scan())
    left = newseq[int](n)
    right = newseq[int](n)
  left[0]=a[0]-a[1]
  right[n-1]=a[2*n-1]-a[2*n-2]
  for i in 1..<n:
    #echo a[(n-i)*2+1], ", ",-a[(n-i)*2]
    left[i]=left[i-1]+a[i*2]-a[i*2+1]
    right[n-i-1]=right[n-i]+a[(n-i-1)*2+1]-a[(n-i-1)*2]
  result=max(left[n-1],right[0])
  for i in 0..<n-1:
    result.max=left[i]+right[i+1]

  
  
  
  
echo solve()