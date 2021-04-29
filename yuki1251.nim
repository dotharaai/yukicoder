import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques#,bigints
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
    a = newseqwith(n,scan())
    b = newseqwith(n,scan())



  proc eval(x:int):int=
    result = 0#initBigint(0)
    for i in 0..<n:
      try:
        result+=(b[i]*abs(a[i]-x))#.initBigInt()
      except:
        return int.high
      
  
  proc fibSearch(lo:int,hi:int):int=
    var
      fib = newseqwith(2,1)
      hi=hi
      lo=lo
      m = 0
    #echo lo,", ", hi
    fib[0]=0
    while fib[fib.len-1] < hi-lo+1:
      fib.add(fib[fib.len-1]+fib[fib.len-2])
    m = fib.len-1
    #echo "m:",m
    while m>=2:
      var
        x1 = lo+fib[m-2]
        x2 = lo+fib[m-1]
        y1 = eval(x1)
        y2 = eval(x2)
      #echo fmt"{lo}, {x1}({x1-lo}), {x2}({x2-lo}), {fib[m]}"
      if y1>=y2:
        lo=lo+fib[m-2]
      
      m -= 1
    return lo
  

  var t= fibSearch(-(10^6),10^6)
  echo t, " ", eval(t)

  return 

solve()