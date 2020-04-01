# thomas
:train: A muiltithreaded train schedular simulation.

## Overview
This project was an assignment for the [Operating Systems](https://github.com/williamgrosset/thomas/blob/master/csc360_p2.pdf) class at the University of Victoria. The multithreaded train scheduler is a simulation of priority-based trains being loaded concurrently and dispatched across a single track. See the [requirements document](https://github.com/williamgrosset/thomas/blob/master/csc360_p2.pdf) and [design document](https://github.com/williamgrosset/thomas/blob/master/csc360_p2_solutions.pdf) for more details.

### Usage
#### Compile
```
make setup
```

#### Run scheduler
```
make run f=trains.txt
# OR
./mts.o trains.txt
```

#### Clean build
```
make clean
```
