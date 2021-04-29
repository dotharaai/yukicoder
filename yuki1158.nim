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


proc getIsPrime(n:int):seq[bool]=
  result = newseqwith(n+1,true)
  result[0]=false
  result[1]=false
  for i in 2..n:
    if result[i]:
      var d = 2
      while i*d<=n:
        result[i*d]=false
        d+=1
  



let isPrime =  getIsPrime(10^7)



proc getPrimes():seq[int]=
  for i,v in isPrime:
    if v:
      result.add(i)


let primes = getPrimes()

proc solve():int=
  var
    (a,b,n)=(scan(),scan(),scan())
    md = 10^7+7
  result = 1
  for x in 1..b:
    var pIdx=0
    while pIdx < primes.len and x*primes[pIdx]<=b:
      var
        pa = int.high
        pb = 0
        p = 0
      while x*(primes[pIdx]^p)<=b:
        if x*(primes[pIdx]^p)>=a:
          pa.min=p
        pb.max=p
        p+=1
      pIdx+=1
      #echo fmt"{x} : {primes[pIdx]}, {pa}, {pb}"


    
  
  
echo solve()