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



proc prepare(n=2*10^6):seq[int]=
  result = newseqwith(n+1,2)
  result[0]=0
  result[1]=1

  for i in 2..n:
    for nxt in countup(2*i,n,i):
      result[nxt]+=1


let v = prepare()
#echo v


proc solve()=
  var
    x = scan()
    minv = int.high.div(2)
  for a in 1..x.div(2):
    minv.min=abs(a-v[a]-(x-a-v[x-a]))
  for a in 1..<x:
    if abs(a-v[a]-(x-a-v[x-a]))==minv:
      echo fmt"{a} {x-a}"


  

  
solve()