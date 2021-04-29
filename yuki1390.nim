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



proc solve():int=
  var
    (n,m) = (scan(),scan())
    colors = newseqwith(n,newseq[int]())
    roots = newseqwith(m,0)
  for i in 0..<m:
    roots[i]=i
  for i in 0..<n:
    var  (b,c)=(scan()-1,scan()-1)
    colors[c].add(b)


  proc find(x:int):int=
    if roots[x]==x:
      return x
    else:
      roots[x]=find(roots[x])
      return roots[x]
  proc unite(x,y:int)=
    
    var
      rx = find(x)
      ry = find(y)
    if rx==ry:
      return
    else:
      roots[max(rx,ry)]=min(rx,ry)


  for color in colors:
    for i in 1..<color.len:
      if find(color[0])!=find(color[i]):
        unite(color[0],color[i])
        result+=1
  




  

  
echo solve()