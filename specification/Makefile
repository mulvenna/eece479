VERILOG = verilog

DIVIDER    = divider.v
CONTROLLER = controller.v
DATAPATH   = datapath.v

TEST_DIVIDER    = test_divider.v
TEST_CONTROLLER = test_controller.v

test_divider:
	$(VERILOG) $(TEST_DIVIDER) $(DIVIDER) $(CONTROLLER) $(DATAPATH)

test_controller:
	$(VERILOG) $(TEST_CONTROLLER) $(CONTROLLER)
