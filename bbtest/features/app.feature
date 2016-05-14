Feature: a running app
    Scenario: Todo app is running
        Given the app is listening on port 8080
        Then it should succeed
        When I get / on port 8080
        Then it should succeed
        And the output should be "Hello, World!"
