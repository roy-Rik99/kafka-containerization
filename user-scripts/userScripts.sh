#!/bin/bash

groups=''

read -p 'Username (required) ? ' username
read -sp 'Password (leave black to enter usermod func)? ' password

if [[ $username=='' ]]; then
	printf "\n[%s]\tUsername is empty" "ERROR"
	printf "\n[%s]\tSetting Current USER %s as username\n" "INFO" $(whoami)
	username=$(whoami)
elif [[ $password=='' ]]; then
        printf "\n\t[%s]\tPassword is empty\n" "ERROR"
else
	printf '\n\t[%s]\t%s %s\n' 'INFO' 'Creating sudo user' $username
        #useradd --create-home --shell /bin/bash --password $password --groups sudo $username
fi


read -p "Groups to add USER $username (<Groups-Separated-by-commas>\\<NO>)? " groups

if [[ $groups == "NO" || $groups == "no" || $groups == "" ]]; then
	printf '\n[%s]\tNo groups specified\n' 'INFO'
else

	# Set space as the delimiter
	IFS=','
	#Read the split words into an array based on space delimiter
	read -a group_arr <<< "$groups"
	#Count the groups to add user to
	printf '\n[%s]\tAdding USER %s to %s group(s)!' 'INFO' $username ${#group_arr[*]}

	# Print each value of the array by using the loop
	for group in ${group_arr[@]}
	do
		printf '\n[%s]\tSearching for GROUP %s...\n' 'INFO' $group
		if [[ $(getent group $group) ]]; then
			printf '\n[%s]\tGROUP %s is present in system\n' 'INFO' $group
			printf '\n[%s]\tAdding USER %s to GROUP %s\n' 'INFO' $username $group
			usermod -aG $group $username
		else
			printf '\n[%s]\tGroup %s is not present in system\n' 'ERROR' $group
		fi
	done

fi




