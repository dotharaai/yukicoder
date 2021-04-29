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


proc getLIS(arr:seq[int]):seq[int]=
  var n = arr.len
  result = newseqwith(n+2,int.high.div(2))
  result[0]=arr[0]
  proc binSearch(v:int,res:var seq[int]):int=
    var
      left = 0
      right = n+1
    if res[left]>v:
      return left
    else:
      while left+1<right:
        var mid = (left+right).div(2)
        if res[mid]<=v:
          left = mid
        else:
          right=mid
      return right
  
    
  


#echo getLIS(@[1,3,5,2,4,6])






proc solve():int=
  var
    inf = int.high.div(2)
    n = scan()

    a = newseqwith(n,scan()) # 左から単調増加
    lisA = newseqwith(n+1,inf)
    resA = newseqwith(n,0)
    inva = a.reversed() # 右から単調増加
    lisInvA = newseqwith(n+1,inf)
    resInvA = newseqwith(n,0)
    b = a.mapIt(-it) # 左から単調減少
    lisB = newseqwith(n+1,inf)
    resB = newseqwith(n,0)
    invb = b.reversed() # 右から単調減少
    lisInvB = newseqwith(n+1,inf)
    resInvB = newseqwith(n,0)
    
    
  
  proc binSearch(v:int,res:var seq[int]):int=
    var
      left = 0
      right = n+1
    if res[left]>=v:
      return left
    else:
      while left+1<right:
        var mid = (left+right).div(2)
        if res[mid]<v:
          left = mid
        else:
          right=mid
      return right

  proc getMinVal(arr:var seq[int]):int=
    var
      left = 0
      right = n+1
    if arr[left]==inf:
      return left
    else:
      while left+1<right:
        var mid = (left+right).div(2)
        if arr[mid]==inf:
          right=mid
        else:
          left = mid
      return left
  
  for i in 0..<n:
    # LISの更新 
    lisA[binSearch(a[i],lisA)]=a[i]
    lisInvA[binSearch(inva[i],lisInvA)]=inva[i]
    lisB[binSearch(b[i],lisB)]=b[i]
    lisInvB[binSearch(invb[i],lisInvB)]=invb[i]
    #echo lisA
    resA[i]=getMinVal(lisA)+1
    resB[i]=getMinVal(lisB)+1
    resInvA[n-i-1]=getMinVal(lisInvA)+1
    resInvB[n-1-i]=getMinVal(lisInvB)+1

  #echo resA , "単調増加列(iまで)"
  #echo resB, "単調減少列(iまで)"
  #echo resInvA, "単調減少列（iから）"
  #echo resInvB, "単調増加列（iから）"
  for i in 0..<n:
    result.max=min(resA[i],resInvA[i])-1
    result.max=min(resB[i],resInvB[i])-1

  

    
  return

  
  
  
  


  
echo solve()