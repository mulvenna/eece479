stepsize 50
w z x add c b a
d
vector in a b c add

set in 0001
s
assert z 0
assert x 0
set in 0011
s
assert z 1
assert x 0
set in 0101
s
assert z 1
assert x 0
set in 0111
s
assert z 0
assert x 1
set in 1001
s
assert z 1
assert x 0
set in 1011
s
assert z 0
assert x 1
set in 1101
s
assert z 0
assert x 1
set in 1111
s
assert z 1
assert x 1

set in 0000
s
assert z 1
assert x 0
set in 0010
s
assert z 0
assert x 1
set in 0100
s
assert z 0
assert x 0
set in 0110
s
assert z 1
assert x 0
set in 1000
s
assert z 0
assert x 1
set in 1010
s
assert z 1
assert x 1
set in 1100
s
assert z 1
assert x 0
set in 1110
s
assert z 0
assert x 1

exit
