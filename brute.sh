#!/bin/bash

target=$1
word_list=$2
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0"

for word in $(cat $word_list)
do
	status_code_directory=$(curl -s -o /dev/null -H "User-Agent: $user_agent" -w "%{http_code}" $target/$word/)
	status_code_file=$(curl -s -o /dev/null -H "User-Agent: $user_agent" -w "%{http_code}" $target/$word)


	if [ "$status_code_derectory" == "200" ]
	then
		echo "diretorio encontrado $word : $target/$word/"

	elif [ "$status_code_file" == "200" ]
	then
		echo "narquivo encontrado $word : $target/$word"
		
	elif [ "$status_code_file" == "404" ]	
	then
		x=none

	elif [ "$status_code_directory" == "404" ]	
	then
		x=none
	else
		echo "codigo diferente de 200 e 404"
	fi

done

