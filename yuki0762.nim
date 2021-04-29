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
    d = 10^9+7
    n = scan()
    m = scan()
    s = read()
    nxt = newseqwith(n,0)
    memo = newseqwith(n,-1)
    edges = newseqwith(n,newseq[int]())

  for i in 0..<m:
    var (u,v) = (scan()-1,scan()-1)
    edges[u].add(v)
    edges[v].add(u)

  proc search(st:int):int=
    if memo[st] != -1:
      return memo[st]
    else:
      for nxt in edges[st]:

        if s[st]=='P' and s[nxt]=='D':
          result+=search(nxt)
        elif s[st]=='D' and s[nxt]=='C':
          result+=search(nxt)
        elif s[st]=='C' and s[nxt]=='A':
          result+=1
      memo[st] = result.mod(d)
      return result
  #echo s
  for st in 0..<n:
    if s[st]=='P':
      result+=search(st)
      #echo st,",",search(st)
      result.mod=d

  
echo solve()