#!/bin/sh

keys=`redis-cli --scan --pattern '*'`
echo "total: ${#keys[@]} items"

for key in "${keys[@]}"
do
	ttl=`redis-cli ttl $key`
	if [[ $ttl != "(integer) -2" && $ttl != "(integer) -1" ]]; then
		echo "'$key' expires in $ttl sec."
	fi
done