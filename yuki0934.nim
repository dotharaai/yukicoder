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
    recipe = newseqwith(n,true)
  for i in 0..<n:
    echo fmt"? {n-1}"
    var t = newseq[int]()
    for j in 0..<n:
      if i!=j:
        t.add(j+1)
    echo t.join(" ")
    var
      ans = scan()
    if ans == 1:
      recipe[i] = false
    #else:

  var
    a = newseq[int]()
  for i in 0..<n:
    if recipe[i]:
      a.add(i+1)
  echo fmt"! {a.len}"
  echo a.join(" ")

  
solve()