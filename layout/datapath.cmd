stepsize 50

| Set up vectors
vector divisorin divisorin_{6:0}
vector dividendin dividendin_{7:0}
vector controllerin load sel1 sel2 shift inbit add
vector remainder remainder_{6:0}
vector quotient quotient_{7:0}

| reset
h reset
set controllerin 110100
s
l reset

| An initial clock pulse to get things going
s
h clk
s
l clk
s
|set controllerin 001000

| 'start' would be high here in top, then wait one clock cycle

s
h clk
s
l clk
s
|set controllerin 110100

| Now, start would be low in top, and set the divisor and dividend.
| In this case, we are dividing 96 by 8

set divisorin 0001000
set dividendin 01100000
set controllerin 110100
| Now, wait 17 cycles while setting controllerin
s
h clk
s
l clk
s

|Round 1
set controllerin 001000

h clk
s
l clk
s
set controllerin 001101

h clk
s
l clk
s
|Round 2
set controllerin 001000

h clk
s
l clk
s
set controllerin 001101

h clk
s
l clk
s
|Round 3
set controllerin 001000

h clk
s
l clk
s
set controllerin 001101

h clk
s
l clk
s
|Round 4
set controllerin 001000

h clk
s
l clk
s
set controllerin 001101

h clk
s
l clk
s
|Round 5
set controllerin 001000

h clk
s
l clk
s
set controllerin 011110

| (has been 10 cycles)

h clk
s
l clk
s
|Round 6
set controllerin 001000

h clk
s
l clk
s
set controllerin 011110

h clk
s
l clk
s
|Round 7
set controllerin 001000

h clk
s
l clk
s
set controllerin 001101

h clk
s
l clk
s
|Round 8
set controllerin 001000

h clk
s
l clk
s
set controllerin 001101

h clk
s
l clk
s
|set controllerin 001000
h clk
s

| (has been 17 cycles) 

| division should now be complete
| 96/8 = 12 with remainder of 0
assert remainder 0000000
assert quotient 00001100
exit
