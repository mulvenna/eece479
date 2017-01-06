# EECE 479 Divider Project
# Makefile for testing layout
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
TOP        = top
DATAPATH   = datapath
CONTROLLER = controller
CONTROLLER_NEXT   = cnext
CONTROLLER_OUTPUT = coutput
CONTROLLER_VALID  = cvalid
DIVIDER = divider
AND5 = and5

# targets for running simulations
$(TOP): $(TOP).sim
	$(IRSIM) $(TECHNOLOGY) $(TOP).sim -$(TOP).cmd
$(DIVIDER): $(TOP).sim
	$(IRSIM) $(TECHNOLOGY) $(TOP).sim -$(DIVIDER).cmd
$(DATAPATH): $(DATAPATH).sim
	$(IRSIM) $(TECHNOLOGY) $(DATAPATH).sim -$(DATAPATH).cmd
$(CONTROLLER): $(CONTROLLER).sim
	$(IRSIM) $(TECHNOLOGY) $(CONTROLLER).sim -$(CONTROLLER).cmd
$(CONTROLLER_NEXT): $(CONTROLLER_NEXT).sim
	$(IRSIM) $(TECHNOLOGY) $(CONTROLLER_NEXT).sim -$(CONTROLLER_NEXT).cmd
$(CONTROLLER_OUTPUT): $(CONTROLLER_OUTPUT).sim
	$(IRSIM) $(TECHNOLOGY) $(CONTROLLER_OUTPUT).sim -$(CONTROLLER_OUTPUT).cmd
$(CONTROLLER_VALID): $(CONTROLLER_VALID).sim
	$(IRSIM) $(TECHNOLOGY) $(CONTROLLER_VALID).sim -$(CONTROLLER_VALID).cmd
$(AND5): $(AND5).sim
	$(IRSIM) $(TECHNOLOGY) $(AND5).sim -$(AND5).cmd
