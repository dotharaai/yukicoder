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
    x *= x
    x.mod=md
    n = n shr 1


proc solve()=
  var
    t = scan()
    md = 998244353
    nk = newseqwith(t,(scan(),scan()))
  for (n,k) in nk:
    echo (n*((modPow(2,n*k,md)-modpow(2,(n-1)*(k),md)).mod(md)+md)).mod(md)



  
solve()