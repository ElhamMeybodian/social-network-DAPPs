// SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

contract SocialNetwork {
    string public name;
    uint public postCount = 0;
    struct Post {
        uint id;
        string content;
        uint tipAmount;
        address author;
    }
    mapping(uint => Post) public posts;

    event PostCreated(uint id, string content, uint tipAmount, address author);

    constructor() public {
        name = "DAPP Social Network";
    }

    function createPost(string memory _content) public {
        // Require valid content
        require(bytes(_content).length > 0);
        // Increament the post count
        postCount++;
        // Create the post
        posts[postCount] = Post(postCount, _content, 0, msg.sender);
        // Trigger event
        emit PostCreated(postCount, _content, 0, msg.sender);
    }
}
