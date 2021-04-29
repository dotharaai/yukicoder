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
    n = scan()
    edges = newseqwith(n,newseq[int]())
    edge_in = newseqwith(n,0)
    depth = newseqwith(n,0)
    root = -1
    md=10^9+7
  for i in 0..<n-1:
    var (s,t) = (scan()-1,scan()-1)
    edges[s].add(t)
    edge_in[t]+=1
  
  for i in 0..<n:
    if edge_in[i]==0:
      root=i
  #echo edges
  proc dfs(r:int)=
    var q = initDeque[int]()
    q.addlast(r)
    depth[r]=0
    while q.len>0:
      var p = q.popFirst()
      for nxt in edges[p]:
        depth[nxt]=depth[p]+1
        q.addLast(nxt)
  dfs(root)
  #echo depth
  for i in 0..<n:
    result+=(depth[i]*(depth[i]+1)).div(2)
    result.mod=md




  

      

  

  
echo solve()