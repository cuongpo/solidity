// "SPDX-License-Identifier: UNLICENSED"  

pragma solidity ^0.8.1;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract fundWallet is Ownable {
    using SafeMath for uint;

    event AllowanceChange (address indexed _forWho, address indexed _byWhom, uint _oldAmount, uint _newAmount);
    event MoneySent (address indexed _to, uint _amount); 
    event MoneyReceived (address indexed _from, uint _amount);
    mapping (address => uint) public allowance;



    function addAllowance (address _who, uint _amount) public onlyOwner {
        emit AllowanceChange(_who,msg.sender,allowance[_who],_amount);
        allowance[_who]= allowance[_who].add(_amount);
        
    }
    
    function reduceAllownance (address _who, uint _amount) internal ownerOrWhoIsAllowed(_amount) {
        emit AllowanceChange(_who,msg.sender,allowance[_who],allowance[_who]-_amount);
        allowance[_who] = allowance[_who].sub(_amount);
    }

    function isOwner() internal view returns(bool) {
        return owner() == msg.sender;
    }

    modifier ownerOrWhoIsAllowed (uint _amount) {
        require (isOwner() || allowance[msg.sender] >= _amount,"You are not allowed");
        _;
    }

    function withDrawMoney (address payable _to, uint _amount) public ownerOrWhoIsAllowed(_amount) {
        if (!isOwner()) {
            reduceAllownance(msg.sender,_amount);
        } 
        emit MoneySent(_to, _amount);
        _to.transfer(_amount);
    }

    receive() external payable {
        emit MoneyReceived(msg.sender,msg.value); 
    }

    function renounceOwnership() public view override onlyOwner {
        revert("can't renounceOwnership");
    }
}
