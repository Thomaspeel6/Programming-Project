#!/bin/bash
# the code.c creates a a block of "#" which has variable dimensions, which is then saved to a file called MazeGame.Shape
# MazeGame.Shape is used to test wether the dimensions of the maze are within the limits
# MazeGame.NAV is used to test wether the maze has a starting and finishing point, and if it contains walls and paths
# MazeGame.NAV.INPUT is used to test wether the player can reach the end of the maze for MazeGame.NAV
# MazeGame.NAV.INPUT.BAD is used to test wether the player can move through walls for MazeGame.NAV
# MazeGame.NAV.INPUT.BAD2 is used to test wether the player can move out of bounds for MazeGame.NAV by travelling up from the start which is out of bounds.


gcc code.c -o code
./code

echo "Test 1: loading the file as a command line arguement"
if test -f "$1"; 
then
    echo "PASS" #expected to pass
else
    echo "FAIL" 
fi

echo -e "~~ Testing Shape of Maze ~~"
MaxDimensions=100
MinDimensions=5
HeightFirstColumn=$(wc -l < MazeGame.SHAPE)
WidthFirstRow=$(head -n 1 < MazeGame.SHAPE | wc --chars)
echo "Test : Width of maze is consistent"
for ((row=1; row <= HeightFirstColumn; row++))
do 
#line below adapated from example provided on:
#https://askubuntu.com/questions/1206110/sed-extract-lines-from-text#:~:text=Explanation,use%20%2De%20before%20every%20expression.
    Width=$(sed -n "${row}p" MazeGame.SHAPE | wc --chars) 
    if ((Width != WidthFirstRow))
    then
        echo "FAIL"
        echo "Test : Height of maze is consistent"
        echo "FAIL" #if the width is not consistent, the height will not be consistent,
        break 
    fi
    if ((row == HeightFirstColumn)) #the loop has reached the last row so passed :)
    then 
        echo "PASS" #expected to pass
        echo "Test : Height of maze is consistent"
        echo "PASS" #if the width is consistent, the height will be consistent, expected to pass
    fi
done

echo "Test : Width of maze is within the dimensions"
if ((WidthFirstRow <= MaxDimensions && WidthFirstRow >= MinDimensions))
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Height of maze is within the dimensions"
if ((HeightFirstColumn <= MaxDimensions && HeightFirstColumn >= MinDimensions))
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo -e "~~ Functionality of The Maze ~~"
echo "Test : Maze has a starting point"
if grep -q "S" MazeGame.simpleNAV
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Maze has a finishing point"
if grep -q "F" MazeGame.simpleNAV
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Maze has a walls"
if grep -q "#" MazeGame.simpleNAV
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Maze has a path" 
if grep -q " " MazeGame.simpleNAV
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi  

echo "Test : Maze Only contatins S, F, #, X, and spaces" #test for a poteinal invalid cahracter from the programmer (me) in the maze
if grep -q "[^SF#X ]" MazeGame.simpleNAV
then 
    echo "FAIL"
else 
    echo "PASS" #expected to pass
fi

echo -e "~~ Functionality of The Player ~~" 
#for the follwiing that use./code is a plcae holder as i dont have the code yet, so will fail currenlty,
# but should pass once the code is complete


echo "Test : Is it possible to reach the end of the maze?" #this tests wether WASD works plus if there is an end message #wont be case sensitive
./code < MazeGame.NAV.INPUT > tmp #MazeGame.NAV.INPUT contains correct commands to reach the end of the maze
if grep -q "You have reached the end of the maze" tmp
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Player tries to move through "#"" 
./code < MazeGame.NAV.INPUT.BAD > tmp #MazeGame.NAV.INPUT.BAD contains "D" which aims to move direclty through a wall
if grep -q "Error: You have hit a wall" tmp
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Player tries to move out of bounds"
./code < MazeGame.NAV.INPUT.BAD2 > tmp #MazeGame.NAV.INPUT.BAD2 contains "W" which aims to move direclty out of bounds
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

echo "Test : Player choses to display the maze and can see there position"
echo "m" | ./code > tmp #m is the command to display the maze, wont be case sensitive 
if grep -q "X" tmp #X is the current position of the player
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

