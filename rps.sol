pragma solidity 0.6.0; 

contract RPS {
    uint8 constant ROCK = 0;
    uint8 constant PAPER = 1;
    uint8 constant SCISSORS = 2;
    
    uint8 public Player1choice = 99;
    uint8 public Player2choice = 99;
    
    uint public outcome = 99999;
    
    address payable Player1; 
    address payable Player2;
    address payable RPSPlatform;
    uint public Player1_balance; 
    uint public Player2_balance;
    
   // constructor Register_Player(address payable Player1choice, address payable Player2choice) public{
        //Player1 = 99;
        //Player2=two;
    
    mapping(address => uint8) public choices;
    
    
    function register1 (address payable p1, uint8 amount) public {
        Player1_balance = amount;
        Player1 = p1;
    }
    
    function register2 (address payable p2, uint8 amount ) public {
        
        Player1_balance = amount;
        Player2 = p2;
    }
   
    function play (uint8 choice, uint8 choice2) public returns (uint) {
       // if (msg.sender==Player1) {
            //choices[Player1]=choice;
        //}
        //else if (msg.sender==Player2)
            //choices[Player2]=choice2;
            
        choices[Player1]=choice; 
        choices[Player2]=choice2;
            
        if ((choices[Player1])!=99 && (choices[Player2])!=99) {
            outcome=100;
            
            if (choices[Player1] == ROCK && choices[Player2] == PAPER) {
                return choices[Player2];
                
            // paper still beats rock (played in opposite alice/bob)
            } else if (choices[Player1] == PAPER && choices[Player2] == ROCK) {
                return choices[Player2];
                
            } else if (choices[Player1] == SCISSORS && choices[Player2] == PAPER) {
                return choices[Player1];
                
            } else if (choices[Player2] == SCISSORS && choices[Player1] == PAPER) {
                return choices[Player2];
                
            } else if (choices[Player1] == ROCK && choices[Player2] == SCISSORS) {
                return choices[Player1];
                
            } else if (choices[Player2] == ROCK && choices[Player1] == SCISSORS) {
                return choices[Player2];
            }
        }
    }
}
