#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "truncate table games, teams;")"

cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then
    # insert winner to teams
    # winner_in_table=$($PSQL ";")
    winner_in_table=$($PSQL "select team_id from teams where name='$winner';")

    if [[ -z $winner_in_table ]]
    then
      echo "$($PSQL "insert into teams(name) values ('$winner');")"
    fi

    # insert opponent to teams
    opponent_in_table=$($PSQL "select team_id from teams where name='$opponent';")

    if [[ -z $opponent_in_table ]]
    then
      echo "$($PSQL "insert into teams(name) values ('$opponent');")"
    fi

  fi
done

cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then
    # get winner id
    WINNER_ID=$($PSQL "select team_id from teams where name='$winner';")

    # get opponent id
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$opponent';")

    # insert row
    echo "$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values ($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals);")"

  fi
done

