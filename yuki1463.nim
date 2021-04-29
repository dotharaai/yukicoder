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
    (n,k)=(scan(),scan())
    a = newseqwith(n,scan())
    gen = initHashSet[int]()
  
  for i in 0..2^n:
    var
      u = i.toBin(n)
    if u.count('1')>=k:
      var
        m = 1
        s = 0
      #echo u
      for jdx,use in u:
        if use=='1':
          m*=a[jdx]
          s+=a[jdx]
      gen.incl(m)
      gen.incl(s)
  return gen.len



  

  
echo solve()