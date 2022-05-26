// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract Todolist {
    uint public taskCount = 0;

    struct Task {
        uint id;
        string content;
        bool completed;
    }
    event newTask(
     uint id,
    string content,
    bool completed
  );

    mapping(uint=> Task) public tasks;

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit newTask(taskCount, _content, false);
    }
    constructor() {
        createTask("First task" );
    }

}