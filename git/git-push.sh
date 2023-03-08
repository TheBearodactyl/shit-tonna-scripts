#!/bin/bash

echo "What repo do you want to push to (URL ending in .git)?"
read -r -p "--> " repo
git remote add origin "$repo"
git push -u origin main

