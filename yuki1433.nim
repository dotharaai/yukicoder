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
    s = read()
    a = newseqwith(n,scan())
    cum = 0
    maxv = 0
    minv = 0
  
  for i in 0..<n:
    if s[i]=='B':
      a[i] = -a[i]
  #echo a
  for i in 0..<n:
    cum=cum+a[i]
    result.max=(abs(cum-minv))
    result.max=(abs(cum-maxv))
    minv.min=cum
    maxv.max=cum

  

  
echo solve()