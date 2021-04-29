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
    n = scan()
    a = newseqwith(n,scan())
    ca = newseqwith(n+1,0)
  for i in 0..<n:
    ca[i+1]=ca[i]+a[i]

  #echo ca
  proc binSearch(le,n,deli:int):(int,bool)=
    
    var
      left = le+1
      right = n
    #echo fmt"le:{le}, left:{left}, right:{n}"
    if ca[right]-ca[le]<deli:
      return (-1,true)
    if ca[right]-ca[le]==deli:
      return (right,false)
    if ca[left]-ca[le]>deli:
      return (-1,true)
    var
      mid:int
    while left+1<right:
      #echo fmt"left:{left},{ca[left]-ca[le]},  right:{right}, {ca[right]-ca[le]}"
      mid = (left+right).div(2)
      if ca[mid]-ca[le]>deli:
        right=mid
      else:
        left=mid
    if ca[left]-ca[le]==deli:
      return (left,false)
    else:
      return (-1,true)


  proc devide(deli:int):int=
    #echo fmt"deli: {deli}"
    var
      le = 0
      err = false
    while le!=n:
      (le, err) = binSearch(le,n,deli)
      if err:
        return 0
      else:
        result+=1
    #if result==38:
      #echo "!!! deli = ", deli
      

  for d in a.max..a.sum():
    result.max=devide(d)
    if result>0:
      return 
    
    
    

  
echo solve()