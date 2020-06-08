#!/bin/bash

# Ref:
## Link: https://askubuntu.com/questions/821157/print-a-256-color-test-pattern-in-the-terminal
## Author: qeatzy

## Background colors
for((i=16; i<256; i++)); do
    printf "\e[48;5;${i}m%03d" $i;
    printf '\e[0m';
    [ ! $((($i - 15) % 6)) -eq 0 ] && printf ' ' || printf '\n'
done

## Foregroud colors
for i in {0..255}; 
  do printf '\e[38;5;%dm%3d ' $i $i;
  (((i+3) % 18)) || printf '\e[0m\n';
done
