import serial
import time

conn = serial.Serial('COM10')
print(conn.isOpen())
conn.baudrate = 9600
conn.bytesize = 8
conn.parity = 'N'
conn.stopbits = 1

file = input('Enter filename\n')
with open(file, 'r') as filecontents:
	for i in range(0, 256):
		flag = True
		n = 0
		while n<16 :
			n = n + 1
			if flag :
				c = filecontents.read(1)
				if c == '\n' or c == '\r' or c is None:
					flag = False
					conn.write(b'\x00')
				else:
					byte_c = bytes(c, encoding='utf-8')
					conn.write(byte_c)
			else:
				conn.write(b'\x00')
		if flag:
			filecontents.read(1)

for i in range(0, 256):
	word = conn.read(16)
	print(word)



while(1):
	file = input('Enter filename or type exit\n')
	if(file == "exit"):
		break
	with open(file, 'r', encoding="utf-8") as filecontents:
		while(1):
			c = filecontents.read(1)
			if c == '':
				break
			else:
				byte_c = bytes(c, encoding='utf-8')
				print(byte_c)
				conn.write(byte_c)
				# time.sleep(1)

		for i in range(0, 15):
			conn.write(b'\x00')