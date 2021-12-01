#!/usr/bin/env bash

set -e

if [[ -n $DEBUG ]]; then
  set -x
fi

main() {
  declare -i index=0
  declare -i increases=0
  declare -i previousindex=0

  readarray -t input < ./input

  for line in "${input[@]}"; do

    if [[ $index -eq 0 ]]; then
      index=$(expr $index+1)
      continue
    fi

    previousindex=$(expr ${index}-1)

    if [[ $line -gt ${input[$previousindex]} ]]; then
      increases=$(expr ${increases}+1)
    fi

    index=$(expr ${index}+1)
  done

  echo $increases
}

main $@
