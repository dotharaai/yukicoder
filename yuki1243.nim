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
    ab = newseqwith(t,(scan(),scan()))
    memo:Table[int,(int,int)]
    inf = int.high.div(2)


  proc f(a,b:int):seq[int]=
    var
      q = initDeque[int]()
      b = b
    while b!=a:
      if b.mod(2)==0 and b.div(2)>=a:
        q.addFirst(b.div(2))
        b = b.div(2)
      else:
        q.addFirst(1)
        b -= 1

    return  q.toSeq()


  for i in 0..<t:
    var
      (a,b)=ab[i]
      ss = f(a,b)
    echo ss.len
    echo ss.join(" ")
    

    
    
    
  

  
solve()