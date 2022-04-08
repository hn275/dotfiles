"""
$(kbdlight) works with the value between 0 and 255
The algorithm to conver this scale to 0 to 100 is 
$(kbdlight) / 2.55.
I want to have this in a base of 5, just so dunst can
display the percentage in a nicer manner (than, ie, 12.67%)
"""
import os

def get_kbd(base=5):
    kbd_level = os.popen('kbdlight get').read()
    return base * round((float(kbd_level) / 2.55) / base)


if __name__ == "__main__":
    print(get_kbd())