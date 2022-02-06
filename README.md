# cn2csv
This is batch file for convert CLOVA Note(https://clovanote.naver.com/home) text to Excel CSV.

## How to setup
1. Install python 3.x
2. Copy cn2csv.bat file to folder which has execution files such as "C:\Windows". You can also add your project folder to path environment variable.

## Usage
1. Download CLOVA Note text file
2. Open cmd.exe and run below command
```
cn2csv input_file out_file
```
3. Open google sheets and load out_file.

## Things to comment
* Default CSV splitter(delimiter) is comma(,). So, it is used.
* Google sheets cannot handle space for first column item if it is under automated mode. So space between speaker and number is deleted.
* 'debug' is provided for printing out result on the console.
