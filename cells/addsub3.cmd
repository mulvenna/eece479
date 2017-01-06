stepsize 50
w z0 z1 z2
d

| Set up vectors
vector a a{2:0}
vector b b{2:0}
|add is also an input

|test adding first
h add

set a 000
set b 000
s
assert z2 0
assert z1 0
assert z0 0

set a 001
set b 010
s
assert z2 0
assert z1 1
assert z1 1

set a 010
set b 011
s
assert z2 1
assert z1 0
assert z0 1

|testing subtracting now
l add

set a 000
set b 000
s
assert z2 0
assert z1 0
assert z0 0

set a 111
set b 111
s
assert z2 0
assert z1 0
assert z0 0

set a 100
set b 001
s
assert z2 0
assert z1 1
assert z0 1

set a 010
set b 001
s
assert z2 0
assert z1 0
assert z0 1

exit
