// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

contract lovelove {
    
    uint256 account = 0;
    uint256 loveCoin = 0;
    uint256[] commodity = [ 1 , 30 , 60 , 300 , 520 , 1314 , 5000 , 10000 , 100029 ];
    string[] name = ["POOR GIFT" , "KISS" , "HEART" , "HAMBURGER" , "SPORTS CAR" , "ROCKET" , "SUPER ROCKET" , "LUXURY PACK" , "KIMBERLY"];
    
    function store(uint256 num) public {
        account += num;
    }
    
    function getAccount() public view returns (uint) {
        return account;
    }
    
    function getLoveCoin() public view returns (uint) {
        return loveCoin;
    }
    
    function exchangeLoveCoin() public {
        loveCoin += account / 5;
        account = account % 5;
    }
    
    function clearData() public{
        account = 0;
        loveCoin = 0;
    }
    
    event Log(string msg);
    
    function donate(uint donate_type) public{
        
        
        if(loveCoin - commodity[donate_type-1] < 0){
            emit Log("No enough love coins");
        }
        else{
            loveCoin = loveCoin - commodity[donate_type-1];
            emit Log(name[donate_type-1]);
        }
        
    }
    
}