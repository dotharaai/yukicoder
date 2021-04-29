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
    abc = newseqwith(t, (scan(),scan(),scan()))
  for (a,b,c) in abc:
    var
      costA=0
      costB=0
      a = a
      b = b
      c = c
      v = 0
    # a<b>cにする
    if a==c:
      a -= 1
      v = 1
    if b<=2:
      costA = int.high.div(2)
    else:
      costA = max(0,a-(b-1))+max(0,c-(b-1))
    # a>b<cにする
    if a<=1 or c<=1:
      costB=int.high.div(2)
    else:
      costB = max(0,b-(min(a,c)-1))
    if min(costA,costB)==int.high.div(2):
      echo -1
    else:
      echo costA,",", costB
      echo min(costA,costB)+v
      
    
    
  
  
solve()