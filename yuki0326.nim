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



proc solve():int{.discardable.}=
  var
    n = scan()
    k = scan()
    p = newseq[int](n)
    a = newseq[int](n)
  for i in 0..<n:
    p[i] = i+1
  for i in 0..<k:
    var
      (l,r) = (scan()-1,scan()-1)
    (p[l],p[r]) = (p[r],p[l])
  for i in 0..<n:
    var t = scan()-1
    a[t] = i+1
  var ans = newseq[string]()
  #echo p
  #echo a
  
  
  
  for idx in 0..<n:
    var
      val = a[n-1-idx]
      pos = p.find(val)
    #echo val," ",pos
    for s in pos..<n-idx-1:
      ans.add(fmt"{s+1} {s+2}")
      (p[s],p[s+1]) = (p[s+1],p[s])
      #echo p
  #echo p
  #echo a
  echo ans.len
  echo ans.join("\n")


      

solve()
    
  


  
