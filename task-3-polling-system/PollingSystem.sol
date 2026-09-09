// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

/// @title PollingSystem
/// @notice Allows users to create time-limited polls and vote once per address.
contract PollingSystem {
    struct Poll {
        string title;
        string[] options;
        uint256 endTime;
        bool exists;
        mapping(address => bool) hasVoted;
        mapping(uint256 => uint256) voteCount;
    }

    uint256 public pollCount;
    mapping(uint256 => Poll) private polls;

    event PollCreated(uint256 indexed pollId, string title, uint256 endTime);
    event VoteCast(uint256 indexed pollId, address indexed voter, uint256 optionIndex);

    /// @notice Create a poll with at least two options and a future voting duration.
    /// @param title Human-readable poll title.
    /// @param options Candidate options.
    /// @param votingDurationSeconds Number of seconds the poll remains open.
    function createPoll(
        string calldata title,
        string[] calldata options,
        uint256 votingDurationSeconds
    ) external returns (uint256 pollId) {
        require(bytes(title).length > 0, "Title required");
        require(options.length >= 2, "At least two options required");
        require(votingDurationSeconds > 0, "Duration must be greater than zero");

        pollId = ++pollCount;
        Poll storage poll = polls[pollId];
        poll.title = title;
        poll.endTime = block.timestamp + votingDurationSeconds;
        poll.exists = true;

        for (uint256 i = 0; i < options.length; i++) {
            require(bytes(options[i]).length > 0, "Option cannot be empty");
            poll.options.push(options[i]);
        }

        emit PollCreated(pollId, title, poll.endTime);
    }

    /// @notice Vote for one option in an active poll.
    function vote(uint256 pollId, uint256 optionIndex) external {
        Poll storage poll = polls[pollId];
        require(poll.exists, "Poll does not exist");
        require(block.timestamp < poll.endTime, "Voting has ended");
        require(!poll.hasVoted[msg.sender], "Address has already voted");
        require(optionIndex < poll.options.length, "Invalid option index");

        poll.hasVoted[msg.sender] = true;
        poll.voteCount[optionIndex] += 1;

        emit VoteCast(pollId, msg.sender, optionIndex);
    }

    /// @notice Check whether an address has already voted in a poll.
    function hasAddressVoted(uint256 pollId, address voter) external view returns (bool) {
        Poll storage poll = polls[pollId];
        require(poll.exists, "Poll does not exist");
        return poll.hasVoted[voter];
    }

    /// @notice Return poll metadata, options, and vote totals.
    function getPoll(uint256 pollId)
        external
        view
        returns (
            string memory title,
            string[] memory options,
            uint256 endTime,
            uint256[] memory voteCounts
        )
    {
        Poll storage poll = polls[pollId];
        require(poll.exists, "Poll does not exist");

        title = poll.title;
        options = poll.options;
        endTime = poll.endTime;
        voteCounts = new uint256[](poll.options.length);

        for (uint256 i = 0; i < poll.options.length; i++) {
            voteCounts[i] = poll.voteCount[i];
        }
    }

    /// @notice Return the winning option after a poll ends.
    /// @dev If multiple options tie, the lowest-index option is returned.
    function getWinningOption(uint256 pollId)
        external
        view
        returns (uint256 winningIndex, string memory winningOption, uint256 winningVotes)
    {
        Poll storage poll = polls[pollId];
        require(poll.exists, "Poll does not exist");
        require(block.timestamp >= poll.endTime, "Poll is still active");

        winningIndex = 0;
        winningVotes = poll.voteCount[0];

        for (uint256 i = 1; i < poll.options.length; i++) {
            uint256 currentVotes = poll.voteCount[i];
            if (currentVotes > winningVotes) {
                winningVotes = currentVotes;
                winningIndex = i;
            }
        }

        winningOption = poll.options[winningIndex];
    }
}
