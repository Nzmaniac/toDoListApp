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
    event TaskCompleted(
        uint id,
        bool completed
    );

    mapping(uint=> Task) public tasks;

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit newTask(taskCount, _content, false);
    }
    function completed(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
    constructor() {
        createTask("First task" );
    }

}