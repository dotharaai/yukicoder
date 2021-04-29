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



const
  r = 200001
var
  fIdx : array[-r..r, int]
  lIdx : array[-r..r, int]


proc solve():int=
  var
    s = read()
    n = s.len
    cum = newseqwith(n,0)
  
  for i in -r..r:
    fIdx[i] = -2
    lIdx[i] = -2
  fIdx[0] = -1
  lIdx[0] = -1
  if s[0]=='A':
    cum[0]= 1
  else:
    cum[0]= -1
  fIdx[cum[0]]=0
  lIdx[cum[0]]=0
  for i in 1..<n:
    if s[i]=='A':
      cum[i]=cum[i-1]+1
    else:
      cum[i]=cum[i-1]-1
    if fIdx[cum[i]] == -2:
      fIdx[cum[i]] = i
    lIdx[cum[i]] = i
  #echo cum
  for i in -r..r:
    #if fIdx[i] != -1 and lIdx[i] != -1:
    result.max = lIdx[i] - fIdx[i]
  return


  

  
  

  
  
  

  
echo solve()