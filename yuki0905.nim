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

type SegTree = object
  tree :seq[int]
  n:int

proc initSegTree(baseArr:seq[int]):SegTree=
  var n = baseArr.len
  var m = 1
  while m < n:
    m*=2
  result = SegTree()
  result.n = m
  result.tree = newseqwith(2*m-1,int.high.div(4))
  for i, v in baseArr:
    result.tree[m-1+i]=v
  for idx in countdown(m-2,0):
    result.tree[idx] = min(result.tree[idx*2+1],result.tree[idx*2+2])

proc get(segTree:SegTree,ql,qr:int,k:int=0,left:int=0,right:int= -1):int=
  var right=right
  if right<0:
    right = segTree.n
  #echo ql,", ", qr, ", ",left,", ", right
  if ql>=right or qr<=left:
    return int.high
  if ql <= left and right <= qr:
    return segTree.tree[k]
  var
    vl = segTree.get(ql,qr,2*k+1,left,(left+right).div(2))
    vr = segTree.get(ql,qr,2*k+2,(left+right).div(2),right)
  return min(vl,vr)

proc set(segTree:var SegTree,idx,value:int)=
  var k = segTree.n - 1 + idx
  segTree.tree[k] = value
  while k>=1:
    k = k.div(2)
    if segTree.tree[k] == min(segTree.tree[2*k+1],segTree.tree[2*k+2]):
      break
    else:
      segTree.tree[k] = min(segTree.tree[2*k+1],segTree.tree[2*k+2])

proc solve()=
  var
    n = scan()
    a = newseqwith(n,scan())
    q = scan()
    lr = newseqwith(q,(scan(),scan()))
    isInc = newseqwith(n-1,0)
    isDec = newseqwith(n-1,0)
  for i in 0..<n-1:
    if a[i]<=a[i+1]:
      isInc[i] = 1
    if a[i]>=a[i+1]:
      isDec[i] = 1
  var
    segIsInc = isInc.initSegTree()
    segIsDec = isDec.initSegTree()
  #echo segIsInc
  for (l,r) in lr:
    if l==r:
      echo "1 1"
    else:
      echo segIsInc.get(l,r), " ", segIsDec.get(l,r)
  
    
    
  

  
solve()