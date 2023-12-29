#!/usr/bin/env bash


find /home/haln -type d -not -path "*node_modules*" -print 2>&1 | grep -v 'Permission denied' | fzf

