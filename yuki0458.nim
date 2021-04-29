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



proc getIsPrimes(n:int):seq[bool]=
  result = newseqwith(n+1,true)
  var
    d = 2
  result[0]=false
  result[1]=false
  while d^2<=n:
    if result[d]:
      var m = 2
      while d*m<=n:
        result[d*m]=false
        m+=1
    d+=1
    

const maxp = 20000

const isPrime:seq[bool] = getIsPrimes(maxp)

proc getPrimes(n:seq[bool]):seq[int]=
  for i in 2..<n.len:
    if n[i]:
      result.add(i)


const primes = getPrimes(isPrime)


proc solve():int=
  var
    n = scan()
    mx = 20000
    dp = newseqwith(2,newseqwith(mx+1,0))
  dp[0][2]=1
  for pi in 1..<len(primes):
    var p = primes[pi]
    dp[pi mod 2][p].max=1
    for i in 0..mx:
      dp[pi mod 2][i].max=dp[(pi-1) mod 2][i]
      if i-p>=0 and dp[(pi-1) mod 2][i-p]>0:
        dp[pi mod 2][i].max=dp[(pi-1) mod 2][i-p]+1
  if dp[(primes.len-1) mod 2][n]==0:
    return -1
  else:
    return dp[(primes.len-1) mod 2][n]


  

  
echo solve()