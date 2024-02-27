#include <stdio.h>
#include <stdlib.h>

typedef struct { //to store the maze details
    char **maze; // 2D array to store the maze
    char rows [100];
    char cols [100];
    int xfinsih;
    int yfinish;
} Maze;

typedef struct { // to know the position of the player at all times
    int x; // x cannot be less than 0 or greater than the number of columns, 
    int y; // y cannot be less than 0 or greater than the number of rows
        // y being being less thsn 0 suggests the player is out of bounds at teh top
        // y being greater than the number of rows suggests the player is out of bounds at the bottom
        // x being less than 0 suggests the player is out of bounds at the left
        // x being greater than the number of columns suggests the player is out of bounds at the right
} Player;



int readMaze(Maze* maze, FILE *file){
    // read the maze from the file
    // store the maze in the Maze struct
    // read the number of rows and columns from the file
    // store the number of rows and columns in the Maze struct
        // maze -> rows == length of the rows
        // maze -> cols == length of the cols
    // read the maze from the file
    // store the maze in the Maze struct
    // if the maze is not read print error message and exit
    // "Error: Maze could not be read"
    // if maze is not valid print error message and exit
    // "Error: Maze is not valid"
}

int startPostion(Maze maze, Player* player){
    //find start postion to intialize the player position
    // scan for the "S"
    // store the x and y position of the "S" in the Player struct
    // double nested loop, to scan the maze for the "S"
    // if "S" is not found print error message and exit
}

int endPostion(Maze* maze, Player player ){
    //find end postion to check if the player has reached the end
    // scan for the "F"
    //doubel netsed loop. 
    // store the x any y postion of the "F" in xfinish and yfinish in the Maze struct
    // if "F" is not found print error message and exit
    // return xfinish and yfinish
}

// as my end or start posotion function do the same thing could create a function that does both
int findPositions(Maze* maze, Player* player){} 

void wMove(Maze maze, Player* player){
    // if player inputs "w"
    // check if the player can move up
    // if the player can move up
    // move the player up
    // minus y in the Player struct
        // player -> y--, to update the pointer 
    // if the player cannot move up
    // print error message
    // if the player cant move becuase of "#"
        // print error message "Error: You have hit a wall"
    //if play cnat move beucase of being out of bounds 
        // print error message "Error: you cannot go out of bounds" 
    // 
}

void sMove(Maze maze, Player* player){
    // if player inputs "s"
    // check if the player can move down
    // if the player can move down
    // move the player down
    // add from  y in the Player struct
        // player -> y++, to update the pointer
    // if the player cannot move down
    // print error message
    // if the player cant move becuase of "#"
        // print error message "Error: You have hit a wall"
    //if play cnat move beucase of being out of bounds 
        // print error message "Error: you cannot go out of bounds" 
    
}

void aMove(Maze maze, Player* player){
    // if player inputs "a"
    // check if the player can move left
    // if the player can move left
    // move the player left
    // subtract from  x in the PLayer struct
        // player -> x--, to update the poitner
    // if the player cannot move left
    // print error message
    // if the player cant move becuase of "#"
        // print error message "Error: You have hit a wall"
    //if play cnat move beucase of being out of bounds 
        // print error message "Error: you cannot go out of bounds" 

}

void dMove(Maze maze, Player* player){
    // if player inputs "d"
    // check if the player can move right
    // if the player can move right
    // move the player right
    // add to x in the PLayer struct
        // player -> x++, to update the poitner
    // if the player cannot move right
    // print error message
    // if the player cant move becuase of "#"
        // print error message "Error: You have hit a wall"
    //if play cnat move beucase of being out of bounds 
        // print error message "Error: you cannot go out of bounds" 
    // 
}

int threeLineDisplay(Maze maze, Player player){ //creates a good level of diffculity for the player, so you cannt see the whole maze, just like in real life 
    // display 3 lines on maze to the console
    // the lien of the maze aboe the player
        //  y - 1
    // the line of the maze the player is on
        // y
    // add X to the pos of palyer with int x and int y from the Player struct
        // Maze.maze[player.y][player.x] = "X";
    // the line of the maze below the player
        // y + 1
    // return or print the 3 lines to the console
        // replace Maze.maze[player.y][player.x] = "X" with " "
}

void displayMaze(Maze maze, Player player){
    // abiltiy to display the maze to the console
    // when m is selected display the maze to the console
    // should show current position of the player at X
        //Maze.maze[player.y][player.x] = "X";
    // using int x and int y from the Player struct
    // print to he maze in the corrrect postion of the maze
    // print the maze to the console
    // replace Maze.maze[player.y][player.x] = "X" with " "
}


int main(int argc, char *argv[]){

    // check file is entered as a command line argument
    // "Usage: ./Skeletoncode.c <map>"

    // read the maze from the file
    // checling file is valid (can be opened, not empty, in the correct range etc)
    // if not print error message (Error: File could not be opened) and exit
    // store the maze in the Maze struct
    // call the readMaze function

    // find start postion to intialize the player position
    // call the startPostion function
    
    //find end position cuase we need it to end the game
    // call the endPostion function

    //print instructions to the console
    // "Welcome to the maze game"
    // "Use w, a, s, d to move the player"
    // "Use m to display the maze"
    // "Use q to quit the game"

    // move player around the maze is too big for a singular function
    // so should be written in main function
    //this should run the whole time the player is playing the game
    // while loop that runs until the player reaches "F" or quits the game by pressing q
    // RUN UNTILL x,y == xfinish, yfinish
        // within the while loop call the certain movemnt functions
        // switch case for the player input
            // if player inputs "w"
                // call the wMove function
                // if player can move
                    // call the threeLineDisplay function
            //if player inputs "a"
                // call the aMove function
                // if player can move
                    // call the threeLineDisplay function
            //  if player inputs "s"
                // call the sMove function
                // if player can move
                    // call the threeLineDisplay function
            //  if player inputs "d"    
                // if player can move
                    // call the threeLineDisplay function
            //  if player inputs "q"
                // exit the game
                //output message "You have quit the game"
                // break the loop
            //  if player inputs "m"
                // display the maze to the console
                // by calling the displayMaze function
            // base case
                // print error message "Error: Invalid input"

    // if the player reaches the end of the maze
    // we know this by checking if the x and y position of the player is equal to the xfinish and yfinish
    // print a message to the console
    // "You have reached the end of the maze"

    //close the file
    return 0;
}