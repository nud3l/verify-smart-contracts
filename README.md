# Automatically verify properties in smart contracts with KEVM/KLab

Two agents can negotiate the price for exchanging a piece of data *d* for an agreed price *p*. The result of the negotiation can be a contract deployed in Ethereum.

To ensure that the contract is correct, the agents can verify the specific properties in the contract.

This represents a very simple swap contract where agent *A* needs to fund the contract and agent *B* can submit a piece of data and receives the agreed price.

Ideally, the specification should be build automatically.

## Getting started

You need KEVM/KLab available in your local machine.

### Local Install
Since KEVM/KLab is comparably resource intensive it might be better to have a local version.

Follow the instructions at [https://github.com/kframework/evm-semantics](https://github.com/kframework/evm-semantics) to get the required system wide packages installed.

Next, follow the instructions at [https://github.com/dapphub/klab](https://github.com/dapphub/klab) to install KLab server and client.

### Test
Run the examples from the KLab directory.

### Tutorial
A quick tutorial is available at [https://www.youtube.com/watch?v=z4mIo38x1u8](https://www.youtube.com/watch?v=z4mIo38x1u8).

## Simple sale contract
This contract represents a simple sale where *A* funds a contract and *B* stores a file and in turn receives a payment.

