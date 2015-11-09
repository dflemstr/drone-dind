# Drone base image for Docker-in-Docker

This repository builds a Docker image to be used with [Drone CI][1]
that starts an isolated Docker daemon for your builds.  This enables
the building of Docker-based projects in Drone.

## Usage

Given a repository containing a `Dockerfile`, put the following in
your Drone configuration file `.drone.yml`:

```yaml
image: dflemstr/drone-dind
script:
  - docker build -t me/myservice .
  - docker push me/myservice:latest
```

Add this repository to your Drone instance, making sure that you use
privileged containers (since Docker-in-Docker requires that).  You can
now successfully build Docker-based projects on top of Drone.

## How it works

The image contains two scripts, `start-docker` and `stop-docker`, that
will start and stop the inner Docker daemon, respectively.  There is
also a file called `docker-helper.sh` that gets `source`d by Drone on
every build, that makes sure that `start-docker` is ran before, and
`stop-docker` is ran after the build.

[1]: https://drone.io/
