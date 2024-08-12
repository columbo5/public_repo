#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

ABORT_NO_ELEMENT_FOUND() {
  echo "I could not find that element in the database."
  exit
}


if [[ ! $1 ]]
then
  echo Please provide an element as an argument.
  exit
fi

# check input for type and retreive element info
if [[ $1 =~ ^[0-9]$ ]]
then
  DB_INFO_WHEN_INPUT_IS_NUMBER=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements left join properties using(atomic_number) left join types using(type_id) where atomic_number=$1;")
else
  DB_INFO_WHEN_INPUT_IS_SYMBOL=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements left join properties using(atomic_number) left join types using(type_id)  where symbol='$1';")
  DB_INFO_WHEN_INPUT_IS_NAME=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements left join properties using(atomic_number) left join types using(type_id) where name='$1';")
fi

if [[ ! -z $DB_INFO_WHEN_INPUT_IS_NUMBER ]]  # input was number
then
  echo $DB_INFO_WHEN_INPUT_IS_NUMBER | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
elif [[ ! -z $DB_INFO_WHEN_INPUT_IS_SYMBOL ]]  # input was symbol
then
  echo $DB_INFO_WHEN_INPUT_IS_SYMBOL | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
elif [[ ! -z $DB_INFO_WHEN_INPUT_IS_NAME ]]  # input was symbol
then
  echo "$DB_INFO_WHEN_INPUT_IS_NAME" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
else
  ABORT_NO_ELEMENT_FOUND
fi

