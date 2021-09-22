pragma solidity ^0.5.1;

contract ERC20Token {
    string public name; 
    mapping(address => uint256) public balances;
    
    function mint() public {
        balances[msg.sender] ++;
    } 
}

contract MyContract {
    address payable wallet;
    address public token;
    
    event Purchase(
        address indexed _buyer,
        uint256 _amount
        
    );
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    } 
    
    function() external payable {
        buyToken();
    }
    
    function buyToken() public payable {
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
    }
    
}
