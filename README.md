# Automatically verify porperties in smart contracts with KEVM

Two agents can negotiate the price for exchanging a pice of data *d* for an agreed price *p*. The result of the negotiation can be a contract deployed in Ethereum.

To ensure that the contract is correct, the agents can verify the specific properties in the contract.

This represents a very simple swap contract where agent *A* needs to fund the contract and agent *B* can submit a piece of data and receives the agreed price.

Ideally, the specification should be build automatically.

## Getting started

You need KEVM available in your local machine.

### Local Install
Since KEVM is comparably resource intensive it might be better to have a local version.

Follow the instructions at [https://github.com/kframework/evm-semantics](https://github.com/kframework/evm-semantics).

For convenience add kevm to your PATH.

```
export PATH=$PATH:/path/to/evm-semantics
```


### Docker Install
Build the docker container with:
```
docker build -t kevm .
```


This will install the KEVM requirements in an Ubuntu 16.04 container according to the requirements listed in [https://github.com/kframework/evm-semantics](https://github.com/kframework/evm-semantics). The image is based on [https://github.com/phusion/baseimage-docker](https://github.com/phusion/baseimage-docker).


Start the docker container:
```
docker start kevm
```

**Warning**: The docker container has an insecure ssh key set. It is purely for testing purposes and should not be exposed to the Internet.

You can get *docker-ssh* as a command line tool by executing the following:
```
curl --fail -L -O https://github.com/phusion/baseimage-docker/archive/master.tar.gz && \
tar xzf master.tar.gz && \
sudo ./baseimage-docker-master/install-tools.sh
docker-ssh YOUR-CONTAINER-ID
```