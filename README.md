# Dionysus Container

A simple way to run code that requires Dionysus.

Make sure to throw all the libraries you need the container to have into the "RUN pip install ..." line
after dionysus in the Dockerfile.

## How to build and run

```bash
./build_and_run_container.sh --build
```

## What if I want to write output from my script into some files?

In the script make sure you put all your outputs in a directory called "output".
This default can be changed by supplying some additional options to the
container build/run script above (see the --help output for more info).

So basically the script should pretend like it's throwing all it's output into
a directory called (by default) "output" that is sitting in the same parent as the python
script.

Hopefully that's not too confusing... I'll maybe word this better in the future.

## Don't Forget

Please please please don't forget to name your python code file "script.py".
If you want to mess around with the docker file you can easily change this.
I should make it so that you can change the name with an ARG command at the top
of the dockerfile. Maybe later...
