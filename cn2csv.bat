@echo off & python -x "%~f0" %* & goto :eof 

import sys
if len(sys.argv) != 3:
	print('cn2csv input_file output_file')
	sys.exit()
	
# open reading file
file1 = open(sys.argv[1], 'r', encoding='utf-8')
Lines = file1.readlines()

# writing to file
file2 = open(sys.argv[2], 'w', encoding='utf-8')
 
count = 0
# Strips the newline character
buffer = ''
for line in Lines:
    if "참석자" in line :
        count += 1
        if count > 1:
            #print(buffer)
            file2.write(buffer+'\n')
        words = line.split(' ')
        #print(words[0]+" "+words[1]+';'+words[2].rstrip()+';')
        buffer = words[0]+" "+words[1]+';'+words[2].rstrip()+';'
    elif line=='\n':
        pass	
    else:
        #print("Line{}: {}".format(count, line.strip()))
        buffer += line.rstrip()+ ' '


# close files
file1.close()
file2.close()

sys.exit()