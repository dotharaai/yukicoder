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


proc matMul(a,b:seq[seq[int]],md:int):seq[seq[int]]=
  result = newseqwith(2,newseqwith(2,0))
  for i in 0..<a.len:
    for j in 0..<a[0].len:
      for k in 0..<b.len:
        result[i][j] += a[i][k]*b[k][j]
      result[i][j].mod=md

  




proc modPow(v:seq[seq[int]],n:int,md:int):seq[int]=
  result = newseqwith(2,1)
  var
    v = v
    n = n
  while n>0:
    if (n and 1)>0:
      for i in 0..<2:
        result[i]=v[i][0]*result[0]+v[i][1]*result[1]
        result[i].mod=md
    v = matMul(v,v,md)
    n = n shr 1
  return


proc solve():int=
  var
    n = scan()
    md = 10^9+7
    t = @[@[-1,1],@[0,3]]
    v = modPow(t,n,md)
  return v[0]
  
  
echo solve()