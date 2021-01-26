pragma solidity 0.6.0; 

contract RPS {
    uint8 constant ROCK = 0;
    uint8 constant PAPER = 1;
    uint8 constant SCISSORS = 2;
    
    uint8 private Player1choice = 99;
    uint8 private Player2choice = 99;
    
    uint public outcome = 99999;
    
    address  payable public Player1; 
    address  payable public Player2;
    address  payable public RPSPlatform = msg.sender;
    
    uint public Player1_balance; 
    uint public Player2_balance;
    uint public RPSPlatform_balance;
    
    //string winner = "The Winner is";
   //contract address 0x46b84Bf7e1Bb130073B568CA34b30fbffCdA4437
   //my address 0x2eaF8c2eCAc682DAf3562A091c2A6Df9c2883568
   //RPS 0x2eaF8c2eCAc682DAf3562A091c2A6Df9c2883568
   
   // constructor Register_Player(address payable Player1choice, address payable Player2choice) public{
        //Player1 = 99;
        //Player2=two;
        
    mapping(address => uint8) public choices;
    mapping(address => uint) public balances;   
    
    function register1 (address payable p1, uint8 amount) public {
        require(amount > 0, "You need to bet more than 0");
        Player1_balance = amount;
        Player1 = p1;
        balances[Player1] += amount;
    }
    
    function register2 (address payable p2, uint8 amount ) public {
        require(amount == Player1_balance, "You have to bet the same amount as Player1, which was");
        Player2_balance = amount;
        Player2 = p2;
        balances[Player2] += amount;
    }
    
    function setPlay1 (uint8 choice) public {
        Player1choice = choice;
        choices[Player1] = choice;
    }
    
    function setPlay2 (uint8 choice) public {
        require(choices[Player1] != 99, "Please wait until Player 1 bets");
        Player2choice = choice;
        choices[Player2] = choice;
        play(Player1choice, Player2choice);
      }
      
    function play (uint8 Playerchoice1, uint8 Playerchoice2) private returns (uint) {
       // if (msg.sender==Player1) {
            //choices[Player1]=choice;
        //}
        //else if (msg.sender==Player2)
            //choices[Player2]=choice2;
            
        choices[Player1]=Playerchoice1; 
        choices[Player2]=Playerchoice2;
        
        if ((choices[Player1])!=99 && (choices[Player2])!=99) {
            outcome=100;
            
            if (choices[Player1] == ROCK && choices[Player2] == PAPER) {
                outcome = 2;
                //return choices[Player2];
                
            } else if (choices[Player1] == PAPER && choices[Player2] == ROCK) {
                outcome = 1;
               // return choices[Player1];
               
            } else if (choices[Player1] == SCISSORS && choices[Player2] == PAPER) {
                outcome = 1;
                //return choices[Player1];
                
            } else if (choices[Player2] == SCISSORS && choices[Player1] == PAPER) {
                outcome = 2;
                //return choices[Player2];
                
            } else if (choices[Player1] == ROCK && choices[Player2] == SCISSORS) {
                outcome = 1;
                //return choices[Player1];
                
            } else if (choices[Player2] == ROCK && choices[Player1] == SCISSORS) {
                outcome = 2; 
               // return choices[Player2];
               
            } else if ((choices[Player2] == ROCK && choices[Player1] == ROCK) || (choices[Player2] == SCISSORS && choices[Player1] == SCISSORS) || (choices[Player2] == PAPER && choices[Player1] == PAPER)) {
                outcome = 3;
               // return  0;
            }
        }
        
        transfer_to_winner();
        choices[Player1] = 99;
        choices[Player2] = 99;
    }
    
    function transfer(address sender, address recipient, uint value) private{ //returns (uint, uint){
        balances[sender] -= value;
        balances[recipient] += value;
        //return (balances[sender] , balances[recipient]);
}

    function transfer2(address sender1, address sender2, address recipient, uint value, uint value2) private{ //returns (uint, uint, uint){
        balances[sender1] -= value;
        balances[sender2] -= value2;
        balances[recipient] += value;
        balances[recipient] += value2;
        //return (balances[sender1], balances[sender2], balances[recipient]);
    }
    
    function transfer_to_winner () private{ //returns (address){
       //uint winner;
       //uint loser;
        if (outcome == 1){
            transfer(Player2, Player1, Player2_balance); 
           Player2_balance = balances[Player2];
           Player1_balance = balances[Player1];
           
        } else if (outcome == 2){
            transfer(Player1, Player2, Player1_balance); 
            Player1_balance = balances[Player1];
            Player2_balance = balances[Player2];
            
        }else if (outcome == 3){
            //uint losertemp;
            transfer2(Player1, Player2, RPSPlatform, Player1_balance, Player2_balance);
            Player1_balance = balances[Player1];
            Player2_balance = balances[Player2];
            RPSPlatform_balance = balances[RPSPlatform]; 
            //(loser, winner) = transfer(Player1, RPSPlatform, Player1_balance);
            //Player1_balance = loser;
            //RPSPlatform_balance = winner;
            //(loser, winner) = transfer(Player2, RPSPlatform, Player2_balance);
            //Player2_balance = loser;
            //RPSPlatform_balance += winner;
        }
}
}        
