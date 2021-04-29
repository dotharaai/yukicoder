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
    nw = scan()
    w = newseqwith(nw,scan()).sorted(SortOrder.Descending)
    nb = scan()
    b = newseqwith(nb,scan()).sorted(SortOrder.Descending)
    idxw=0
    idxb=0
    bottom = 0
    bottomc = 0
    res = 1
  #echo w
  #echo b
  
  bottom = w[0]
  bottomc = 0
  while true:
    if bottomc==0:# bottom==white
      while idxb<nb and b[idxb]>=w[idxw]:
        idxb+=1
      if idxb==nb:
        break
      else:
        bottomc = 1
        res+=1
    else:
      while idxw<nw and w[idxw]>=b[idxb]:
        idxw+=1
      if idxw==nw:
        break
      else:
        bottomc = 0
        res+=1
  result=res
  bottom = b[0]
  bottomc = 1
  idxw=0
  idxb=0
  res=1

  while true:
    if bottomc==0:# bottom==white
      while idxb<nb and b[idxb]>=w[idxw]:
        idxb+=1
      if idxb==nb:
        break
      else:
        bottomc = 1
        res+=1
    else:
      while idxw<nw and w[idxw]>=b[idxb]:
        idxw+=1
      if idxw==nw:
        break
      else:
        bottomc = 0
        res+=1
  result.max=res

  


  
  
  
  

  
echo solve()
