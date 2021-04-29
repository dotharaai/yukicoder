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

  
  proc score(a,b,c:int):int=
    if a!=b and b!=c and c!=a and ((a>b and b<c) or (a<b and b>c)):
      return a
    else:
      return -int.high.div(4)

  for i in 0..<t:
    var
      n = scan()
      a = newseqwith(n,scan())
      d = newseqwith(3,newseqwith(n,0))
    a = a&a

    
    for offs in 0..2:
      for i in 2..<n:
        if i>2:
          d[offs][i].max=max(d[offs][i-1],d[offs][i-3]+score(a[offs+i-2],a[offs+i-1],a[offs+i]))
        else:
          d[offs][i].max=max(d[offs][max(0,i-1)],score(a[offs+i-2],a[offs+i-1],a[offs+i]))
      #echo offs,",",d[offs]
    echo max(@[d[0][n-1],d[1][n-1],d[2][n-1]])




    
    
  

  
solve()