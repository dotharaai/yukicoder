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



proc modPow(x,n,md:int):int=
  var
    x = x
    n = n
  result = 1
  while n>0:
    if (n and 1)>0:
      result*=x
      result.mod=md
    n = n shr 1
    x = (x*x).mod(md)


proc solve():auto{.discardable.}=
  var
    a = scan()
    b = scan()
    c = scan()
    d = scan()
    n = scan()
    md = 10^9+7
    
  if n.mod(4)==1:
    if n.div(4).mod(2)==0:
      result = ((2*b).mod(md)*modPow(-4,n.div(4),md)).mod(md)
    else:
      result = ((2*a).mod(md)*modPow(-4,n.div(4),md)).mod(md)
  if n.mod(4)==2:
    if n.div(4).mod(2)==0:
      result = ((2*(b-c)).mod(md)*modPow(-4,n.div(4),md)).mod(md)
    else:
      result = ((2*(a-d)).mod(md)*modPow(-4,n.div(4),md)).mod(md)
  if n.mod(4)==3:
    if n.div(4).mod(2)==0:
      result = ((-4*c).mod(md)*modPow(-4,n.div(4),md)).mod(md)
    else:
      result = ((-4*d).mod(md)*modPow(-4,n.div(4),md)).mod(md)
  if n.mod(4)==0:
    if n.div(4).mod(2)==0:
      result = (b+d).mod(md)*modPow(-4,n.div(4),md).mod(md)
    else:
      result = (a+c).mod(md)*modPow(-4,n.div(4),md).mod(md)
  result.mod=md
  result+=md
  result.mod=md



  

  
echo solve()