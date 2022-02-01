#!/bin/bash

clear

start_game() {
  #Liste mit allen Karten im Spiel
  all_cards=('6Rose' '7Rose' '8Rose' '9Rose' '10Rose' 'URose' 'ORose' 'KRose' 'ARose' '6Eichel' '7Eichel' '8Eichel' '9Eichel' '10Eichel' 'UEichel' 'OEichel' 'KEichel' 'AEichel' '6Schelle' '7Schelle' '8Schelle' '9Schelle' '10Schelle' 'USchelle' 'OSchelle' 'KSchelle' 'ASchelle' '6Schilten' '7Schilten' '8Schilten' '9Schilten' '10Schilten' 'USchilten' 'OSchilten' 'KSchilten' 'ASchilten')
  #Karten der Spieler
  player1_cards=()
  player2_cards=()
  player3_cards=()
  player4_cards=()
  number_cards=36
  #Punktezahl der Spieler
  player1_sum=0
  player2_sum=0
  player3_sum=0
  player4_sum=0

  #Allen Spieler Karten geben
  for (( i = 0; i < 9; i++ )); do
    #Random Nummer gesetzt
    random_number=$(( $RANDOM % $number_cards ))
    #Karte von Array geholt
    card="${all_cards[$random_number]}"
    #Anzahl der möglichen Karten - 1
    number_cards="$((number_cards - 1))"
    #Die Karte dem Spieler hinzufügen
    player1_cards+=("$card")
    #Die Karte aus dem Array mit allen Karten löschen
    unset all_cards["${random_number}"]
    #Reformatiert, ansonsten gibt es immernoch alle placeholder (36 Karten)
    all_cards=( "${all_cards[@]}" )
  done
  echo "Player1 Karten:"
  echo "${player1_cards[@]}"
  echo $'\n'

  for (( i = 0; i < 9; i++ )); do
    random_number=$(( $RANDOM % $number_cards ))
    card="${all_cards[$random_number]}"
    number_cards="$((number_cards - 1))"
    player2_cards+=("$card")
    unset all_cards["${random_number}"]
    all_cards=( "${all_cards[@]}" )
  done
  echo "Player2 Karten:"
  echo "${player2_cards[@]}"
  echo $'\n'

  for (( i = 0; i < 9; i++ )); do
    random_number=$(( $RANDOM % $number_cards ))
    card="${all_cards[$random_number]}"
    number_cards="$((number_cards - 1))"
    player3_cards+=("$card")
    unset all_cards["${random_number}"]
    all_cards=( "${all_cards[@]}" )
  done
  echo "Player3 Karten:"
  echo "${player3_cards[@]}"
  echo $'\n'

  #Die restlichen karten sind für den letzten Spieler
  player4_cards=("${all_cards[@]}")
  echo "Player4 Karten:"
  echo "${player4_cards[@]}"
  echo $'\n'

  #Trumpf setzen
  echo "Der Trumpf ist:"
  local res=$(set_trumpf)
  echo $res
  echo $'\n'

  #Wenn man einen Trumpf hat, Punkte zur Summe dazu zählen
  for (( i = 0; i < 9; i++ )); do
    if [[ "${player1_cards[i]}" =~ ^9"${res}"$ ]]; then
      player1_sum=$((player1_sum + 14))
    fi
    if [[ "${player1_cards[i]}" =~ ^10"${res}"$ ]]; then
      player1_sum=$((player1_sum + 10))
    fi
    if [[ "${player1_cards[i]}" =~ ^U"${res}"$ ]]; then
      player1_sum=$((player1_sum + 20))
    fi
    if [[ "${player1_cards[i]}" =~ ^O"${res}"$ ]]; then
      player1_sum=$((player1_sum + 3))
    fi
    if [[ "${player1_cards[i]}" =~ ^K"${res}"$ ]]; then
      player1_sum=$((player1_sum + 4))
    fi
    if [[ "${player1_cards[i]}" =~ ^A"${res}"$ ]]; then
      player1_sum=$((player1_sum + 11))
    fi


    if [[ "${player2_cards[i]}" =~ ^9"${res}"$ ]]; then
      player2_sum=$((player2_sum + 14))
    fi
    if [[ "${player2_cards[i]}" =~ ^10"${res}"$ ]]; then
      player2_sum=$((player2_sum + 10))
    fi
    if [[ "${player2_cards[i]}" =~ ^U"${res}"$ ]]; then
      player2_sum=$((player2_sum + 20))
    fi
    if [[ "${player2_cards[i]}" =~ ^O"${res}"$ ]]; then
      player2_sum=$((player2_sum + 3))
    fi
    if [[ "${player2_cards[i]}" =~ ^K"${res}"$ ]]; then
      player2_sum=$((player2_sum + 4))
    fi
    if [[ "${player2_cards[i]}" =~ ^A"${res}"$ ]]; then
      player2_sum=$((player2_sum + 11))
    fi


    if [[ "${player3_cards[i]}" =~ ^9"${res}"$ ]]; then
      player3_sum=$((player3_sum + 14))
    fi
    if [[ "${player3_cards[i]}" =~ ^10"${res}"$ ]]; then
      player3_sum=$((player3_sum + 10))
    fi
    if [[ "${player3_cards[i]}" =~ ^U"${res}"$ ]]; then
      player3_sum=$((player3_sum + 20))
    fi
    if [[ "${player3_cards[i]}" =~ ^O"${res}"$ ]]; then
      player3_sum=$((player3_sum + 3))
    fi
    if [[ "${player3_cards[i]}" =~ ^K"${res}"$ ]]; then
      player3_sum=$((player3_sum + 4))
    fi
    if [[ "${player3_cards[i]}" =~ ^A"${res}"$ ]]; then
      player3_sum=$((player3_sum + 11))
    fi


    if [[ "${player4_cards[i]}" =~ ^9"${res}"$ ]]; then
      player4_sum=$((player4_sum + 9))
    fi
    if [[ "${player4_cards[i]}" =~ ^10"${res}"$ ]]; then
      player4_sum=$((player4_sum + 10))
    fi
    if [[ "${player4_cards[i]}" =~ ^U"${res}"$ ]]; then
      player4_sum=$((player4_sum + 20))
    fi
    if [[ "${player4_cards[i]}" =~ ^O"${res}"$ ]]; then
      player4_sum=$((player4_sum + 3))
    fi
    if [[ "${player4_cards[i]}" =~ ^K"${res}"$ ]]; then
      player4_sum=$((player4_sum + 4))
    fi
    if [[ "${player4_cards[i]}" =~ ^A"${res}"$ ]]; then
      player4_sum=$((player4_sum + 11))
    fi
  done

  echo "Player1 points:"
  echo "${player1_sum}"
  echo $'\n'
  echo "Player2 points:"
  echo "${player2_sum}"
  echo $'\n'
  echo "Player3 points:"
  echo "${player3_sum}"
  echo $'\n'
  echo "Player4 points:"
  echo "${player4_sum}"

}

set_trumpf() {
  all_colour=('Rose' 'Eichel' 'Schelle' 'Schilten')
  random_number=$(( $RANDOM % 3 ))
  echo "${all_colour["${random_number}"]}"
}

start_game