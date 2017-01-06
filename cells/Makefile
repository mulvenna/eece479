# EECE 479 Divider Project
# Makefile for testing extracted cells
# Nicholas Mulvenna
# Shelby Mosbrucker

EXT2SIM = ext2sim
IRSIM   = irsim

# technology file for irsim
TECHNOLOGY = scmos50.prm

# use a "pattern rule" to generate .sim file from .ext file
%.sim: %.ext
	$(EXT2SIM) $<

# define constants to match the ext/cmd base names
# and be used as make targets
AND     = and
OR      = or
MUX1    = mux1
SHIFT1  = shift1
REG1    = reg1
ADDSUB1 = addsub1

# targets for running simulations
$(AND): $(AND).sim
	$(IRSIM) $(TECHNOLOGY) $(AND).sim -$(AND).cmd
$(OR): $(OR).sim
	$(IRSIM) $(TECHNOLOGY) $(OR).sim -$(OR).cmd
$(MUX1): $(MUX1).sim
	$(IRSIM) $(TECHNOLOGY) $(MUX1).sim -$(MUX1).cmd
$(SHIFT1): $(SHIFT1).sim
	$(IRSIM) $(TECHNOLOGY) $(SHIFT1).sim -$(SHIFT1).cmd
$(REG1): $(REG1).sim
	$(IRSIM) $(TECHNOLOGY) $(REG1).sim -$(REG1).cmd
$(ADDSUB1): $(ADDSUB1).sim
	$(IRSIM) $(TECHNOLOGY) $(ADDSUB1).sim -$(ADDSUB1).cmd
