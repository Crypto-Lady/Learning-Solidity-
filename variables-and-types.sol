pragma solidity >= 0.7.0 < 0.9.0;

/*
While writing program in any language, you need to use various variables to 
store various information. be efficient. less is more
Variables are nothing but reserved memory locations to store values.

Variables are used to store information to be referenced and manipulated in 
a computer program. 

Types: Boolean - Keyword: bool - Value: true/false
Integer - Keyword: uint - Value - Signed and unsigned integers of varying sizes
String - Keyword - string - data values that are made up of ordered sequences of characters

LEARNING VARIABLES AND TYPES

3 main types of variables: Booleans, Integers & Strings.
bool, uint, string

lieDetector = boolean to check whether what they say is true or falso
walletAmount = integer that would hold the amount 
generally i would use bytes instead of strings to reduce cost 
errorMessageText = string that would say 'Error!'

*/
// so lets say I want to create a variable for a chocolate bar that is worth 300

contract learnVariables {
    // all code goes here
    
    
    uint chocolateBar = 10;  // always complete sentences with a ; 
    uint storeOwner = 300;   // i cannot use dash in variables
    bool lieDetector = true; // lets assume we trust everyone before assuming its false
    string errorMessage = 'Error, there has been a mistake!'; //single or double quotes. it doesn't matter
    

// Exercise 1: create a new variable called wallet as an integer 
// 2: create a boolean called spend (keeps track of my wallet)
// 3: create a string give it the name notifySpend 
// 4: initialize/set the wallet to 500
// 5: set the value of spend to false
// 6: add the string literal (the string value, same thing) 'you have spent money' to notify spend


    uint wallet = 500;
    bool spend = false;
    string notifySpend = 'You have spent money.';
    
    
}




