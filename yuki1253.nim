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
    t = scan()
    md = 10^9+7

  proc modpow(x,n:int):int=
    var
      x=(x).mod(md)
      n=n
    result = 1
    
    while n>0:
      if (n and 1)>0:
        result*=x
        result.mod=md
      x=(x*x).mod(md)
      n = n shr 1

  for i in 0..<t:
    var
      (n,ag,bg,ac,bc,ap,bp) = (scan(),scan(),scan(),scan(),scan(),scan(),scan())
      b = ((bg*bc).mod(md)*bp).mod(md)
    ag*=(bc*bp).mod(md)
    ac*=(bg*bp).mod(md)
    ap*=(bc*bg).mod(md)
    ag.mod=md
    ap.mod=md
    ac.mod=md
    var
      base = modpow(b,n)
      case0 = modpow(ag,n)+modpow(ap,n)+modpow(ac,n)
      case1 = base-modpow(ag+ac,n)-modpow(ag+ap,n)-modpow(ap+ac,n)+case0
      case2 = (case0+case1) mod md
    echo ((case2*modpow(base,md-2)) mod md + md).mod(md)
    



  
solve()