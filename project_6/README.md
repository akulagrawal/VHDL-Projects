-> Group-11:
--> Mitansh Jain    160101042
--> Shubhendu Patidar 160101068
--> Sujoy Ghosh 160101073
--> Akul Agrawal 160101085

-> This project has been made for Spartan-6
-> For testing code :
--> Open code in Xilinx ISE(14.1)
--> Program the board using prog port
--> Then for running the python file to send data to fpga move to testing folder inside terminal
--> Connect board with UART port to PC and change the python file with connected COM port
--> Just run the python file. (pyserial should preinstalled for this to work)
--> Enter the name of one the file inside testing folder i.e. test1 (2, 3, 4, 5, 6, 7, 8, 9, 10)
--> It will show output in terminal all miss and hit

-> Outputs for file can be verified from  C++ file cache.cpp.
-->Outpts for given ten files are:

-->True
Enter filename
test2
L1 hit :  961 L1 Miss :  63
L2 hit :  0 L2 Miss :  63

-->True
Enter filename
test3
L1 hit :  605 L1 Miss :  419
L2 hit :  232 L2 Miss :  187

-->True
Enter filename
test3
L1 hit :  605 L1 Miss :  419
L2 hit :  232 L2 Miss :  187

-->True
Enter filename
test5
L1 hit :  55 L1 Miss :  969
L2 hit :  150 L2 Miss :  819

-->True
Enter filename
test6
L1 hit :  651 L1 Miss :  373
L2 hit :  191 L2 Miss :  182

-->True
Enter filename
test7
L1 hit :  1022 L1 Miss :  2
L2 hit :  0 L2 Miss :  2

-->True
Enter filename
test8
L1 hit :  26 L1 Miss :  998
L2 hit :  84 L2 Miss :  914

-->True
Enter filename
test9
L1 hit :  992 L1 Miss :  32
L2 hit :  0 L2 Miss :  32

-->True
Enter filename
test10
L1 hit :  198 L1 Miss :  826
L2 hit :  329 L2 Miss :  497
