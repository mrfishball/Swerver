# Swerver

[![Build Status](https://travis-ci.com/mrfishball/Swerver.svg?branch=master)](https://travis-ci.com/mrfishball/Swerver)

A HTTP Server in Swift.

## Prerequisites

- Swift 4 or above

- Any modern web browser / Postman / Paw or curl commands

- Terminal

- Latest Xcode (Development Only)


## Set Up (For development and testing)

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

## Compiling and testing in Docker

To Build a Linux environment with Swift, CD in the project directory and run:

```sh
docker build -t swerver:latest .
```

Docker will test and build the project into a docker image.

## Running Swerver in the docker container

After successfully building a docker image, run in the terminal:

```sh
docker run -P swerver:latest
```

then, open a new tab within the terminal and run:

```sh
docker container ls
```

this will list out all the containers currently running on your local machine. Like this:

```sh
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                     NAMES
d90949c7ce59        swerver:latest      ".build/debug/Swerve…"   4 seconds ago       Up 3 seconds        0.0.0.0:32769->5050/tcp   quirky_banach
```

Swerver is set to run on port 5000 by default. Under the 'PORTS' session, copy: 

```sh
0.0.0.0:32769
```

that is the URL to connect to Swerver.
 

## Compiling and testing with the Swift Package Manager


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

## Usage

Following the instructions in the terminal after running the server.

## Author

Steven Kwok (@mrfishball)

## License

TTT is released under the MIT License. See the LICENSE file for further
details.
