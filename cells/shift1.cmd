stepsize 50
w out inbit in shift shiftb
d
vector invector shift shiftb in inbit

set invector 0100
s
assert out 0
set invector 0101
s
assert out 0
set invector 0110
s
assert out 1
set invector 0111
s
assert out 1

set invector 1000
s
assert out 0
set invector 1001
s
assert out 1
set invector 1010
s
assert out 0
set invector 1011
s
assert out 1

exit
