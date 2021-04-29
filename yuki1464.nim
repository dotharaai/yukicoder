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



proc solve():string=
  var
    x = read()
    p = x.find(".")
  if p == -1:
    return x & "/1"
  else:
    var
      t = x.split(".").join()
      n = t.parseInt*10^(8-(x.len-p-1))
      v = 10^8
    #echo fmt"{n}/{v}"
    return fmt"{n.div(gcd(n,v))}/{v.div(gcd(n,v))}"

    
  
  
  


  

  
echo solve()