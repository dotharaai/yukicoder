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
    a = scan()
    b = scan()
    c = scan()
    d = scan()
    v = (a-c)^2-4*2*(b-d)
  if v<0:
    result = "No"
  elif v==0:
    result = "Yes"
  else:
    var
      x1 = (-(a-c).float+sqrt(v.float))/(2*2).float
      y1 = x1^2+a.float*x1+b.float
      x2 = (-(a-c).float-sqrt(v.float))/(2*2).float
      y2 = x2^2+a.float*x2+b.float
    result = fmt"{(y2-y1)/(x2-x1)} {y1-x1*(y2-y1)/(x2-x1)}"





  
echo solve()