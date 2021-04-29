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


proc modPow(x,n,md:int):int=
  var
    x = x
    n = n
  result=1
  while n>0:
    if (n and 1)>0:
      result*=x
      result.mod=md
    x*=x
    x.mod=md
    n = n shr 1

proc solve():int=
  var
    (p,n)=(scan(),scan())
    a = newseqwith(n,scan())
    s = read()
  result = a[0]
  for i in 0..<n-1:
    #echo fmt"{result}{s[i]}{a[i+1]}="
    if s[i]=='*':
      result=(result*a[i+1])
    elif s[i]=='+':
      result+=a[i+1]
    elif s[i]=='-':
      result+=(p-a[i+1])
    else:
      #echo fmt"{a[i+1]}^{p-2} = {modPow(a[i+1],p-2,p)}"
      result*=modPow(a[i+1],p-2,p)
    result.mod=p
    
  

  

  
echo solve()