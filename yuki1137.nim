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


const 
  le = -4*(10^5)
  re = 4*(10^5)

proc solve():int=
  var
    n = scan()
    x = newseqwith(n,0)
    r = newseqwith(n,0)
    
    cum:array[le..re,int]

  for i in 0..<n:
    var (x,r)=(2*scan(),2*scan())
    cum[x-r+1]+=1
    cum[x+r]-=1
  for i in le+1..re:
    cum[i]+=cum[i-1]
    result.max=cum[i]
  
  



  

  
echo solve()