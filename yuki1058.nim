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
    result = newSeqWith(n+1,true)
    result[1] = false
    result[0] = false
    for i in 2..n.float.sqrt.int:
        if not result[i]:continue
        for j in countup(i*2,n,i):
            result[j] = false


    
const isPrime:seq[bool] = getIsPrimes(200000)



proc preSolve():seq[int]=
  var t = newseq[int]()
  var
    idx=10^5+1
  while t.len<100:
    while not isPrime[idx]:
      idx+=1
    t.add(idx)
    idx+=1
  result.add(1)
  for i in 0..<100:
    for j in 0..<100:
      result.add(t[i]*t[j])
  result.sort()
  result.deduplicate()
    
var v = preSolve()

#echo v[0..20]

proc solve():int=
  return v[scan()-1]
    
  

  
echo solve()