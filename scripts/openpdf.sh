#!/usr/bin/bash

okular $1 2>/dev/null &
disown
