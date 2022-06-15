// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./Raffle.sol";



contract EnterRaffle {

    
    
    enum RaffleState {
        OPEN,
        CALCULATING
    }

  // lOTTERY VARIABLE 
    address s_recentWinner;
    address payable[] private s_players;
    uint256 private i_entranceFee;
    uint256 public NUM_WORDS;
    uint256 public s_lastTimeStamp;
    uint256 public REQUEST_CONFIRMATIONS;

    RaffleState private s_raffleState;


    event RaffleEnter(address indexed player);

  // fUNCTIIONS

     constructor () {
        
       
        s_raffleState = RaffleState.OPEN;
        s_lastTimeStamp = block.timestamp;
    }
    

    function enterRaffle() external payable {
        // require(msg.value >= i_entranceFee, "Not enough value sent");
        // require(s_raffleState == RaffleState.OPEN, "Raffle is not open");
        if (msg.value < i_entranceFee) {
            revert Raffle__SendMoreToEnterRaffle();
        }
        if (s_raffleState != RaffleState.OPEN) {
            revert Raffle__RaffleNotOpen();
        }
        s_players.push(payable(msg.sender));
        // Emit an event when we update a dynamic array or mapping
        // Named events with the function name reversed
        emit RaffleEnter(msg.sender);
    }

    function getRaffleState() external view returns (RaffleState) {
        return s_raffleState;
    }

    function getNumWords() external view returns (uint256) {
        return NUM_WORDS;
    }

    function getRequestConfirmations() external view returns (uint256) {
        return REQUEST_CONFIRMATIONS;
    }

    function getRecentWinner() external view returns (address) {
        return s_recentWinner;
    }

    function getPlayer(uint256 index) external view returns (address) {
        return s_players[index];
    }

    function getLastTimeStamp() external view returns (uint256) {
        return s_lastTimeStamp;
    }

    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }

    function getNumberOfPlayers() external view returns (uint256) {
        return s_players.length;
    }

}
  
