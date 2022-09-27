#!/usr/bin/bash

if [[ $1 == "current" ]]; then
     echo "#[fg=${COLOR_MAIN},bg=${COLOR_ACCENT}] #W "
else
     echo "#[fg=${COLOR_ACCENT},bg=${COLOR_MAIN}] #W "
fi
