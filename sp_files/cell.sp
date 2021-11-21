
.SUBCKT xnor_cell_rw bl br wl REN RENB RBL RWL_P RWLB_P RWL_N RWLB_N      vdd gnd
* Inverter 1
*nmos gate drain source body <model> width length 
MM1 Q_bar Q gnd gnd NMOS_VTG W=205.00n L=50n
*pmos gate source drain body <model> width length
MM3 Q_bar Q vdd vdd PMOS_VTG W=90n L=50n

* Inverer 2
MM2 Q Q_bar gnd gnd NMOS_VTG W=205.00n L=50n 
MM4 Q Q_bar vdd vdd PMOS_VTG W=90n L=50n

* Access transistors
MM5 bl wl Q gnd NMOS_VTG W=135.00n L=50n
MM6 br wl Q_bar gnd NMOS_VTG W=135.00n L=50n 

* Inverter xnor 1

* PDQ -- xnor inverters output connected to PD network
* PUQ -- xnor inverter output connected to PU network
MM7 Q RWL_P PUQ vdd PMOS_VTG W=90n L=50n
MM9 Q PDQ RWL_N gnd NMOS_VTG W=205.00n L=50n

* Inverter 2
MM8 QB PUQ RWLB_P vdd PMOS_VTG W=90n L=50n
MM10 QB PDQ RWLB_N gnd NMOS_VTG W=205.00n L=50n

* PMOS
* connect body to vdd?
MM11 RENB RBL PUQ vdd PMOS_VTG W=90n L=50n
* NMOS 
* ? connect body to ground
MM12 REN RBL PDQ gnd NMOS_VTG W=205.00n L=50n

.ENDS xnor_cell_rw
