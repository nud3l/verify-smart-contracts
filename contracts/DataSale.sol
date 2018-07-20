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
}