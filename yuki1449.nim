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



proc solve():int{.discardable.}=
  var
    n = scan()
    m = scan()
    es = newseqwith(n,newseq[int]())
    co = newseqwith(n,newseq[int]())
    arrive = newseqwith(n,int.high)
    eat:seq[int]
  for i in 0..<m:
    var
      (a,b,c)=(scan()-1,scan()-1,scan())
    es[a].add(b)
    es[b].add(a)
    co[a].add(c)
    co[b].add(c)
  eat = newseqwith(n,scan())


  proc dfs(p,t:int,cum:int,arriveT:int):int=
    echo p,",",t
    result = int.high.div(2)
    if p==t:
      return arriveT
    else:
      var
        dep = arriveT+eat[p]
        cum = cum + eat[p]
      for idx in 0..<es[p].len:
        var
          nxt = es[p][idx]
          cost = co[p][idx]
        #if arrive[nxt]>dep+cost.div(cum)+eat[nxt]:
          #arrive[nxt] = dep+cost.div(cum)+eat[nxt]
        result.min=dfs(nxt,t,cum,dep+cost.div(cum))
  return dfs(0,n-1,0,0)



  
  
echo solve()