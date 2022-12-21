#!/bin/bash

topic=$1

flag=$2

printf "\n[INFO]  Topic Selected :- %s	Flag Selected :- %s\n\n" "$topic" "$flag"

if [[ $topic == "" ]]; then
	mess="No Topic Name specified! Please check with developer for documentation.."
	printf "[ERROR]  %s" "$mess"
else
	if [[ $flag == "--create-topic" ]]; then
		mess="Creating Topic"
		printf "\n[INFO]	%s :- %s...\n\n" "$mess" "$topic"
		docker exec broker kafka-topics --bootstrap-server broker:9092 --create --topic $topic
	elif [[ $flag == "--get-producer-shell" ]]; then
		mess="Getting into Producer Shell for "
		printf "\n[INFO]  %s %s topic...\n\n" "$mess" "$topic"
		docker exec --interactive --tty broker kafka-console-producer --bootstrap-server broker:9092 --topic $topic
	elif [[ $flag == "--get-consumer-shell" ]]; then
		mess="Getting into Consumer Shell for "
		printf "\n[INFO]  %s %s topic...\n\n" "$mess" "$topic"
		docker exec --interactive --tty broker kafka-console-consumer --bootstrap-server broker:9092 --topic $topic --from-beginning
	else
		mess="Wrong Option Selected! Please check with developer for documentation.."
		printf "\n[ERROR]  %s\n\n" "$mess"
	fi
fi
