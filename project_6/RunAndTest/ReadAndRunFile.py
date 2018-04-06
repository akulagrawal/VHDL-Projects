import serial

conn = serial.Serial('COM11')
print(conn.isOpen())
conn.baudrate = 9600
conn.bytesize = 8
conn.parity = 'N'
conn.stopbits = 1

arr1 = []
arr2 = []
file = input('Enter filename\n')
with open(file, 'r') as filecontents:
	for linecon in filecontents:
		num = int(linecon)
		# sr = "%x" % int(linecon)
		arr1.append(num)
		msb = num//256
		lsb = num%256
		msb_string = "%.2x" % msb
		lsb_string = "%.2x" % lsb
		msb_encode = bytearray.fromhex(msb_string)
		lsb_encode = bytearray.fromhex(lsb_string)
		# print(msb_string, lsb_string)
		conn.write(msb_encode)
		conn.write(lsb_encode)
		# print("next")

l1_hit_cnt = conn.read(2)
l2_hit_cnt = conn.read(2)
l1_hit_cnt = int.from_bytes(l1_hit_cnt, byteorder='big')
l2_hit_cnt = int.from_bytes(l2_hit_cnt, byteorder='big')
print("L1 hit : ", l1_hit_cnt, "L1 Miss : ", 1024 - l1_hit_cnt)
print("L2 hit : ", l2_hit_cnt, "L2 Miss : ", 1024 - l1_hit_cnt - l2_hit_cnt)

conn.close()