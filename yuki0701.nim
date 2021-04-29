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
  for i in 1..<n:
    
    var t = i
    stdout.write("a")
    while t>0:
      #echo t,":", t.mod(10)," => ", (t.mod(10)+'a'.ord).chr
      stdout.write((t.mod(10)+'a'.ord).chr)
      t = t.div(10)
    echo "a"
  echo "an"
    


  
solve()