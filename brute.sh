#!/bin/bash

target=$1
wordlist=$2
useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0"

for word in $(cat $wordlist)
do
	statuscode=$(curl -s -o /dev/null -H "User-Agent: $userAgent" -w "%{http_code}" $target/$word/)

	if [ "$statuscode" == "200" ]
	then
		echo diretorio encontrado $word : $target/$word/
	elif [ "$statuscode" == "404" ]	
	then
		x=none
	else
		echo "codigo diferente de 200 e 404"
	fi

done

