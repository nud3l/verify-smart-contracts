# Data Sale Contract

## Contract

```
pragma solidity ^0.4.24;

contract DataSale {
    uint price = 1 ether;
    bytes32 data;
    address buyer = 0x366Fb8487F3361AE1F27feae35DFBB6FD8DD9812;
    address seller = 0x12d7602Ad1B88a546fAE4066960262f077F3A33d;

    function fundContract() public payable {
        require(msg.sender == buyer);
    }

    function payout(bytes32 _data) public payable {
        require(msg.sender == seller);
        require(address(this).balance >= price);
        require(data != _data);

        data = _data;
        msg.sender.transfer(price);
    }

    function getData() public view returns (bytes32) {
        require(msg.sender == buyer);
        return data;
    }
}
```

## Syntax
Initialise the module.
```
module AgentContract  
```

### Price, Addresses, Data
Define price, address, and data. Data is a bytes32 in Solidity for an IPFS hash.

```
  syntax Price   ::= Int  
  syntax Address ::= Int
  syntax Data    ::= Int
```


### Functions
One functions returns the data.
Two functions are not returning a value, but only update the state of the blockchain.
```
  syntax AExp ::= Price | Address | Data
                | "getData" "(" ")"       [strict]
  syntax BExp ::= Bool
                | "fundContract" "(" ")" [strict]
                | "payout" "(" "AExp" ")" [strict]
                | "throw"
```

## Configuration
```
  configuration <AgentContract>
                  <caller> 0 </caller>
                  <k> $PGM:K </k>
                  <price> 0 </price>
                  <data> 0 </data>
                  <buyer> 0 </buyer>
                  <seller> 0 </seller>
                </AgentContract>
```

## Semantics
