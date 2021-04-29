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



proc getLowLink(G:seq[seq[int]],start:int=0):(seq[int],seq[(int,int)])=
  var
    N = G.len
    order = newseqwith(N,-1)
    used = newseqwith(N,false)
    loww = newseqwith(N,0)
    acP = newseq[int]()
    bridge = newseq[(int,int)]()

  proc dfs(idx, k, par:int):int=
    var
      k = k
      isA = false
      cnt = 0
    used[idx]=true
    order[idx]=k
    k+=1
    loww[idx]=order[idx]
    
    for nxt in G[idx]:
      if not used[nxt]:
        cnt+=1
        k = dfs(nxt,k,idx)
        loww[idx].min=loww[nxt]
        isA = isA or  ( par != -1 and (loww[nxt] >= order[idx]))
        if order[idx]<loww[nxt]:
          bridge.add((min(idx,nxt),max(idx,nxt)))
      elif nxt != par:
        loww[idx].min=order[nxt]

    isA = isA or (par == -1 and cnt>1)
    if isA:
      acP.add(idx)
    return k
  
  proc build()=
    var k = 0
    for i in 0..<N:
      if not used[i]:
        k = dfs(i,k,-1)

  build()
  
  return (acP, bridge)


var
  case1 = @[
    @[1],
    @[0,2],
    @[1,3],
    @[2]
  ]
  case2 = @[
    @[1],
    @[0,2],
    @[1]
  ]

#echo getLowLink(case2)

proc solve():string=
  var
    n = scan()
    es = newseqwith(n,newseq[int]())
    q = initDeque[int]()
    cnt = 0
    touched = newseqwith(n,-1)

  for i in 0..<n-1:
    var
      f = scan()
      t = scan()
    es[f].add(t)
    es[t].add(f)
  var
    (acP,bridge)=getlowlink(es)
  for i in 0..<n:
    #echo i, ", ", touched[i]
    if touched[i]<0:
      touched[i]=cnt
      q.addLast(i)
      while q.len>0:
        var p = q.popFirst()
        for nxt in es[p]:
          if touched[nxt]<0:
            touched[nxt]=cnt
            q.addLast(nxt)
      cnt+=1
  
  if cnt+min(1,bridge.len)>=3:
    return "Alice"
  else:
    return "Bob"
  

  
echo  solve()
  