#!/bin/bash
# the code.c creates a a block of "#" which has variable dimensions, which is then saved to a file called MazeGame.Shape
# MazeGame.simple.map is used to test wether the maze has a starting and finishing point, and if it contains walls and paths
# MazeGame.complex.map is used to test complex mazes.
# simple.map.INPUT is used to test wether the player can reach the end of the maze for MazeGame.simple.map
# complex.map.INPUT is used to test wether the player can reach the end of the maze for MazeGame.complex.map
# wrong.inputs.controls is used to test wether the player can only input the correct commands, tests every invalid inputs

gcc code.c -o code

echo -e "~~ File Testing ~~"

echo "Test : loading the file as a command line arguement"
if test -f "$1"; 
then
    echo "PASS" #expected to pass
else
    echo "FAIL" 
fi

echo "Test : does the file open?" #this tests wether the file opens
./code > tmp
if grep -q "Error: File could not be opened" tmp
then 
    echo "FAIL" 
else 
    echo "PASS" #expected to pass, means havent seen error message so a good thing :)
fi


echo -e "~~ Functionality of The Maze ~~"
echo "Test : Maze has a starting point"
if grep -q "S" Maps/MazeGame.simple.map
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Maze has a finishing point"
if grep -q "F" Maps/MazeGame.simple.map
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Maze has a walls"
if grep -q "#" Maps/MazeGame.simple.map
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Maze has a path" 
if grep -q " " Maps/MazeGame.simple.map
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi  

#test for a poteinal invalid cahracter from the programmer (me) in the maze
echo "Test : Maze Only contatins S, F, #, X, and spaces" 
if grep -q "[^SF#X ]" Maps/MazeGame.simple.map
then 
    echo "FAIL"
else 
    echo "PASS" #expected to pass
fi

echo -e "~~ Functionality of The Player ~~" 
#for the follwiing that use./code is a plcae holder as i dont have the code yet, so will fail currenlty,
# but should pass once the code is complete

echo "Test : does the "w" input work?" #this tests wether w works
echo "w" | ./code > tmp #w is the command to move up, wont be case sensitive
num_lines_w=$(wc -l < tmp) #wehn inputing w, there should be 3 lines of output
if [ "$num_lines_w" -eq 3 ];
then
    echo "PASS" #expected to pass
else 
    echo "FAIL" #if fail, then code is not working as expected or it hit a premade error, wall or out of bounds
fi

echo "Test : does the "a" input work?" #this tests wether a works
echo "a" | ./code > tmp #a is the command to move left, wont be case sensitive
num_lines_a=$(wc -l < tmp) #wehn inputing a, there should be 3 lines of output
if [ "$num_lines_a" -eq 3 ];
then
    echo "PASS" #expected to pass
else 
    echo "FAIL" #if fail, then code is not working as expected or it hit a premade error, wall or out of bounds
fi

echo "Test : does the "s" input work?" #this tests wether s works
echo "s" | ./code > tmp #s is the command to move down, wont be case sensitive
num_lines_s=$(wc -l < tmp) #when inputing s, there should be 3 lines of output
if [ "$num_lines_s" -eq 3 ];
then
    echo "PASS" #expected to pass
else 
    echo "FAIL" #if fail, then code is not working as expected or it hit a premade error, wall or out of bounds
fi

echo "Test : does the "d" input work?" #this tests wether d works  
echo "d" | ./code > tmp #d is the command to move right, wont be case sensitive
num_lines_d=$(wc -l < tmp) #when inputing d, there should be 3 lines of output
if [ "$num_lines_d" -eq 3 ];
then
    echo "PASS" #expected to pass
else 
    echo "FAIL" #if fail, then code is not working as expected or it hit a premade error, wall or out of bounds
fi

echo "Test : does the "q" input work?" #this tests wether q works
echo "q" | ./code > tmp #q is the command to quit, wont be case sensitive
if grep -q "You have quit the game" tmp
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : does all wrong inputs print an error message?" #this tests wether a wrong input prints an error message
./code < Inputs/wrong.inputs.controls > tmp 

for i in {1..42} #42 is the number of lines of error there should be calcuated from how many wrong inputs there can be
do 
#line below adapated from example provided on:
#https://askubuntu.com/questions/1206110/sed-extract-lines-from-text#:~:text=Explanation,use%20%2De%20before%20every%20expression.
    wrongInput=$(sed -n "${i}p" Inputs/wrong.inputs.controls) #this is the wrong input
    if (sed -n "${i}p" tmp | grep -q "Error: Invalid input") #this tests wether the error message is printed on each line
    then # this is exahustive and tests wether every line is an error message, from each input 
        continue 
    else 
        echo "Fail : Error message not made from this $wrongInput" #if the error message is not printed on a line, then the test has failed
    fi 
done #only passes if there is no fail message, 


echo "Test : Is it possible to reach the end of a simple maze?" #this tests wether WASD works plus if there is an end message #wont be case sensitive
./code < Inputs/simple.map.INPUT > tmp #MazeGame.NAV.INPUT contains correct commands to reach the end of the maze
if grep -q "You have reached the end of the maze" tmp
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Is it possible to reach enf of a complex maze?" #can i deal with bigger more complex maze
./code < Inputs/complex.map.INPUT > tmp 
echo "Test : Player tries to move through "#"" 
echo "d" | ./code > tmp 
if grep -q "Error: You have hit a wall" tmp
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Player tries to move out of bounds"
echo "w" | ./code > tmp 
if grep -q "Error: you cannot go out of bounds" tmp
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Player choses to display the maze"
echo "m" | ./code > tmp #m is the command to display the maze, wont be case sensitive
if cmp -s tmp MazeGame.simpleNAV #compares the output of the code to the expected output
then 
    echo "PASS" #expected to pass, but only before the i have introduced the player position
else            #then it should fail, this test becomes oberselete once the player position is introduced
    echo "FAIL"
fi

#if the above test fails, and the following test passes, then overall the test has passed
#thats because the above test is only expected to pass before the player position is introduced
#and the following test is only expected to pass after the player position is introduced

echo "Test : Player choses to display the maze adn can see there position"
echo "m" | ./code > tmp #m is the command to display the maze, wont be case sensitive 
if grep -q "X" tmp #X is the current position of the player
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi
