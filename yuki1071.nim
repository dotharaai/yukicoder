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
    k = scan()
    x = scan() # 一人回復
    y = scan() # 全員回復
    a = newseqwith(n,((scan()-1)+(k-1)).div(k)).sorted(SortOrder.Ascending)
    magic = a.sum()
  # 全員回復0回のケース
  for i in 0..<n:
    result= min(a[i]*x+result,int.high.div(2))
  #echo a
  for i in 0..<n:
    # i人目が満タンになるまでは全員回復を使い、残りの全員分をベホイミする
    magic-=(a[i])
    #echo i," : ", a[i]*y+(magic)*x
    try:
      result.min=a[i]*y+(magic-a[i]*(n-1-i))*x
    except:
      result.min=int.high.div(2)
  
  
      

  
  
  
  

  

  
echo solve()