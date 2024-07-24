#!/bin/sh

sudo chmod +r /sys/bus/i2c/drivers/ina3221/1-0040/hwmon/hwmon3/curr1_input
sudo chmod +r /sys/bus/i2c/drivers/ina3221/1-0040/hwmon/hwmon3/curr2_input
sudo chmod +r /sys/bus/i2c/drivers/ina3221/1-0040/hwmon/hwmon3/curr3_input
sudo chmod +r /sys/bus/i2c/drivers/ina3221/1-0040/hwmon/hwmon3/in1_input
sudo chmod +r /sys/bus/i2c/drivers/ina3221/1-0040/hwmon/hwmon3/in2_input
sudo chmod +r /sys/bus/i2c/drivers/ina3221/1-0040/hwmon/hwmon3/in3_input
