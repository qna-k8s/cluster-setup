#!/bin/bash
max_iterations=20
wait_seconds=6
iterations=0
ok_response="ok"
while true
do
	((iterations++))
	echo "Attempt $iterations"
	sleep $wait_seconds

    var=$(kubectl get --raw='/readyz' 2>&1)
	if [ "$var" = "$ok_response" ]; then
		echo "API Server Up"
		exit 0
	fi

	if [ "$iterations" -ge "$max_iterations" ]; then
		echo "Loop Timeout"
		exit 1
	fi
done
