#!/usr/bin/bash

# Push git repositories  using PAT
# April 4 2022
# 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

PAT='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'

git push https://${PAT}@github.com/halnguyen/${1}.git
