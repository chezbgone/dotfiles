#!/usr/bin/env python

import subprocess
import sys

if __name__ == '__main__':
    #assert len(sys.argv) == 2
    screen, desktop = sys.argv[1].split('_')
    workspaces = subprocess.check_output('wmctrl -d', shell=True).decode('utf-8').splitlines()
    for ws in workspaces:
        if sys.argv[1] in ws:
            workspace_id = ws.split()[0]
            break
    for ws in workspaces:
        if '*' in ws:
            current_screen, _ = ws.split()[-1].split('_')
            break
    if screen != current_screen:
        # go to correct screen
        # assumes there are only two screens
        subprocess.run(['xdotool', 'key', 'alt+Left'], check=True)
    # switch to desktop
    subprocess.run(['wmctrl', '-s', workspace_id], check=True)
