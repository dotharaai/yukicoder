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
    s = read()
    a = newseqwith(n,scan())
    enemyCount = newseqwith(n,newseqwith(n,0))
    breakCost = newseqwith(n+1,0)
    Q = scan()
    k = newseqwith(Q,scan())
  for i in 1..n:
    breakCost[i]=breakCost[i-1]+a[i-1]
  for x in 0..<n:
    if s[x]=='E':
      enemyCount[x][0]=1
    for y in x+1..<n:
      if s[y]=='E':
        enemyCount[x][y-x] = enemyCount[x][y-1-x] + 1
      else:
        enemyCount[x][y-x] = enemyCount[x][y-1-x]
  
  #echo enemyCount.join("\n")

  #echo breakCost
  proc tryIt(x,m:int,p:int):bool=
    return breakCost[m+1]-breakCost[x]<=p




  proc binSearch(x,p,left,right:int):int=
    if left+1==right:
      return left
    else:
      var mid = (left+right).div(2)
      if tryIt(x,mid,p):
        return binSearch(x,p,mid,right)
      else:
        return binSearch(x,p,left,mid)
  
  for q in 0..<Q:
    var
      res = 0
      p = k[q]
    #echo "query ", q
    #echo "pow ", p
    for x in 0..<n:
      #echo fmt"  {breakCost[x+1]-breakCost[x]}"
      #echo "  ",tryIt(x,x,p), tryIt(x,n-1,p)
      if not tryIt(x,x,p):
        res.max=0
      elif tryIt(x,n-1,p):
        res.max=enemyCount[x][n-1-x]
      else:
        var right = binSearch(x,p,0,n-1)
        #echo fmt"  {x} => {right} (cost: {breakCost[right+1]-breakCost[x]})"
        #echo fmt"  {tryIt(x,right,p)}"
        res.max=enemyCount[x][right-x]
    echo res


      







  
solve()