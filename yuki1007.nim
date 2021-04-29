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
    k = scan()-1
    a = newseqwith(n,scan())
  if a[k]==0:
    return 0
  if a[k]==1:
    result=a[k]
    var
      left = k-1
      right=k+1
      lr = 1
      rr=1
    while left>=0 and a[left]>=2:
      lr+=a[left]
      left-=1
    if left>=0 and a[left]==1:
      lr+=1
    while right<n and a[right]>=2:
      rr+=a[right]
      right+=1
    if right<n and a[right]==1:
      rr+=1
    result = max(lr,rr)
  else:
    result=a[k]
    var
      left = k-1
      right=k+1
    while left>=0 and a[left]>=2:
      result+=a[left]
      left-=1
    if left>=0 and a[left]==1:
      result+=1
    while right<n and a[right]>=2:
      result+=a[right]
      right+=1
    if right<n and a[right]==1:
      result+=1
    

    


  
echo solve()