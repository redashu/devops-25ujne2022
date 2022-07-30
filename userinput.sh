#!/usr/bin/bash

echo "please enter any_command : "
read input_command 

echo "you have entered $input_command"
echo "please wait command is about to execute "
sleep 1
$input_command
