pragma solidity >= 0.7.0 < 0.9.0;


/* 
FUNCTIONS:

A function is a group of reusable code which can be called anywhere in your program.
This eliminates the need of writing the same code again and again.
It helps programmers in writing modular codes. 
Functions allow a programmerto divide a big program into a 
number of small and manageable functions.

Like any other advanced programming language, Solidity also supports all the features necessary 
to write modular code using functions.

pseudo thought code experiment:
door - variable (stored information)
remoteControl: open and close the door - (THIS WOULD BE A FUNCTION)
I could have two functions, one to open and one to close the door.
remoteControlOpen - open the door - function
remoteControlClose - close the door - function 



*/

// HOW TO WRITE FUNCTIONS IN SOLIDITY:
// ---> Functions take inputs of information and produce outputs 

contract learnFunctions {
    // function function-name(parameter-list) scope returns() {
    // statements }
    
    //create a boolean to check if it's open or closed and name it
    // that means its probabily set to false because we are opening it
    function remoteControlOpen(bool closedDoor ) public returns(bool) {
        
    }
    

/*
1. FUNCTION NAME - so i write function then give it a name, 
2. PARAMETERS (input) - then I introduce parentheses and what goes in here is the arguments/inputs/parameters
obs: after creating the parameter, I can now input and then get output information 
3. VISIBILITY/SCOPE - after the parameter, I can introduce the scope and perimeter the scope. 
ex: public, external, private...these are keywords 
then curly brackets and inside all the code of the function, 
basically all that I want the function to do - its the script/statement
OUTPUT: if i want my function to return something i write returns()
so: 

    function name(inputs) scope returns {
        // statements 
    }

*/

// Exercise: create a function that can add up two variables:


    // professor: the keyword view is just going to allow me to view the results of the return in my IDE
    // even if there is no input i must thave the () because it allows the function to be executed,
    // wether or not there is any input
    function addValues() public view returns(uint) {
        // all the variables that I write in the function remain localized in the function
        uint a = 2;// create the variables  
        uint b = 3;
        uint result = a + b;
        return result;
        
    }
//  I can now see the result in the compiler tab. 
// But I must first click on DEPLOY
// then i can see the buttons that allow me to call the function.
// the public allows me to see that button and the view allows me to view the result
    
    // obs: all the variables that I write in the function
    // remain localized in the function
    // so if I write another function with different values for a and b 
    // it ill not influence the other function
    
    function addNewValues() public view returns(uint) {
        // all the variables that I write in the function remain localized in the function
        uint a = 1;// create the variables  
        uint b = 5; // local variables
        uint result = a + b;
        return result;
        
    }
    
// LOCAL VARIABLES SUPERCEDE STATE VARIABLES
// If i were to write variables outside of the function in the contract:
    uint a = 45; 
// It would be a state variable and I would get an error because I have 
// created A inside functions, and those are going to supercede the state A.
// if i wanted A to always be 45 then I could create it as a state variable
    
}
// SCOPE IS EXTREMELY IMPORTANT IN SC BECAUSE I GOTTA BE CAREFUL TO WHAT
// I ALLOW OTHERS TO SEE OR NOT SEE 


