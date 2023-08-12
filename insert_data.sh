#! /bin/bash

# create variable to query the database system
PSQL="psql --username=postgres --dbname=worldcup -t --no-align -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

# reset tables
echo "$($PSQL "TRUNCATE TABLE games, teams ;")"

# loop over games.csv file
cat ./games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
  if [[ $YEAR != year ]]
  then
    # get winner and opponent id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")

    # insert winner if not exists
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER') ;")
      if [[ $INSERT_WINNER_RESULT == 'INSERT 0 1' ]]
      then
        # message and get new winner id
        echo Inserted into teams, $WINNER 
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';") 
      fi
    fi

    # insert opponent if not exists
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT') ;")
      if [[ $INSERT_OPPONENT_RESULT == 'INSERT 0 1' ]]
      then
        # message and get new opponent id
        echo Inserted into teams, $OPPONENT  
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
      fi
    fi

    # insert game if not exists 
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR AND winner_id=$WINNER_ID AND opponent_id=$OPPONENT_ID;")
    if [[ -z $GAME_ID ]]
    then      
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games 
      (year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
      VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")

      if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
      then
        # insert game and get new game id
        echo Insert into games, $YEAR, $WINNER VS $OPPONENT - $ROUND
      fi
    fi
  fi
done