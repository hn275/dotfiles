#!/usr/bin/python

"""This script will check on the time,
then set brightness and keyboard light accordingly"""

from datetime import datetime
from datetime import time
import os

def get_time():
    """Returns the current time in tuple (hour, minute)"""
    time = datetime.now()
    time = time.strftime("%H:%M") # formatting time to `HH:MM` format
    time = time.split(":") # split to list
    return time[0], time[1]

def compare_time():
    """If the current time falls between 10:30pm and 6am, return True, False otherwise"""
    # set am and pm time
    am_time = time(
            hour = 6,
            minute = 0
            )
    pm_time = time(
            hour = 22,
            minute = 30
            )
    # get current time
    hour, minute = get_time()
    current_time = time(
            hour = int(hour),
            minute = int(minute)
            )
    # `if` logic for current time being in the range of late time
    if current_time > pm_time or current_time < am_time:
        return True
    else:
        return False

if __name__ == "__main__":
    # commands to run
    late_commands = [
            'brightnessctl -d smc::kbd_backlight set 80%; usrkbdlight',
            'brightnessctl -d gmux_backlight set 2%; usrbrightness',
            'usrredshift'
            ]
    commands = {
            'brightnessctl -d smc::kbd_backlight set 0%; usrkbdlight',
            'brightnessctl -d gmux_backlight set 50%; usrbrightness',
            }
    if compare_time() is True:
        for command in late_commands:
            os.system(command)
    else:
        for command in commands:
            os.system(command)

