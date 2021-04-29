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
    a = newseq[(int,int)](n)
    available = newseqwith(n,true)
    m = -1
  for i in 0..<n:
    a[i]=(scan(),i)
  a.sort()
  for i in 0..<n:
    if m<a[i][0] and available[a[i][1]]:
      m = a[i][0]
      result+=1
      available[a[i][1]]=false
      if a[i][1]-1>=0:
        available[a[i][1]-1]=false
      



  
echo solve()