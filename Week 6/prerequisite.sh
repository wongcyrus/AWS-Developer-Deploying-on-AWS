#!/bin/bash
cd "../Week 5"
sh "prerequisite.sh"
cd "Exercise 5.1"
sh "deployment.sh"
cd "../Exercise 5.2"
sh "lab.sh"
echo "Wait for Stack Update!"
sleep 300
sh "install_cloudwatch.sh"