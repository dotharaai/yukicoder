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

var
  D = 1E9.int+7
  m:int = 1E6.int
  fac:seq[int]
  finv:seq[int]
  inv:seq[int]
proc comInit()=
  fac = newseqwith(m,1)
  finv = newseqwith(m,1)
  inv = newseqwith(m,1)
  for i in 2..<m:
    fac[i] = fac[i-1]*i mod D
    inv[i] = D - inv[D mod i] * (D div i) mod D
    finv[i] = finv[i-1] * inv[i] mod D

proc com(n,k:int):int=
  if  n<k:return 0
  elif n<0 or k<0: return 0
  else:
    return fac[n] * (finv[k]*finv[n-k] mod D) mod D

proc H(n,r:int):int=
  return com(n+r-1,r)

comInit()


proc modPow(n,x,md:int):int=
  var
    n = n
    x = x
  result = 1
  while n>0:
    if (n and 1)>0:
      result*=x
      result.mod=md
    n = n shr 1
    x = x*x
    x.mod=md
    

proc solve():int=
  var
    md = 10^9+7
    (a,b)=(scan().mod(md),scan().mod(md))
    (n,k)=(scan(),scan())
    
    sm = 0  
    ca = com(n-1,k-1)
    cb = com(n-1,k-2)
  echo (ca*a+cb*b).mod(md)
  for i in 0..n+1:
    sm += ((com(n-1,i-1)*a+com(n-1,i-2)*b).mod(md))^2
    sm.mod=md
  return sm


  

  
echo solve()