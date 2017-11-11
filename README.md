# arc-docker

Docker image for Anarki Stable (fixed version of Arc 3.1, a dialect of Lisp).

Base: Debian `stretch-slim`

CMD: `arc.sh`

First, `racket` is installed directly from the debian repositories since the core of Arc is written in it.

The image clones Anarki from [https://github.com/arclanguage/anarki] into `/arc` and checks out the stable branch. A customized `arc.sh` is provided to disable the use of `rlwrap`, due to its problems within a docker container.

## Changes to Arc

In order to make the full functionality of the arc work in a docker image, the following changes had to be made, by having the `Dockerfile` manually add the modified files to the image after running `git clone` on the Anarki repository.

In `arc.sh`, `RLWRAP=false` was needed at the top because rlwrap does not work when running a repl within a docker container.

In `srv.arc`, a call to setuid has to provide 999 instead of 2 for a user (created by the Dockerfile) that has write access to the `logs/` directory. This way Arc's built in web server can write to the log files without needing root. The `Dockerfile` handles the process of giving UID 999 write access to the `logs/` directory.
