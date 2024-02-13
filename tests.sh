#!/bin/bash

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
    Width=$(sed -n "${row}p" MazeGame.SHAPE | wc --chars)
    if ((Width != WidthFirstRow))
    then
        echo "FAIL"
        echo "Test : Height of maze is consistent"
        echo "FAIL" #if the width is not consistent, the height will not be consistent,
        break 
    fi
    if ((row == HeightFirstColumn))
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
echo "Test : Maze has a starting point on the first row"
if grep -q "S" <<< "$(head -n 1 MazeGame.NAV)"
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Maze has a finishing point on the last row"
if grep -q "F" <<< "$(tail -n 1 MazeGame.NAV)"
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Maze has a walls"
if grep -q "#" <<< "$(cat MazeGame.NAV)"
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : Maze has a path" 
if grep -q " " <<< "$(cat MazeGame.NAV)"
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi  

echo "Test : only contatins S, F, #, and spaces" #test for a poteinal invalid cahracter from the programmer (me)
if grep -q "[^SF# ]" <<< "$(cat MazeGame.NAV)"
then 
    echo "FAIL"
else 
    echo "PASS" #expected to pass
fi

echo "Test : Can you reach the end of the maze?" #this tests wether WASD works plus if there is an end messgae 
./code < MazeGame.NAV.INPUT > tmp
if grep -q "You have reached the end" tmp
then 
    echo "PASS" #expected to pass
else 
    echo "FAIL"
fi

echo "Test : player tries to move through "#"" 
./code < MazeGame.NAV.INPUT > tmp

