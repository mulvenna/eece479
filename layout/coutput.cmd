stepsize 50
w add inbit shift sel2 sel1 load
d
vector in c1 c0 c1b c0b

|state A
set in 0011
s
assert load 1
assert sel1 1
assert sel2 0
assert shift 1
assert inbit 0
|don't care for add

|state B
set in 0110
s
assert load 0
assert sel1 0
assert sel2 1
assert shift 0
|don't care for inbit
assert add 0

|state C
set in 1001
s
assert load 0
assert sel1 0
assert sel2 1
assert shift 1
assert inbit 0
assert add 1

|state D
set in 1100
s
assert load 0
assert sel1 1
assert sel2 1
assert shift 1
assert inbit 1
|don't care for add

exit
