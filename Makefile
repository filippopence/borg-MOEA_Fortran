####### Compiler, tools and options
CC            = gcc
CXX           = g++
FC            = gfortran
CXXFLAGS      = -c -Wall
FFLAGS        = -c -Wall

####### Compile
all: gauss

# Compiling C Source File Correctly with gcc
moeaframework.o: moeaframework.c moeaframework.h
	$(CC) -c moeaframework.c -o moeaframework.o 

# Compiling Fortran Modules
moea_framework_module.o: moea_framework_module.f90
	$(FC) $(FFLAGS) -c moea_framework_module.f90 -o moea_framework_module.o

evaluate_module.o: evaluate_module.f90
	$(FC) $(FFLAGS) -c evaluate_module.f90 -o evaluate_module.o

# Compiling Gauss Program
gauss.o: gauss.f90 moea_framework_module.o evaluate_module.o
	$(FC) $(FFLAGS) -c gauss.f90 -o gauss.o

# Linking Gauss Executable
gauss: gauss.o moea_framework_module.o moeaframework.o evaluate_module.o
	$(FC) -o gauss gauss.o moea_framework_module.o moeaframework.o evaluate_module.o

# Clean Rule
clean:
	rm -rf *.o *.mod
	rm -f gauss



