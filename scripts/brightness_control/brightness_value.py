"""
This script will get the current brightness level
and round it to the nearest integer, 
for some reasons $(brillo -G) only returns weirdass 
values like 65.06% or something silly :/
"""
import os

def get_brightness(base=5):
    brightness = os.popen('brillo').read()
    return base * round(float(brightness) / base)

if __name__ == "__main__":
    print(get_brightness())