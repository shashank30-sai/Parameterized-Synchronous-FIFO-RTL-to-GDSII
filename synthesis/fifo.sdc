#====================================================
# FIFO SDC File
#====================================================

# Clock Definition (100 MHz -> 10 ns period)
create_clock -name clk -period 10 [get_ports clk]

# Clock Uncertainty
set_clock_uncertainty 0.2 [get_clocks clk]

# Clock Transition
set_clock_transition 0.1 [get_clocks clk]

#====================================================
# Input Delays
#====================================================

set_input_delay 2.0 -clock clk [get_ports data_in]
set_input_delay 2.0 -clock clk [get_ports wr_en]
set_input_delay 2.0 -clock clk [get_ports rd_en]
set_input_delay 2.0 -clock clk [get_ports rst]

#====================================================
# Output Delays
#====================================================

set_output_delay 2.0 -clock clk [get_ports data_out]
set_output_delay 2.0 -clock clk [get_ports full]
set_output_delay 2.0 -clock clk [get_ports empty]

#====================================================
# Driving Cell
#====================================================

set_driving_cell \
-lib_cell INVX1 \
[get_ports {data_in wr_en rd_en rst}]

#====================================================
# Output Load
#====================================================

set_load 0.05 [all_outputs]

#====================================================
# Fanout Limit
#====================================================

set_max_fanout 10 [current_design]

#====================================================
# Transition Limit
#====================================================

set_max_transition 0.5 [current_design]

#====================================================
# Capacitance Limit
#====================================================

set_max_capacitance 0.2 [current_design]
