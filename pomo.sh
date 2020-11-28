#!/bin/bash

source pomo.config
source functions.sh

### TODO
###  - change default sound file via flag, prolly needa read name from a config file
###  - add more time options

## Testing
# echo "First arg: $1"
# echo "Second arg: $2"
# echo "Count is $#"


## Read flags - https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/
while getopts ":ht" opt; do
  case ${opt} in
    h ) # process option h
        echo "Pomodoro Timer args: [minutes]"
      ;;
    t ) # process option t
      ;;
    \? ) echo "Usage: cmd [-h] help [-t] time"
      ;;
  esac
done
shift $((OPTIND -1))  # Shift non-flag arguments by number of flags provided by getopts

## Set variables
TIME="${1:-30}"       # Set default value to 30.
NOW="$(date +'%I:%M %p')"  # https://tldp.org/LDP/abs/html/timedate.html

echo "($NOW) Timing for $TIME min"

tickInMinutes "$TIME"

# TIME=$(($TIME*60))   # (()) denotes arithmetic

SOUNDFILE="$ALARMSOUND"
ENDMESSAGE="$DONEMESSAGE"

overwrite "$ENDMESSAGE"

## Do something after sleep
aplay --q "$SOUNDFILE"   # -q suppresses aplay message

