#!/bin/bash
TOKEN=$2
NOHUPFILE="nohup.out"
LOGFILE="tcp.ngrok.log"

PID=$(ps | grep ngrok | grep -v grep | head -n 1 | awk '{print $1}')
if [ "$1" == "pid" ]; then
    echo "$PID"
    exit 0
elif [ "$1" == "ssh" ]; then
    if test -f "$LOGFILE"; then
        echo "Old instance running"
    else
        nohup ./ngrok tcp 3389 --log="$LOGFILE" --authtoken=$TOKEN &
        echo "Wait few seconds to establish connection."
    fi 
elif [ "$1" == "rdp" ]; then 
    if test -f "$LOGFILE"; then
        echo "Old instance running"
    else
        nohup ./ngrok tcp 3389 --log="$LOGFILE" --authtoken=$TOKEN &
        echo "Wait few seconds to establish connection."
    fi 
elif [ "$1" == "stop" ]; then
    if [ -z "$PID" ]; then
        echo "Service stopped."
    else
        echo "Killing $PID"
        kill -9 $PID
    fi
else
    echo "Command not supported."
    exit 0
fi

PID=$(ps | grep ngrok | grep -v grep | head -n 1 | awk '{print $1}')
if [ -z "$PID" ]; then
    if test -f "$NOHUPFILE"; then
        echo "Attempt delete $NOHUPFILE"
        rm $NOHUPFILE
    fi 

    if test -f "$LOGFILE"; then
        echo "Attempt delete $LOGFILE"
        rm $LOGFILE
        echo "Service stopped."
    fi
elif test -f "$LOGFILE"; then 
    echo "Service running: $PID"   
    tail $LOGFILE | grep 'url=' | awk -F'url=' '{print $2}'
fi
