#Do not delete following files/folders
PRESERVE_CLEAN_ALL = /.svn\|/.git\|README.md\|makefile\|source\|synth_tool\|config\|\.$$
PRESERVE_CLEAN     = $(PRESERVE_CLEAN_ALL)\|worklib\|ncsim.shm\|vcdplus.vpd

#Path to config files and folders
INCLUDE_DIR = source/parameters
CONFIG_DIR  = config
SYN_CFG_DIR = $(CONFIG_DIR)/synopsys
CAD_CFG_DIR = $(CONFIG_DIR)/cadence
VPI_FOLDER  = source/VPI

#Source list files
TUNEL_DIODE = $(CONFIG_DIR)/tunnel_diode_oscil.cfg
BUCK_CONVERTER_ASYNC = $(CONFIG_DIR)/buck_converter_async.cfg
SWITCHED_CAP = $(CONFIG_DIR)/switched_capacitor_int.cfg
SIGMA_DELTA = $(CONFIG_DIR)/sigma_delta.cfg
BUCK_POWER = $(CONFIG_DIR)/buck_converter_power.cfg


# Supress compilator output
QUITE = 1
TOOL_QUITE = -q
ifeq ($(QUITE), 0)
	TOOL_QUITE = 
endif

# Select environment sourse files and tools run options
EXP = TDO
CAD_CMD = 
SYN_CMD = 
ifeq ($(EXP), TDO)
	CAD_CMD = $(CAD_TOOL) $(CAD_OPTIONS) -f $(TUNEL_DIODE) 
else 
ifeq ($(EXP), BCA)
	CAD_CMD = $(CAD_TOOL) $(CAD_OPTIONS) -f $(BUCK_CONVERTER_ASYNC) 
else 
ifeq ($(EXP), SCI)
	CAD_CMD = $(CAD_TOOL) $(CAD_OPTIONS) -f $(SWITCHED_CAP)
else
ifeq ($(EXP), SDA)
	CAD_CMD = $(CAD_TOOL) $(CAD_OPTIONS) -f $(SIGMA_DELTA) 
else
ifeq ($(EXP), BCP)
	CAD_CMD = $(CAD_TOOL) $(CAD_OPTIONS) -f $(BUCK_POWER) 
else
	CAD_CMD = echo "ENVIRONMENT ERROR"
	SYN_CMD = echo "ENVIRONMENT ERROR"
endif
endif
endif
endif
endif

#Synopsys run options
SYN_TOOL = vcs
SYN_INIT_FILE = $(SYN_CFG_DIR)/vcsAD_xa.init

SYN_OPTIONS_GENERAL = $(TOOL_QUITE) -full64 +vcs+vcdpluson -sverilog +systemverilogext+sv+v+vh -debug_pp \
                      -debug_all -R +incdir+$(INCLUDE_DIR) $(TOOL_QUITE) -f $(MAIN_SOURCE_LIST)
SYN_OPTIONS_VPI     = +vpi -P $(CONFIG_DIR)/vpi.tab $(VPI_FOLDER)/vpi_routines.c 
SYN_OPTIONS_DIG     = 
SYN_OPTIONS_ANALOG  = -ams -ams_discipline logic -ad=$(SYN_INIT_FILE) +verilogamsext+vams

#Cadence run optinos
CAD_TOOL = irun
CAD_WORLIB_DIR = worklib
CAD_OPTIONS    = -nowarn "RECOME" $(TOOL_QUITE) -incdir $(INCLUDE_DIR) -cdslib $(CAD_CFG_DIR)/cds.lib \
		         -hdlvar $(CAD_CFG_DIR)/hdl.var -access +rwc  \
				 -ams_generate -top $(CAD_WORLIB_DIR).top -analogcontrol $(CAD_CFG_DIR)/top.scs \
				 -input $(CAD_CFG_DIR)/run.tcl 



#all: setenv_cad setenv_syn syn_dig cad_dig
all: cad syn

#environment setup
#setenv_syn:
#	source /eda/synopsys/2014-15/scripts/CX_2014.09-SP1-1_RHELx86.sh 
#	source /eda/synopsys/2014-15/scripts/XA_2014.09-SP2_RHELx86.sh
#	source /eda/synopsys/2014-15/scripts/VCSMX_2014.12_RHELx86.sh
#	export XA_GCC=/eda/synopsys/2014-15/RHELx86/XA_2014.09-SP2/GNU/rhel/gcc-4.7.2/bin/gcc

#setenv_cad:
#	source /eda/cadence/2014-15/scripts/INCISIVE_14.10.004_RHELx86.sh

#cadence tools
cad:
	mkdir $(CAD_WORLIB_DIR) -p
	$(CAD_CMD)

cad_gui:
	mkdir $(CAD_WORLIB_DIR) -p
	$(CAD_CMD) -gui

#synopsys tools
syn:
	$(SYN_CMD)

#utility
clean_all:
	find .|grep -v '$(PRESERVE_CLEAN_ALL)'|xargs rm -rf
	rm config/*.raw -rf
clean:
	find .|grep -v '$(PRESERVE_CLEAN)'|xargs rm -rf
	rm config/*.raw -rf

