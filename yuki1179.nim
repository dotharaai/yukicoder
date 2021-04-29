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
    (a,b,c)  = (scanf(),scanf(),scanf())
  if b^2-4*a*c<0:
    echo "imaginary"
  elif b^2-4*a*c==0:
    echo (-b)/2.0
  else:
    echo @[(-b-sqrt(b^2-4*a*c))/(2.0*a),(-b+sqrt(b^2-4*a*c))/(2.0*a)].sorted().join(" ")

      

  

  
solve()