#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t -c"

# function to get information about an element from the database
GET_INFO() {
  ELEMENT_INFO=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
                        FROM elements AS e 
                          INNER JOIN properties AS p USING(atomic_number)
                          INNER JOIN types AS t USING(type_id)
                          WHERE e.atomic_number = $1 OR e.symbol = '$1' OR e.name = '$1';")
  echo $ELEMENT_INFO
}

# If the script is run without any argument, message the user and exit
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # get info from database
  GET_INFO $1
fi
