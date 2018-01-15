::       TITLE: CODE CHECKER
::      AUTHOR: BRANDON CHAPMAN
::     VERSION: 2.0
:: DESCRIPTION: This script makes checking your code easy.
::AUTHOR NOTES: Feel free to share with others but please give credit to the original author.
::  DISCLAIMER: This script may not work for everyone depending on their setup. 
::              I am not responsible for any loss of information or damage to device.
::              USE AT YOUR OWN RISK.

@echo off

echo ############################################
echo ##                                        ##
echo ##             CODE CHECKER               ##
echo ##                                        ##
echo ##        MAKE SURE THE DIRECTORY         ##
echo ##    SELECTED IS THE THE LOCATION OF     ##
echo ##            YOUR ASSIGNMENT.            ##
echo ##      ALSO ENTER THE NAME OF YOUR       ##
echo ##    ASSIGNMENT IN THE CODE WHERE IT     ##
echo ##      SAYS 'AssignmentNameHere'.        ##
echo ##                                        ##
echo ##     ALL INPUT AND EXPECTED OUTPUT      ##
echo ##     TEXT FILES MUST BE LOCATED IN      ##
echo ##          THE SAME DIRECTORY.           ##
echo ##                                        ##
echo ##           CONTINUE? PRESS 1            ##
echo ##             EXIT? PRESS 2              ##
echo ############################################

::Opens file location and compiles code
cd "Put the path to the directory containing assignment here" && javac AssignmentNameHere.java

set /p start=
if %start% == 1 goto go
if %start% == 2 goto stop

:go
::Runs code with test input text file then stores output in text text file
java AssignmentNameHere < input1.txt > myoutput1.txt
java AssignmentNameHere < input2.txt > myoutput2.txt
java AssignmentNameHere < input3.txt > myoutput3.txt
java AssignmentNameHere < input4.txt > myoutput4.txt

::compare output with expected output then writes results to compare text file
fc output1.txt myoutput1.txt > compare1.txt
fc output2.txt myoutput2.txt > compare2.txt
fc output3.txt myoutput3.txt > compare3.txt
fc output4.txt myoutput4.txt > compare4.txt
copy compare1.txt + compare2.txt + compare3.txt + compare4.txt compare.txt
del compare1.txt
del compare2.txt
del compare3.txt
del compare4.txt

type compare.txt

echo WOULD YOU LIKE TO DELETE FILES CREATED? (enter number)
echo 1. OUTPUT
echo 2. COMPARE
echo 3. BOTH
echo 4. NONE

set /p delete=
if %delete% == 1 goto one
if %delete% == 2 goto two
if %delete% == 3 goto three
if %delete% == 4 goto stop

:one
del myoutput1.txt
del myoutput2.txt
del myoutput3.txt
del myoutput4.txt
goto stop

:two
del compare.txt
goto stop

:three
del myoutput1.txt
del myoutput2.txt
del myoutput3.txt
del myoutput4.txt
del compare.txt
goto stop

:stop
echo GOODBYE!
pause
exit