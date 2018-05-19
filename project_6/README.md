# Board Used
Atlys Spartan 6


# Requirements
Python3 and pySerial are required to be installed to test this project

# Running and Testing
* Open code in Xilinx ISE(14.1)
* Program the board using the prog port
* Connect the board with a UART port to the PC
* Update the COM port in the "ReadAndRunFile.py" python file(COM port can be found from the Device Manager)
* Run the python file to send the data to the fpga. For this, open cmd in the extracted RunAndTest 
  folder and run command "python3 ReadAndRunFile.py"
* Enter the name of any file inside the testing folder. Eg. test1
* The output can be verified from the c++ file "cache.cpp".
* Outputs for some files are:
	* True
	Enter filename
	test2
	L1 hit :  961 L1 Miss :  63
	L2 hit :  0 L2 Miss :  63

	* True
	Enter filename
	test3
	L1 hit :  605 L1 Miss :  419
	L2 hit :  232 L2 Miss :  187