#!/bin/bash
TOKEN=$2
NOHUPFILE="nohup.out"
LOGFILE="tcp.ngrok.log"

PID=$(ps | grep ngrok | grep -v grep | head -n 1 | awk '{print $1}')
if test -f "ngrok"; then
    if [ "$1" == "pid" ]; then
        if [ -z "$PID" ]; then
            echo "No instance"
        else
            echo "$PID"
        fi
        exit 0
    elif [ "$1" == "ssh" ]; then
        if test -f "$LOGFILE"; then
            echo "Service running: $PID"   
            tail $LOGFILE | grep 'url=' | awk -F'url=' '{print $2}'
            exit 0
        else
            nohup ./ngrok tcp 3389 --log="$LOGFILE" --authtoken=$TOKEN &
            echo "Wait few seconds to establish connection."
        fi 
    elif [ "$1" == "rdp" ]; then 
        if test -f "$LOGFILE"; then
            echo "Service running: $PID"   
            tail $LOGFILE | grep 'url=' | awk -F'url=' '{print $2}'
            exit 0
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
else
    if [ "$1" == "download" ]; then
        NGFILE="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip"
        if [ "$2" == "win" ]; then
            NGFILE="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip"
        fi
        
        curl -kL $NGFILE --output ngrok_dl.zip
        unzip ngrok_dl.zip
    fi
fi
