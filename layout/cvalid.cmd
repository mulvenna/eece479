stepsize 50
w valid
d

|inputs are reset, clk, start

|initialize (reset)
l clk
l start
h reset
s
l reset
s

|start
h start
s
h clk
s
l clk
l start
s

|wait 17 cycles while asserting that valid is 0
assert valid 0
h clk
s
l clk
s

assert valid 0
h clk
s
l clk
s

assert valid 0
h clk
s
l clk
s

assert valid 0
h clk
s
l clk
s

assert valid 0
h clk
s
l clk
s

|has now been 5 cycles

assert valid 0
h clk
s
l clk
s

assert valid 0
h clk
s
l clk
s

assert valid 0
h clk
s
l clk
s

assert valid 0
h clk
s
l clk
s

assert valid 0
h clk
s
l clk
s

|has now been 10 cycles

assert valid 0
h clk
s
l clk
s

assert valid 0
h clk
s
l clk
s

assert valid 0
h clk
s
l clk
s

assert valid 0
h clk
s
l clk
s

assert valid 0
h clk
s
l clk
s

|has now been 15 cycles

assert valid 0
h clk
s
l clk
s

assert valid 0
h clk
s
l clk
s

|has now been 17 cycles, assert valid is 1
assert valid 1

exit
