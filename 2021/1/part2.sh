#!/usr/bin/env bash

set -e

if [[ -n $DEBUG ]]; then
  set -x
fi

main() {
  declare -i index=0
  declare -i increases=0
  declare -i sum=0
  declare -i previoussum=0
  declare -i index0=0
  declare -i index1=0

  readarray -t input < ./input

  for line in "${input[@]}"; do
    index0=$(expr ${index}+1)
    index1=$(expr ${index}+2)
    if [[ $(expr ${index}+3) -gt ${#input[@]} ]]; then
      continue 2
    fi

    sum=$(expr ${line} + ${input[$index0]} + ${input[$index1]})

    if [[ $index -eq 0 ]]; then
      previoussum=$sum
      index=$(expr ${index}+1)
      continue
    fi

    if [[ $sum -gt $previoussum ]]; then
      increases=$(expr $increases+1)
    fi

    previoussum=${sum}
    index=$(expr ${index}+1)
  done

  echo $increases
}

main $@
