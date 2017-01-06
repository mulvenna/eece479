stepsize 50
w n0 n1
d
vector in start sign c1 c0 c1b c0b

set in 000011
s
assert n1 0
assert n0 1

set in 000110
s
assert n1 1
assert n0 1

set in 001001
s
assert n1 0
assert n0 1

set in 001100
s
assert n1 0
assert n0 1

set in 010011
s
assert n1 0
assert n0 1

set in 010110
s
assert n1 1
assert n0 0

set in 011001
s
assert n1 0
assert n0 1

set in 011100
s
assert n1 0
assert n0 1

| next state is always A/00 when start in high

set in 100011
s
assert n1 0
assert n0 0

set in 100110
s
assert n1 0
assert n0 0

set in 101001
s
assert n1 0
assert n0 0

set in 101100
s
assert n1 0
assert n0 0

set in 110011
s
assert n1 0
assert n0 0

set in 110110
s
assert n1 0
assert n0 0

set in 111001
s
assert n1 0
assert n0 0

set in 111100
s
assert n1 0
assert n0 0

exit
