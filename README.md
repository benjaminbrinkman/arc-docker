# arc-docker

Docker images for Anarki Stable (fixed version of Arc 3.1, a dialect of Lisp).

Base: Debian stretch-slim

CMD: arc.sh

First, racket is installed directly from debian repositories since the core of Arc is written in it.

The image clones Anarki from [https://github.com/arclanguage/anarki] into `/arc` and checks out the stable branch. A customized arc.sh is provided to disable the usage of rlwrap, due to its problems within a docker container.
