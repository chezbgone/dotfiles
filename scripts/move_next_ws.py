#!/usr/bin/env python

import subprocess
import sys

d_id = lambda line: int(line.split()[0])
d_name = lambda line: line.split()[-1]

if __name__ == '__main__':
    #assert len(sys.argv) == 4
    screen = sys.argv[1]
    direction = sys.argv[2]
    output = sys.argv[3]
    #assert direction in ['prev', 'next']

    desktop_info = subprocess.check_output('wmctrl -d', shell=True).decode('utf-8').splitlines()

    # e.g. ['1', '(2)', '3', '8', '9', '10']
    workspaces = output.split(' : ')[0].split()

    # e.g. { '0_1': 0, '1_1': 1, '0_2': 2, etc. }
    desktops = { d_name(d): d_id(d) for d in desktop_info }

    visibles = [ws for ws in workspaces
                  if '(' in ws or '[' in ws]
    #assert len(visibles) == 1
    visible_ = visibles[0] # e.g. '(2)'
    visible = visible_[1:-1] # e.g. '2'

    if direction == 'prev':
        target = dict(zip(workspaces[1:], workspaces)).get(visible_, visible)
    else:
        #assert(direction == 'next')
        target = dict(zip(workspaces, workspaces[1:])).get(visible_, visible)

    #subprocess.run(['notify-send', f'switching to {screen}_{target}'])
    if visible_[0] == '(':
        # go to correct screen
        # assumes there are only two screens
        subprocess.run(['xdotool', 'key', 'alt+Left'])
    subprocess.run(['wmctrl', '-s', str(desktops.get(f'{screen}_{target}', 0))])
