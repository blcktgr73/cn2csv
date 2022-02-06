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
split = ','
quote = '\"'
debug = False

# Strips the newline character
buffer = ''
for line in Lines:
    if "참석자" in line:
        count += 1
        if count > 1:
            if debug:
                print(buffer+quote)
            file2.write(buffer+quote+'\n')
        words = line.split(' ')
        # For default detection. Use '\t'
        buffer = quote + words[0]+words[1]+quote+split+words[2].rstrip()+split+quote
    elif line=='\n':
        pass	
    else:
        buffer += line.rstrip()+ ' '


# close files
file1.close()
file2.close()

sys.exit()