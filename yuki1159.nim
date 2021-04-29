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
    s = read()
    snum = newseqwith(s.len,0)
  if s[0]=='S':
    snum[0]=1
  for i in 1..<s.len:
    if s[i]=='S':
      snum[i]=snum[i-1]+1
    else:
      snum[i]=snum[i-1]
  for i in 0..<s.len-2:
    if s[i..<i+3]=="ing":
      result+=snum[i]
  
  
echo solve()