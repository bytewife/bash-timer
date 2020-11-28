## overwrite() Clears previous line in the terminal.
## see https://stackoverflow.com/questions/11283625/overwrite-last-line-on-terminal
overwrite() { echo -e "\r\033[1A\033[0K$@"; }

tickInMinutes(){
  i="$1"

  if [ "$i" = 1 ]; then
    echo "1 min left"
    sleep 1m
  else
    while [ $i -gt 0 ]; do

        if [ "$1" = "$i" ]; then
          echo "$i min left"
        else
          overwrite "$i min left"
        fi
        sleep 1m
        let "i-=1"

    done
  fi
}

