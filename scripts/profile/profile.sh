#!/usr/bin/env bash

while :; do echo $(grep 'VmRSS' /proc/$1/status); sleep 1; done
