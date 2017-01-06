stepsize 1000

| Set up vectors

vector divisorin divisorin_{6:0}
vector dividendin dividendin_{7:0}
vector remainder remainder_{6:0}
vector quotient quotient_{7:0}

h reset
s
l reset


| An initial clock pulse to get things going
| as in the specification (verilog) test bench

s
h clk
s
l clk
s

| Start the process by asserting Start and waiting one clock cycle

h start
s
h clk
s
l clk
s

| Now, lower start, and set the divisor and dividend.  For your
| own tests, you should change these numbers here.  In this example,
| we are dividing 16 by 3.

l start
set divisorin 0100000
set dividendin 10010001

| Now, wait 17 cycles

s
h clk
s
l clk
s
s

h clk
s
l clk
s
s
h clk
s
l clk
s
s
h clk
s
l clk
s

s
h clk
s
l clk
s
s
h clk
s
l clk
s
s
h clk
s
l clk
s
s
h clk
s
l clk
s

s
h clk
s
l clk
s
s
h clk
s
l clk
s
s
h clk
s
l clk
s
s
h clk
s
l clk
s

s
h clk
s
l clk
s
s
h clk
s
l clk
s
s
h clk
s
l clk
s
s
h clk
s
l clk
s
s
h clk
s
l clk
s

| Print out results

w remainder quotient
s
exit
