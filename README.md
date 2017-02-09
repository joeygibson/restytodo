# restytodo

A sample of using [Go](https://golang.org/) to create a REST app. The code is almost entirely from
[this article](http://thenewstack.io/make-a-restful-json-api-go/). I added a suite of [Cucumber](https://cucumber.io) tests
to get better at Cucumber testing.

## Building

This project now uses the [Cisco Elsy](https://github.com/cisco/elsy) build tool. (I'm also on the
team that builds Elsy.)

To download all the necessary docker images, and build the local tools, run

    lc bootstrap

This command will build the app and a Docker image to run it.

    lc package

To build a runnable copy on your own platform, run

    GOOS=<your os> GOARCH=<your arch> lc run package-local

To run the Cucumber tests, run

    lc bbtest

To build everything and run all the tests, run 

    lc ci

To run the app for general use, run

    lc server start -p

To kill the running app, run

    lc server stop
    
