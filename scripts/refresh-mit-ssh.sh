#!/usr/bin/sh

killall -9 sshfs
fusermount -u ~/mit
sshfs jchez@athena.dialup.mit.edu: ~/mit
