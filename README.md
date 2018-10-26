# Swerver

[![Build Status](https://travis-ci.com/mrfishball/Swerver.svg?branch=master)](https://travis-ci.com/mrfishball/Swerver)

A HTTP Server in Swift.

## Prerequisites

- Swift 4 (For Linux only. If you're on OS X, Swift is bundled with Xcode)

- Latest Xcode (For OSX only)

- Any modern web browser / Postman / Paw or curl commands

- Terminal

- Ruby (For running acceptance tests)

## Set Up

Clone or fork this repo:

```sh
$ git clone https://github.com/mrfishball/Swerver.git
```

CD into the repo directory and pull the submodule:

```sh
git submodule init
git submodule update
```
To be able to open and edit in Xcode, in the root of the project directory, run:

```sh
$ swift package generate-xcodeproj
```

## Running and testing Swerver in Xcode (Shortcut Keys)

In Xcode, go to 'Product', then 'Scheme' and make sure there's a checkmark next to Swerver-Package, then click on 'Edit Scheme...'.
Now a window will pop up and on the left menu bar, select 'Run' then next to 'Executable' on the right plane select 'SwerverRunner'.
Hit close. Follow the instruction below to run Swerver.

To run:

```sh
Command + R
```


To unit test:

```sh
Command + U
```

To stop Swerver:

```sh
Command + .
```

## Compiling, testing and running Swerver with the Swift Package Manager


To build, run:

```sh
$ swift build
```

And to test, run:

```sh
$ swift test
```

Finally to run:

```sh
$ swift run
```

## Acceptance Tests (Only if you are not using Xcode. See above for more detail on running in Xcode)

Inside the submodule directory (http_server_spec) run:

```sh
bundle install
```

then run:

```sh
bundle exec spinach --tags ~@simple-post
```

to run all relevant tests

## Running and testing Swerver in the docker container

To Build a Linux environment with Swift, cd into the project directory and run:

```sh
docker build -t swerver:latest .
```

Docker will test and build the project into a docker image.

After successfully building a docker image, run in the terminal:

```sh
docker run -p 5000:5000 swerver:latest
```

Swerver(docker) will now be running. Point to localhost:5000 to access it.


## Usage

Following the instructions in the terminal after running the server.

## Author

Steven Kwok (@mrfishball)

## License

TTT is released under the MIT License. See the LICENSE file for further
details.
