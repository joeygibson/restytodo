Feature: a running app
    Scenario: Todo app is running
        Given the app is listening on port 8080
        Then it should succeed
        When I get / on port 8080
        Then it should succeed
        And the output should be "Hello, World!"

    Scenario: Get initial list of todos
        Given the app is listening on port 8080
        Then it should succeed
        When I get /todos on port 8080
        Then it should succeed
        And there should be 2 todos
        And the output should contain all of these:
        | Write presentation |
        | Host meetup        |

    Scenario: Get specific todo from list
        Given the app is listening on port 8080
        Then it should succeed
        When I get /todos/1 on port 8080
        Then it should succeed
        And there should be 1 todo with id 1
