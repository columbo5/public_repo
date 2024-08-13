#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

# check if user exists
DB_READ_USER=$($PSQL "select * from users where name='$USERNAME';")

# if empty, insert in db
if [[ -z $DB_READ_USER ]]
then
  DB_USER_INSERT_RESULT=$($PSQL "insert into users(name) values ('$USERNAME');")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  # get userid
  USER_ID=$($PSQL "select user_id from users where name='$USERNAME';")
else  # user already exists
  # get user_id
  USER_ID=$($PSQL "select user_id from users where name='$USERNAME';")

  # check user record
  GAMES_PLAYED=$($PSQL "select count(*) from games where user_id=$USER_ID;")

  # get best game
  NR_GUESSES=$($PSQL "select min(number_guesses) from games where user_id=$USER_ID;")

  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $NR_GUESSES guesses."

fi

# Guessing loop
echo -e "\nGuess the secret number between 1 and 1000:"
RAND_NUMBER=$(( $RANDOM % 1000 + 1 ))
# echo $RAND_NUMBER

USER_GUESS=0
NR_GUESSES=0

while [[ USER_GUESS != RAND_NUMBER ]]
do
  read USER_GUESS
  (( NR_GUESSES++ ))
  # echo $NR_GUESSES
  # echo $RAND_NUMBER

  if [[ ! $USER_GUESS =~ ^[0-9]*$ ]]  # if not int
  then
    echo -e "\nThat is not an integer, guess again:"
    continue
  fi

  # if guess is too high
  if [[ $USER_GUESS > $RAND_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
    continue
  fi

  # if guess is too high
  if [[ $USER_GUESS < $RAND_NUMBER ]]
  then
    echo -e "\nIt's higher than that, guess again:"
    continue
  fi

  # if guess right
  if [[ $USER_GUESS == $RAND_NUMBER ]]
  then
    echo -e "\nYou guessed it in $NR_GUESSES tries. The secret number was $RAND_NUMBER. Nice job!"
    break
  fi

done


# Log game
INSERT_GAME_RESULT=$($PSQL "insert into games(time_stamp, user_id, number_guesses, number_to_guess) values (now(), $USER_ID, $NR_GUESSES, $RAND_NUMBER);")

