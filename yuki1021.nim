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



proc solve():string=
  var
    n = scan()
    m = scan()
    v = initDeque[int]()
  for i in 0..<n:
    v.addLast(scan())
  var s = read()
  for c in s:
    if c=='R':
      v.addFirst(0)
      var 
        a1 = v.popLast()
        a2 = v.popLast()
      v.addLast(a1+a2)
    else:
      v.addLast(0)
      var 
        a1 = v.popFirst()
        a2 = v.popFirst()
      v.addFirst(a1+a2)
  return v.toSeq.join(" ")
  

  

  
echo solve()