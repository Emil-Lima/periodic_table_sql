#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t -c"

# If the script is run without any argument, message the user and exit
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
fi
