#!/bin/bash
git branch && git status && git add --all && git commit -m "$1." && git push origin "$2" && git status
