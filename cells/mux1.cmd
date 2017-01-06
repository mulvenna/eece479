stepsize 50
w z sel2b sel1b sel2 sel1 c b a
d
vector in a b c sel1 sel2 sel1b sel2b

set in 0000110
s
assert z 0
set in 0010110
s
assert z 0
set in 0100110
s
assert z 0
set in 0110110
s
assert z 0
set in 1000110
s
assert z 1
set in 1010110
s
assert z 1
set in 1100110
s
assert z 1
set in 1110110
s
assert z 1

set in 0001001
s
assert z 0
set in 0011001
s
assert z 0
set in 0101001
s
assert z 1
set in 0111001
s
assert z 1
set in 1001001
s
assert z 0
set in 1011001
s
assert z 0
set in 1101001
s
assert z 1
set in 1111001
s
assert z 1

set in 0001100
s
assert z 0
set in 0011100
s
assert z 1
set in 0101100
s
assert z 0
set in 0111100
s
assert z 1
set in 1001100
s
assert z 0
set in 1011100
s
assert z 1
set in 1101100
s
assert z 0
set in 1111100
s
assert z 1

exit
