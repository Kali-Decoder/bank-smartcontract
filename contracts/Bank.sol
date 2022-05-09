//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// 
// pragma solidity >=0.5.0 <0.9.0;


contract Bank{
    address public bankOwner;
    string public bankName;

    mapping(address=>uint) public customerBalance;
    constructor(){
        bankOwner=msg.sender;
    }

    //there are five functions for our bank contract 
    //1. Deposit Money 
    function depositMoney() public payable {
        require(msg.value !=0,"You need to deposit some amount of money!");
        customerBalance[msg.sender]+=msg.value;
    }
   
    //2. Setbankname 
     function setBankname(string memory _name) external {
         require(msg.sender==bankOwner,"You R Not Owner of bank");
            bankName=_name;
     }
    //1. withdrawl Money  
        function withdrawlMoney(address payable _to,uint _value) public{
            require(_value<=customerBalance[msg.sender],"You Have No Enough Balance");
            customerBalance[msg.sender]-=_value;
            _to.transfer(_value);
        }
    //1. getCustomer Balance 
    function getcustomerBalance() external view returns(uint){
            return customerBalance[msg.sender];
    } 
    //1. getBANk balance  
    function getBankBalance() public view returns(uint){
        require(msg.sender==bankOwner,"You Are Not Owner");
        return address(this).balance;
    }
}