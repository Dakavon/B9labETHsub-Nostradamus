//B9lab ETH-SUB Certified Online Ethereum Developer Course
//Challenge  >>> Nostradamus <<<
//
//Last update: 16.05.2020

pragma solidity 0.4.24;


//Interface of deployed contract
contract Nostradamus {
    function prophecise(bytes32 exact, bytes32 braggingRights) public;
    function theWord() public view returns(bytes32 exact);
}


//Executor contract
contract TheProphecy {
    Nostradamus internal michel;
    address public nostradamusLocation = address(0x8A879BCCd75B9cb17cc9DC9a69820A794cae0b1E);

    event LogProphesy(address indexed prophet, bytes32 exactWords, bytes32 braggingRights);

    constructor() public {}

    function predictCorrectWord() public view returns(bytes32 my_exact) {
        bytes32 blockHash = blockhash(block.number);

        return keccak256(abi.encodePacked(address(this), block.number, blockHash, block.timestamp, nostradamusLocation));
    }

    function prophesy(string memory aFewWords) public returns(bool success) {
        michel = Nostradamus(nostradamusLocation);
        bytes32 verse;
        bytes32 my_exact;

        assembly{
            verse := mload(add(aFewWords, 32))
        }

        my_exact = predictCorrectWord();
        michel.prophecise(my_exact, verse);

        emit LogProphesy(msg.sender, my_exact, verse);

        return true;
    }
}
