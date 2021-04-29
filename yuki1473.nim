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
    (n,m)=(scan(),scan())
    edges = newseqwith(n,newseq[int]())
    hv = newseqwith(n,newseq[int]())
    mx = 10^12
    maxw = newseqwith(n,0)
    touch = newseqwith(n,false)
    pastp = newseqwith(n,-1)
  for i in 0..<m:
    var
      (s,t,d)=(scan()-1,scan()-1,scan())
    edges[s].add(t)
    edges[t].add(s)
    hv[s].add(d)
    hv[t].add(d)

  var
    q = initDeque[(int,int)]()
  # 次の頂点、次の頂点を設定したときの重さ最大値
  maxw[0]=mx
  q.addLast((0,mx))
  touch[0]=true
  while q.len>0:
    var
      (p,w) = q.popFirst()
      pastmaxw = maxw[p]
    if maxw[p]>w:
      continue

    for idx in 0..<edges[p].len:
      var
        nxt = edges[p][idx]
        weight = min(hv[p][idx],pastmaxw)

      # 次の頂点に着く最大wが更新できるならする
      if maxw[nxt]<weight:
        maxw[nxt]=weight
        q.addLast((nxt,weight))
        pastp[nxt]=p
  #echo maxw
  #echo pastp
  var
    p = n-1
    c = 0

  while p!=0:
    p = pastp[p]
    c+=1
  echo maxw[n-1], " ", c


    

  
solve()