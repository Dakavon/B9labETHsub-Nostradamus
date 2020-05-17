# B9lab ETH-SUB: Nostradamus Challenge

Challenge set up and assisted by B9lab (https://academy.b9lab.com)


> Challenge time! Can you guess the next block's values? If you think you can, prove it by having your address return `true` here https://ropsten.etherscan.io/address/0x8A879BCCd75B9cb17cc9DC9a69820A794cae0b1E#readContract.


### Steps towards success
1. Wrote contract `TheProphecy.sol` and compiled with [Remix](http://remix.ethereum.org)
2. Copied *ABI* and *Bytecode* (see folder `text files`)
3. Due to nicely formatted output converted ABI in a one-liner: `tr -d "\n\r\t" < ABI\ \(copied\ from\ Remix\).txt > ABIforGeth.txt`
4. Within geth console:
	- ```JavaScript
		var TheProphecyContractABI = _ConvertedABI_
		```
	- ```JavaScript
		var TheProphecyContract = web3.eth.contract(TheProphecyContractABI)
		```
	- ```JavaScript
		var TheProphecyInstance = TheProphecyContract.new(
			{
				from: eth.accounts[0],
				data: _RemixBytecode_,
				gas: 100000
			}, function(e, contract){
				console.log(e, contract);
				if (typeof contract.address !== 'undefined') {
					console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);
					}
				}
			)
		```
	- ```JavaScript
		TheProphecyInstance.prophesy("Heyho! Its Niels!\n \xF0\x9F\x98\x8E", {from: eth.accounts[0]})
		```