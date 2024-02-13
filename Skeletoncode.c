#include <stdio.h>
#include <stdlib.h>

typedef struct { //to store the maze
    int* rows;
    int* cols;
    int xfinsih;
    int yfinish;
} Maze;

typedef struct { // to know the position of the player at all times
    int x;
    int y;
} PointOnMaze;

int commandLineArg(int argc, char *argv[]){
    //check file is entered as a command line argument
    // if not print error message and exit
}
int startPostion(Maze maze, PointOnMaze pointonMaze){
    //find start postion to intialize the player position
    // scan for the "S"
    // store the x and y position of the "S" in the PointOnMaze struct
    // if "S" is not found print error message and exit
}

int endPostion(Maze maze, PointOnMaze pointonMaze){
    //find end postion to check if the player has reached the end
    // scan for the "F"
    // store the x any y postion of the "F" in xfinish and yfinish in the Maze struct
    // if "F" is not found print error message and exit
    // return xfinish and yfinish
}

void wMove(Maze maze, PointOnMaze pointonMaze){
    // if player inputs "w"
    // check if the player can move up
    // if the player can move up
    // move the player up
    // if the player cannot move up
    // print error message
    // if the player cant move becuase of "#"
        // print error message "Error: You have hit a wall"
    //if play cnat move beucase of being out of bounds 
        // print error message "Error: you cannot go out of bounds" 
    // add to y in the PointOnMaze struct
}

void sMove(Maze maze, PointOnMaze pointonMaze){
    // if player inputs "s"
    // check if the player can move down
    // if the player can move down
    // move the player down
    // if the player cannot move down
    // print error message
    // if the player cant move becuase of "#"
        // print error message "Error: You have hit a wall"
    //if play cnat move beucase of being out of bounds 
        // print error message "Error: you cannot go out of bounds" 
    // subtract from  y in the PointOnMaze struct
}

void aMove(Maze maze, PointOnMaze pointonMaze){
    // if player inputs "a"
    // check if the player can move left
    // if the player can move left
    // move the player left
    // if the player cannot move left
    // print error message
    // if the player cant move becuase of "#"
        // print error message "Error: You have hit a wall"
    //if play cnat move beucase of being out of bounds 
        // print error message "Error: you cannot go out of bounds" 
    // subtract from  x in the PointOnMaze struct
}

void dMove(Maze maze, PointOnMaze pointonMaze){
    // if player inputs "d"
    // check if the player can move right
    // if the player can move right
    // move the player right
    // if the player cannot move right
    // print error message
    // if the player cant move becuase of "#"
        // print error message "Error: You have hit a wall"
    //if play cnat move beucase of being out of bounds 
        // print error message "Error: you cannot go out of bounds" 
    // add to x in the PointOnMaze struct
}

void displayMaze(Maze maze, PointOnMaze pointonMaze){
    // abiltiy to display the maze to the console
    // when m is selected display the maze to the console
    // should show current position of the player at X
    // using int x and int y from the PointonMaze struct
    // print to he file in the corrrect postion of the maze
    // print the maze to the console
}


int main(){

    //check file is entered as a command line argument
    // call the commandLineArg function
    
    // Open file in write mode
    // Check if file is opened successfully
    // if not print error message and exit

    //find start postion to intialize the player position
    // call the startPostion function
    
    //find end position cuase we need it to end the game

    // move player around the maze is too big for a singular function
    // so should be written in main function
    //this should run the whole time the player is playing the game
    // while loop that runs until the player reaches "F" or quits the game by pressing q
    // RUN UNTILL x,y == xfinish, yfinish
        // within the while loop call the certain movemnt functions
        // if player inputs "w"
            // call the wMove function
        // else if player inputs "a"
            // call the aMove function
        // else if player inputs "s"
            // call the sMove function
        // else if player inputs "d"    
            // call the dMove function
        // else if player inputs "q"
            // exit the game
            // break the loop
        // else if player inputs "m"
            // display the maze to the console
            // by calling the displayMaze function

    // if the player reaches the end of the maze
    // we know this by checking if the x and y position of the player is equal to the xfinish and yfinish
    // print a message to the console
    // "You have reached the end of the maze"

    //close the file
    return 0;
}