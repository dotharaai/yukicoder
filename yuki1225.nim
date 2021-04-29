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
    s = newseqwith(n,scan())
    t = newseqwith(n,scan())
    mat = newseqwith(n,newseqwith(n,0))
    any1_row = newseqwith(n,false)
    any1_col = newseqwith(n,false)
    fix = newseqwith(n,newseqwith(n,false))
  for i in 0..<n:
    # see each row
    if s[i]==0:
      for j in 0..<n:
        mat[i][j]=0
        fix[i][j]=true
    elif s[i]==2:
      for j in 0..<n:
        mat[i][j]=1
        fix[i][j]=true
        any1_col[j]=true

    # see each col
    if t[i]==0:
      for j in 0..<n:
        mat[j][i]=0
        fix[j][i]=true
    elif t[i]==2:
      for j in 0..<n:
        mat[j][i]=1
        fix[j][i]=true
        any1_row[j]=true
  var
    need_row = 0
    need_col = 0
  #echo any1_row
  #echo any1_col
  for i in 0..<n:
    if s[i]==1 and any1_row[i]==false:
      need_row+=1
    if t[i]==1 and any1_col[i]==false:
      need_col+=1
  #echo need_row, ", ", need_col
  #echo s.count(2), ", ", t.count(2)
  return max(need_row,need_col) + (s.count(2) + t.count(2))*n - s.count(2)*t.count(2)
    

    

  

  
echo solve()