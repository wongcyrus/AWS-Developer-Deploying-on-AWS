#!/bin/bash
cd "../Week 1"
sh "prerequisite.sh"
cd "Exercise 1.1"
sh "deployment.sh"
sh "setup_mysql.sh"
cd "../Exercise 1.2"
sh "lab.sh"
sh "deployment.sh"
