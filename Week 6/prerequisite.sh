#!/bin/bash
cd "../Week 5"
sh "prerequisite.sh"
cd "Exercise 5.1"
sh "deployment.sh"
cd "../Exercise 5.2"
sh "lab.sh"
echo "Wait for TEST-Stack Update!"
sh "install_cloudwatch.sh"
cd "../Exercise 5.3"
sleep 1m
sh "deployment.sh"