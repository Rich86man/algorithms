#!/usr/bin/env bash

mkdir leetcode
leetcode submission -x -a -o ./leetcode
rm ./leetcode/*.notac.*
rename 's/\.\d+\.ac\.*/\.ac\./' ./leetcode/*.ac.*
mv ./leetcode/* ./
rm -rf leetcode