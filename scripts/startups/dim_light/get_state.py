"""
This script returns two state, 0 and 1
If the current time is later than 10:30pm and earlier than 5:30am,
The state will be 1, else will be 0
If the state is 1, set kbdlight and brillo to be dimmed

Script will be executed at startx
"""


import os
from datetime import time

def get_current_time():
    current_time = os.popen('date +%-H:%-M').read()
    return current_time.split(':')

def compare_time():
    hour, minute = get_current_time()
    current = time(
        hour = int(hour), 
        minute = int(minute)
    )
    mark_time_pm = time(hour=22, minute=30)
    mark_time_am = time(hour=5, minute=0)
    if current > mark_time_pm or current < mark_time_am:
        return 1
    else:
        return 0


if __name__ == "__main__":
    print(compare_time())
    
