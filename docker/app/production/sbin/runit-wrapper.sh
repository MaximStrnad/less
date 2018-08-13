#!/bin/sh

main() {
	# Dump environment
	export > /env

	trap onterm SIGTERM SIGINT

	echo "Starting runit"
	/sbin/runsvdir-start.sh &
	wait "$!"
}

onterm() {
	echo "Exiting..."
	pkill -SIGHUP runsvdir-start.sh
	exit $?
}

main "$@"