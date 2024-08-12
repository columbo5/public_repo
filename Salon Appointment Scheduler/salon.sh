#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  echo -e "\nThis is the main menu. Please choose one of the following services:\n"
  SERVICES_AVAILABLE=$($PSQL "select * from services;")
  echo "$SERVICES_AVAILABLE" | while read SERVICE_ID BAR SERVICE_NAME
  do
    if [[ $SERVICE_ID =~ ^[0-9]*$ ]]
    then
        echo "$SERVICE_ID) $SERVICE_NAME"
    fi
  done

  # pick a service
  read SERVICE_ID_SELECTED

  # check if exists --> send to main
  SERVICE_ID_EXISTS_CHECK=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED;")

  if [[ -z $SERVICE_ID_EXISTS_CHECK ]]
  then
    MAIN_MENU
  else
    # enter phone number
    echo -e "\n Please enter your phone number:"
    read CUSTOMER_PHONE

    # if not exists, ask for name and make a new one
    CHECK_CUSTOMER_PHONE=$($PSQL "select * from customers where phone='$CUSTOMER_PHONE';")

    if [[ -z $CHECK_CUSTOMER_PHONE ]]  # if no phone exists
    then
      # ask for name
      echo -e "\n Please enter your name:"
      read CUSTOMER_NAME

      # add new customer entry in db
      INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone, name) values ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
    fi

    # ask for appointment time
    echo -e "\nWhen would you like to have your appointment?"
    read SERVICE_TIME

    # get customer id and name
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
    CUSTOMER_NAME=$($PSQL "select name from customers where customer_id=$CUSTOMER_ID;")

    # get service info
    SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED;")


    # add appointment to db
    INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id, service_id, time) values ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
    else
      echo "Something went wrong. Please try again from start. "
      MAIN_MENU
    fi
    
  fi

}

MAIN_MENU