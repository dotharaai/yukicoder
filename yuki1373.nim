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
    a = newseq[(int,int)]()
    res = newseqwith(n-1,0)
    p=true
  for i in 0..<n-1:
    a.add((scan(),i))
  a.sort(SortOrder.Descending)
  for i in 0..<n-1:
    var (length,idx)=a[i]
    if i+length<=n-1:
      res[idx]= n-(i+length)
    else:
      p=false
      break
  if p:
    echo "YES"
    echo res.join("\n")
  else:
    echo "NO"


  

  
solve()