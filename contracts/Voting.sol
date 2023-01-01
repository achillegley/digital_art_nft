// SPDX-License-Identifier: MIT
// author: achillegley
pragma solidity >=0.4.22 <0.9.0;

contract Voting {
    address public owner;
    uint public totalVotes;
    mapping(address => bool) public voted;
    mapping(uint => uint) public votes;
    uint[] public voteOptions;

    constructor(uint[] memory _voteOptions) public {
        owner = msg.sender;
        voteOptions = _voteOptions;
    }

    function vote(uint _voteOption) public {
        require(!voted[msg.sender]);
        require(_voteOption > 0 && _voteOption <= voteOptions.length);
        voted[msg.sender] = true;
        votes[_voteOption] += 1;
        totalVotes += 1;
    }

    function getVoteTally() public view returns (uint[] memory) {
        uint[] memory voteTally = new uint[](voteOptions.length);
        for (uint i = 0; i < voteOptions.length; i++) {
            voteTally[i] = votes[i+1];
        }
        return voteTally;
    }
}

