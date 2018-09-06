# MW2D
Python Multiwinner Package

The package is implemented in Python (2.7.3) and provides a number of features:
1. generation of preference profiles based on the two-dimensional Euclidean domain
2. computing winners of multiwinner elections
3. visualizing election results
4. running series of experiments

For a full manual see manual/manual.pdf

## Reproducing using Docker

In order to reproduce this analysis we need to capture the environment that
allows it to run. Since this tool has been implemented using Python, we will
first capture the specific Python version through a [`Dockerfile`](Dockerfile).

```Dockerfile
FROM python:2.7
```

Then, we will define the Python packages which this application requires,
for doing so we will use a simple approach, a
[`requirements.txt`](requirements.txt) file.

```
numpy==1.15.0
Pillow==5.0.0
ilp==0.1
cplex==12.8.0.0
networkx==2.1
```

So now, we are ready to combine the `Dockerfile`, which will provide the
correct Python version, and the `requirements.txt`, providing the Python
requirements:

```diff
FROM python:2.7
+
+ WORKDIR /home/MW2D
+
+ COPY requirements.txt .
+
+ RUN pip install -r requirements.txt
```

We the Docker image which will allow MW2D to run:

```console
~/MW2D/ $ docker build . -t MW2D-env
```

Finally, we run the example:

```console
~/MW2D/ $ docker run -v $PWD:/home/MW2D -ti --rm MW2D-env /bin/bash
> # Then we run the application as described in manual/manual.pdf
> cd src
> python experiment.py < ../examples/example_input
...
> exit
~/MW2D/ $ # we can now visualize the results.
~/MW2D/ $ open src/input-a-stv.png
~/MW2D/ $ open src/input-b-stv.png
```
