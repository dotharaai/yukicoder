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
    n = scan()
    q = scan()
    s = read()
    qs = newseqwith(q,(scan()-1,scan(),scan()))
    words = newseqwith(26,newseqwith(n+1,0))
  for i in 0..<26:
    var
      c = ('a'.ord + i).chr
    for idx in 0..<n:
      if s[idx]==c:
        words[i][idx+1]=words[i][idx]+1
      else:
        words[i][idx+1]=words[i][idx]
  #echo qs
  #echo words[0]
  for (l,r,x) in qs:
    var
      cnt = 0
    for i in 0..<26:
      if cnt+words[i][r]-words[i][l]>=x:
        echo ('a'.ord + i).chr
        break
      else:
        cnt+=words[i][r]-words[i][l]

  
  
  

  
solve()