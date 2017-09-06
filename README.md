# MSMSEpaperCode

This is the Monte Carlo microstructure simulation package used in the NSF project DMREF: Real Time Control of Grain Growth in Metals

The code is a derivation from the MMSP project on [Github](https://github.com/tkphd/mmsp)

MMSP deveopers: Jason Gruber, Trever Keller

Derivation developers: Yixuan Tan

Prerequisites
This code aims for use in large scale, so an account on an super computer is recommended. A cluster or a multicore machine can also take advantage of the parallel features.

The following libraries are required for the code to run:

Unix operating system. (tested on Ubuntu 12.04 and 14.04)
g++ (version > 4.3)
MPI
IBM XL compiler


Compile
to compile the code on your local machine, simply navigate to the directory of Makefile, and type in the terminal:
make parallelmc
to compile the code on Blue Gene/Q, type
make bgqmc


Running
to run the code, the following arguments should be passed with the call to executable
mpirun -n num_of_processors executable --nonstop dim output_filename total_steps increment_steps num_of_threads
Example:

num_of_processors: 4

executable: parallel_MC.out or q_MC.out

dim: 2 or 3 for 2D or 3D simulation respectively

output_filename: name of the output file, user can defined it. e.g. voronoi.0000.dat

total_steps: must be an integer

increment_steps: must be an integer <= total_steps

num_of_threads: POSIX Threads to be used. Must be an integer, normally <= 8.

The result files are XXX.dat. If simulations are running on Blue Gene Q, the XXX.dat files are of little endian format. So you need to download the XXX.dat files from Blue Gene Q to a local machine (most are big endian machine) and convert the XXX.dat files to big endian using the command below. If there is no executable "wrongendian", it should be created first.
./wrongendian XXX.dat XXX_big_endian.dat
You can find wrongendian.cpp under the project root directory, to make a wrongendian executable, type
make wrongendian
