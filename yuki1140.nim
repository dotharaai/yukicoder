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
  var
    d = 2
    m = 2

  while d^2<=n:
    if result[d]:
      m = 2
      while d*m<=n:
        result[d*m]=false
        m+=1
    d+=1

      

var isPrime = getIsPrime(5*10^6)


proc solve()=
  var
    t = scan()
    ap = newseqwith(t,(scan(),scan()))
  for (a,p) in ap:
    if not isPrime[p]:
      echo -1
    else:
      if gcd(a,p)!=1:
        echo  0
      else:
        echo  1





  
    

  
solve()