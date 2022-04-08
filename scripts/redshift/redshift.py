# Get the current state, 1 is on, 0 is off
# Then toggle the state once the script is executed, to toggle on and off


import sys, json


state_file = './src/state.json'

def get_state():
    """Get the current state:
    1 is on
    0 is off
    """
    with open(state_file) as file:
        state = json.load(file)
    return state['is_on']

def state_swap():
    state = int(get_state())
    with open(state_file, 'w') as file:
        if state == 1:
            state = {"is_on":0}
            json.dump(state, file)
        else:
            state = {"is_on":1}
            json.dump(state, file)
    return None

if __name__ == "__main__":
    arg = sys.argv[1]
    if arg == '-get':
        print(get_state())
    elif arg == '-s':
        state_swap()