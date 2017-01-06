stepsize 70

| Set up vectors

vector divisorin divisorin_{6:0}
vector dividendin dividendin_{7:0}
vector remainder remainder_{6:0}
vector quotient quotient_{7:0}

| Reset to initialize

h reset
s
l reset
s

| An initial clock pulse to get things going
| as in the specification (verilog) test bench

h clk
s
l clk
s

| Start the process by setting start to high and waiting one clock cycle

h start
s
h clk
s
l clk
s

| Now, lower start, and set the divisor and dividend.
| In this example, we are dividing 153 by 23.

l start
| divisorin is 23
set divisorin 0010111
| dividendin is 153
set dividendin 10011001
s

| Now, wait 17 cycles

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
assert valid 0

| (has been 5 cycles)

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
assert valid 0

| (has been 10 cycles)

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
assert valid 0

| (has been 15 cycles)

h clk
s
l clk
s
assert valid 0
h clk
s
l clk
s

| (has been 17 cycles)

| Print out results
| 153/23 = 6 with remainder of 15
assert valid 1
assert remainder 0001111
assert quotient 00000110

| Now we will try another division with different operands

| Start the process again by setting start to high and waiting one clock cycle

h start
s
h clk
s
l clk
s

| Now, lower start, and set the divisor and dividend.
| In this case, dividing 252 by 112

l start
| divisorin is 112
set divisorin 1110000
| dividendin is 252
set dividendin 11111100
s

| Now, wait 17 cycles

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
s
h clk
s
l clk
s
assert valid 0

| (has been 5 cycles)

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
assert valid 0

| (has been 10 cycles)

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
assert valid 0

| (has been 15 cycles)

h clk
s
l clk
s
assert valid 0
h clk
s
l clk
s

| (has been 17 cycles)

| 252/112 = 2 with remainder of 28
assert valid 1
assert remainder 0011100
assert quotient 00000010

exit
