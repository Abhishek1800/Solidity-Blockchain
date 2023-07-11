// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract VotingPlatform {
    struct Topic {
        address creator;
        string name;
        string[] options;
        uint256 expiryTime;
        mapping(string => uint256) voteCount;
        mapping(address => bool) registeredVoters;
        mapping(address => string) voterChoice;
    }

    mapping(uint256 => Topic) public topics;
    uint256 public topicCount;

    event TopicCreated(uint256 topicId, address creator, string name, uint256 expiryTime);
    event OptionCreated(uint256 topicId, string option);
    event VoterRegistered(uint256 topicId, address voter);
    event VoterApproved(uint256 topicId, address voter);
    event VoterRejected(uint256 topicId, address voter);
    event VoteCast(uint256 topicId, address voter, string option);
    event VotingExpired(uint256 topicId);
    event VoteCount(uint256 topicId, string option, uint256 count);

    function createTopic(string memory name, uint256 expiryTime) public {
        topics[topicCount].creator = msg.sender;
        topics[topicCount].name = name;
        topics[topicCount].expiryTime = expiryTime;

        emit TopicCreated(topicCount, msg.sender, name, expiryTime);
        topicCount++;
    }

    function createOption(uint256 topicId, string memory option) public {
        require(topicId < topicCount, "Invalid topic ID");

        Topic storage topic = topics[topicId];
        require(msg.sender == topic.creator, "Only topic creator can create options");

        topic.options.push(option);

        emit OptionCreated(topicId, option);
    }

    function registerVoter(uint256 topicId) public {
        require(topicId < topicCount, "Invalid topic ID");

        Topic storage topic = topics[topicId];
        require(topic.expiryTime > block.timestamp, "Voting has expired");

        topic.registeredVoters[msg.sender] = true;

        emit VoterRegistered(topicId, msg.sender);
    }

    function approveVoter(uint256 topicId, address voter) public {
        require(topicId < topicCount, "Invalid topic ID");

        Topic storage topic = topics[topicId];
        require(msg.sender == topic.creator, "Only topic creator can approve voters");

        topic.registeredVoters[voter] = true;

        emit VoterApproved(topicId, voter);
    }

    function rejectVoter(uint256 topicId, address voter) public {
        require(topicId < topicCount, "Invalid topic ID");

        Topic storage topic = topics[topicId];
        require(msg.sender == topic.creator, "Only topic creator can reject voters");

        topic.registeredVoters[voter] = false;

        emit VoterRejected(topicId, voter);
    }

    function castVote(uint256 topicId, string memory option) public {
        require(topicId < topicCount, "Invalid topic ID");

        Topic storage topic = topics[topicId];
        require(topic.registeredVoters[msg.sender], "You are not allowed to vote");

        require(topic.expiryTime > block.timestamp, "Voting has expired");

        require(bytes(topic.voterChoice[msg.sender]).length == 0, "You have already voted");

        require(isOptionValid(topicId, option), "Invalid option");

        topic.voteCount[option]++;
        topic.voterChoice[msg.sender] = option;

        emit VoteCast(topicId, msg.sender, option);
    }

    function isOptionValid(uint256 topicId, string memory option) internal view returns (bool) {
        Topic storage topic = topics[topicId];

        for (uint256 i = 0; i < topic.options.length; i++) {
            if (keccak256(bytes(topic.options[i])) == keccak256(bytes(option))) {
                return true;
            }
        }

        return false;
    }

    function expireVoting(uint256 topicId) public {
        require(topicId < topicCount, "Invalid topic ID");

        Topic storage topic = topics[topicId];
        require(msg.sender == topic.creator, "Only topic creator can expire voting");

        emit VotingExpired(topicId);
    }

    function getVoteCount(uint256 topicId, string memory option) public view returns (uint256) {
        require(topicId < topicCount, "Invalid topic ID");

        Topic storage topic = topics[topicId];
        require(topic.expiryTime <= block.timestamp, "Voting has not expired yet");

        require(isOptionValid(topicId, option), "Invalid option");

        return topic.voteCount[option];
    }

    function getVoterChoice(uint256 topicId, address voter) public view returns (string memory) {
        require(topicId < topicCount, "Invalid topic ID");

        Topic storage topic = topics[topicId];

        return topic.voterChoice[voter];
    }
}