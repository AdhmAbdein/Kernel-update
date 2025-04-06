#!/bin/bash

currentkernel=$(uname -r)
lastkernel=$(yum check-update kernel | grep -m 1 "kernel" | awk '{print $2}')


if [ "$currentkernel" != "$lastkernel" ]
then

    echo "there is new kernel version-Do you need to update it? y/n"
    select option in y n
    do
        case $option in
                y)
                        sudo yum update
                        sudo yum install kernel
                        echo "kernel version is : $(uname -r)"
                        ;;
                n)
                        echo "as you like but your version now is "$currentkernel""
                        ;;
                *)
                        echo "please enter y / n only"
                        ;;
        esac

    done

else
    echo "NO kernel update and last version is "$lastkernel" "

fi
