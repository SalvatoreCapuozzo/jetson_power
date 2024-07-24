# jetson_power
Energy consumption estimation utilities for Jetson-based platforms, both Orin family and previous ones.


This repository contains a utility for measuring energy consumption when running various programs in NVIDIA Jetson-based platforms.
Currently Orin Nano, Orin NX, TX2, NX and AGX are supported.

## Usage
If you want to measure the energy consumption of a program, you can directly run the utility providing the command that you want to measure:
```bash
python3 p_est.py program_to_run.sh
```
You can test the utility using a stress test (make sure you have installed stress - `apt install stress`), e.g., 
```bash
python3 p_est.py stress --cpu 6 -t 5
```
You can also run a GPU-based test using CUDA examples:
```bash
sudo make  /usr/local/cuda-10.2/samples/0_Simple/matrixMul/matrixMul
python3 p_est.py /usr/local/cuda-10.2/samples/0_Simple/matrixMul/matrixMul -wA=9200 -hA=320 -wB=640 -hB=9200
```
You can play around `jetson_clocks.sh` and see the consumption indeed increasing.

By default, the program points to Orin registers. In order to make this program work on previous family boards (TX2, NX, AGX), the attribute `is_orin` of the class `PowerEstimator` in the Python file `p_est.py` shall be changed to `False`.


## Interfacing with Python for more precise measurements 
Using the utility from the command line can include initialization cost in the power consumption. 
Even though this can be estimated and then subtracted, we also provide a simple Python API:
```python
from p_est import PowerEstimator
from time import sleep

def my_fun():
    for i in range(5):
        sleep(1)
        print('sleeping')


p_est = PowerEstimator()
total_energy, total_energy_over_idle, total_time = p_est.estimate_fn_power(my_fun)
```
You can use the `PowerEstimator` class to directly measure the energy consumption of any function.


# Things to consider
- Currently, the tool has been tested only on Orin Nano and Orin NX. Testing on boards from the previous family have been performed by the author of the [original repository](https://github.com/opendr-eu/jetson_power) OpenDR.
- If sensors report overlapping power measurements, then the tools might overestimate power usage.
- Power usage is estimated solely using the sensors provided by Jetsons. This usually underestimates the total power.
- You can consider increasing `sampling rate` in order to have more precise measurements.

