stepsize 50
w q reset clk d
d
vector in d clk reset

set in 001
s
assert q 0

set in 000
s
assert q 0
set in 010
s
assert q 0 

set in 100
s
assert q 0
set in 110
s
assert q 1

set in 100
s
assert q 1

set in 000
s
assert q 1
set in 010
s
assert q 0

set in 100
s
assert q 0
set in 110
s
assert q 1


set in 101
s
assert q 0

set in 100
s
assert q 0

set in 110
s
assert q 1

set in 100
s
assert q 1

set in 000
s
assert q 1

set in 011
s
assert q 0


|check whether it is edge-sensitive (vs level-sensitive)
l clk
l d
h reset
s
l reset
s
assert q 0
h clk
s
assert q 0
h d
s
assert q 0
l clk
s
h clk
s
assert q 1
l d
s
assert q 1

exit
