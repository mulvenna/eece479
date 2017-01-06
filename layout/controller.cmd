stepsize 50

vector in reset start sign

l clk

|reset
set in 100
s
|now in state A
assert c1 0
assert c0 0
assert c1b 1
assert c0b 1
assert load 1
assert sel1 1
assert sel2 0
assert shift 1
assert inbit 0
|don't care for add

|A->A
|start
set in 010
s
assert n1 0
assert n0 0
h clk
s
l clk
s
|now in state A
assert c1 0
assert c0 0
assert c1b 1
assert c0b 1
assert load 1
assert sel1 1
assert sel2 0
assert shift 1
assert inbit 0
|don't care for add

|A->B
set in 001
s
assert n1 0
assert n0 1
h clk
s
l clk
s
|now in state B
assert c1 0
assert c0 1
assert c1b 1
assert c0b 0
assert load 0
assert sel1 0
assert sel2 1
assert shift 0
|don't care for inbit
assert add 0

|B->C
h clk
s
l clk
s
|now in state C
assert load 0
assert sel1 0
assert sel2 1
assert shift 1
assert inbit 0
assert add 1

|C->B
assert n1 0
assert n0 1
h clk
s
l clk
s
|now in state B
assert c1 0
assert c0 1
assert c1b 1
assert c0b 0
assert load 0
assert sel1 0
assert sel2 1
assert shift 0
|don't care for inbit
assert add 0

|B->D
set in 000
s
h clk
s
l clk
s
|now in state D
assert load 0
assert sel1 1
assert sel2 1
assert shift 1
assert inbit 1
|don't care for add

|D->B
assert n1 0
assert n0 1
h clk
s
l clk
s
|now in state B
assert c1 0
assert c0 1
assert c1b 1
assert c0b 0
assert load 0
assert sel1 0
assert sel2 1
assert shift 0
|don't care for inbit
assert add 0


|B->A
|by having start be high
set in 010
s
assert n1 0
assert n0 0
h clk
s
l clk
s
|now in state A
assert c1 0
assert c0 0
assert c1b 1
assert c0b 1
assert load 1
assert sel1 1
assert sel2 0
assert shift 1
assert inbit 0
|don't care for add

|A->A
|start is still high
assert n1 0
assert n0 0
h clk
s
l clk
s
|now in state A
assert c1 0
assert c0 0
assert c1b 1
assert c0b 1
assert load 1
assert sel1 1
assert sel2 0
assert shift 1
assert inbit 0
|don't care for add

|A->B
set in 001
s
assert n1 0
assert n0 1
h clk
s
l clk
s
|now in state B
assert c1 0
assert c0 1
assert c1b 1
assert c0b 0
assert load 0
assert sel1 0
assert sel2 1
assert shift 0
|don't care for inbit
assert add 0

|B->C
h clk
s
l clk
s
|now in state C
assert load 0
assert sel1 0
assert sel2 1
assert shift 1
assert inbit 0
assert add 1

|C->A
set in 010
s
assert n1 0
assert n0 0
h clk
s
l clk
s
|now in state A
assert c1 0
assert c0 0
assert c1b 1
assert c0b 1
assert load 1
assert sel1 1
assert sel2 0
assert shift 1
assert inbit 0
|don't care for add

|A->B
set in 000
s
assert n1 0
assert n0 1
h clk
s
l clk
s
|now in state B
assert c1 0
assert c0 1
assert c1b 1
assert c0b 0
assert load 0
assert sel1 0
assert sel2 1
assert shift 0
|don't care for inbit
assert add 0

|B->D
h clk
s
l clk
s
|now in state D
assert load 0
assert sel1 1
assert sel2 1
assert shift 1
assert inbit 1
|don't care for add

|D->A
set in 010
s
assert n1 0
assert n0 0
h clk
s
l clk
s
|now in state A
assert c1 0
assert c0 0
assert c1b 1
assert c0b 1
assert load 1
assert sel1 1
assert sel2 0
assert shift 1
assert inbit 0
|don't care for add

| 'valid' will be tested (with assertions) in top.cmd

exit
