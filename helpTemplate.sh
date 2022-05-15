#!/bin/bash

Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: scriptTemplate [-g|h|t|v|V]"
   echo "options:"
   echo "g     Print the GPL license notification."
   echo "h     Print this Help."
   echo "v     Verbose mode."
   echo "V     Print software version and exit."
   echo
}

Function_two()
{
  printf 'Got -s: "%s"\n' "$OPTARG"
}

# without colon : the program will find any option outside the one indicated in the while illegal (error), plus it will send it to the \? option
# colon : at the beginning means silent error, no illegal action, it will send it to the \? option
# colon : after option means you require argument, error is pushed if no additional argument is passed, plus it will send it to the \? option
# colon : at the beginning and after option will be silent error and only print what is in the : option
# exit 1 Operation not permitted, program exits in that moment
# exit 0 Success, program exits in that moment
# exit program just exits in that moment
# if no exit is provided then the program runs as normal the rest of the code
# option * means any other option not predefined
while getopts ":hHs:" option; do
   case $option in
      h) Help
         exit;;
      H) Help
         exit;;
      s) Function_two
         exit 0;;
      :) printf "missing argument for -%s\n" "$OPTARG" >&2
         exit 1;;
      \?) # incorrect option
         echo "Error: Type -h for valid options"
         exit;;
      *) echo "Unimplemented option: -$OPTARG" >&2;
         exit 1;;
   esac
done

echo "Run program from here if option is correct or no option is given at all"

