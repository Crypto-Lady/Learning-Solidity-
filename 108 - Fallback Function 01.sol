pragma solidity >=0.7.0 <0.9.0;


/*      108 - FALLBACK FUNCTIONS 

        Define fallback functions:
        1. Cannot have a name. (anonymous function)
        2. Does not have any inputs.
        3. Does not have any outputs.
        4. Must be declared as external (visibility).
        
        Why use it? 
        When you call functions that don't exist - or send ether to a contract by send, transfer or call.
        
        Statement: when we use the send and transfer method, the contract receives 2300 gas but 
        when we use the call method it receives more (all of the gas).
        
        IT'S IMPORTANT TO PAY ATTENTION WHEN WE ARE SENDING ETHER, TRANSFERING ETHER OR CALLING ETHER IN CONTRACTS.
        Cause we are not learning Solidity, we are learning how to make effective and efficient smart contracts.
        
*/
contract FallBack {
    
    
    event Log(uint gas);
    
    
    fallback () external payable {
        // not recommended to write much code in here - because the function will fail if it uses too much gas.
    
        // when we invoke the send method, we get 2300 gas, which is enought 
        // to emit a log (emit is the second step for our event)
        
        // when we invoke the call method: we get all the gas. 
        
        // so if I want to emit an event I write emit and the name of the event and now we can actually return.
        // let's say we want to return how much gas is actually left in this fallback?
        
        // we can use a special solidity function called gasleft() - it returns how much gas is left.
        emit Log(gasleft()); 
        
    }
 
    // so here I have a contract and in it we created an event that's going to output the uint gas measurement
    // which is gonna be the gasleft in the emit part. We're gonna get a log of information of our gas left.
   
    // And then what we're gonna do is we're gonna be sending ether over through the methods: 
    // send, the transfer method or call. These are different ways that we can actually send and transfer ether 
    // over to this contract.
    
    // And then when we do that, the fallback function is going to be executed.
    // And when this fallback is executed, we're going to see just how much gas is left.
 
 
    // Lets create a function to verify the balance:
    // And it's going to return the balance of the address itself. ---> we do that with the '(this)' KEYWORD. 
    // So which address? this. this address of the contract.
    // And next to it, the method 'balance'. 
    
    function getBalance() public view returns (uint) {
        // return the stored balance of the contract
        return address(this).balance;
    }
    
}

    // Now we're gonna write a second contract that it's going to send ether into the FallBack contract.
    // And then we're gonna get the balance with the getBalance function, to see that it's working.
    // And we're also gonna see whenever we send it over in our log, we're going to emit these logs 
    // and see how much gas is going through this anonymous function. 
    


    // new contract will send ether to Fallback contract which will trigger the fallback function (that's the whole point here)
    
    // And we are going to create two functions:
    // - one function where we're going to transfer ether using the TRANSFER method
    // - and a function to transfer ether with the CALL METHOD 


contract SendToFallback {       
    
    // THESE TWO FUNCTIONS ARE TWO WAYS OF THRANFERING ETHER TO THE ABOVE CONTRACT 
    // and thre address I input in the _to is the above contract address 
    // so I just copy te address under deployed contracts and paste inside the transferTo box 
    // chose the value first  
    
    /* function where we can input the address (_to) 
       and it's going to transfer the msg.value amount to that address 
       so the amount is going to be the msg.value 
       the value that we're going to be putting in there.
    
    */

    /* SENDING ETHER WITH THE TRANSFER METHOD ------------------*/
    
    function transferToFallBack(address payable _to) public payable {
        
        // send ether with the transfer method (automatically will transfer 2300 gas amount)
        // we are going to be transfering to the message value.
        
        _to.transfer(msg.value); 
    }
    
    /* SENDING ETHER WITH THE CALL METHOD ----------------------*/
    
    function callFallBack(address payable _to) public payable {
        
        // 1. create a bool that checks the 'sent' value
        // 2. going to require to see and then have a fail method if it doesn't go through 
        // 3. set it equal to our address (obs: call.value is deprecated)
        // must have {value: } braces like an object 
        // 4. bring in the empty strings cause we are setting up the msg.value 
        // So the syntax to set up the call is: 
        // the value of the call is the message value 
        
        (bool sent,) = _to.call{value:msg.value}('');
    
        // to check to see if this was successful I bring in the require:
        // after the ',' I can have a failure message
        
        require(sent, 'Failed to send!');
        
        
    }
     
}


/*
    After deployment I can see how much gas I have left with the transfer function:

	{
		"from": "0x9a2E12340354d2532b4247da3704D2A5d73Bd189",
		"topic": "0x909c57d5c6ac08245cf2a6de3900e2b868513fa59099b92b27d8db823d92df9c",
		"event": "Log",
		"args": {
			"0": "2254",
			"gas": "2254"     <------ here is the leftover gas I have in my callback 
		}
	}

    And with the call function I have much more gas left. And I could use that 
    gas to write more code. 
    IMPORTANT!!!! But I gotta b carefull because If I go over, that callback 
    function will fail!
    Fallback Function ---------------------------------------------------------------------

    A contract can have at most one fallback function, declared using either 

    fallback () external [payable] 

                (or) 

    fallback (bytes calldata _input) external [payable] returns (bytes memory _output) 

    (both without the function keyword). This function ---> must have external visibility. 

    
    A fallback function can be virtual, can override and can have modifiers.

    The fallback function is executed on a call to the contract if none of the other functions match the given function signature, 
    or if no data was supplied at all and there is no receive Ether function. 

    The fallback function always receives data, but -----> in order to also receive Ether it must be marked payable. 

    If the version with parameters is used, _input will contain the full data sent to the contract (equal to msg.data) and can return data in _output. 
    The returned data will not be ABI-encoded. Instead it will be returned without modifications (not even padding).

    In the worst case, if a payable fallback function is also used in place of a receive function, 
    it can only rely on 2300 gas being available (see receive Ether function for a brief description of the implications of this).

    Like any function, the fallback function can execute complex operations as long as there is enough gas passed on to it.

    Warning!

    A payable fallback function is also executed for plain Ether transfers, if no receive Ether function is present. 
    It is recommended to always define a receive Ether function as well, if you define a payable fallback function 
    to distinguish Ether transfers from interface confusions.

    LOGS -------------------------------------------------------------------------
    
    It is possible to store data in a specially indexed data structure that maps all the way up to the block level. 
    feature called logs is used by Solidity in order to implement events. 
    
    Contracts cannot access log data after it has been created, but they can be efficiently accessed from outside the blockchain. 
    
    Since some part of the log data is stored in bloom filters, it is possible to search for this data 
    in an efficient and cryptographically secure way, so network peers that do not download the whole blockchain
    (so-called “light clients”) can still find these logs.
    
    
    Address (is a Type) -------------------------------------------------------------------------
    
  
    The address type comes in two flavours, which are largely identical:

    address: Holds a 20 byte value (size of an Ethereum address).

    address payable: Same as address, but with the additional members transfer and send.

    The idea behind this distinction is that address payable is an address you can send Ether to, while a plain address cannot be sent Ether.

    Type conversions:

    Implicit conversions from address payable to address are allowed, whereas conversions from address to address payable must be explicit via payable(<address>).

    Explicit conversions to and from address are allowed for uint160, integer literals, bytes20 and contract types.

    Only expressions of type address and contract-type can be converted to the type address payable via the explicit conversion payable(...). 
    
    For contract-type, this conversion is only allowed if the contract can receive Ether, i.e., the contract either has a receive or a payable fallback function. 
    tion to this rule.

    Note:

    If you need a variable of type address and plan to send Ether to it, then declare its type as address payable to make this requirement visible. 
    Also, try to make this distinction or conversion as early as possible.

*/