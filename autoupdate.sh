#!/bin/bash
TEMP_FILE=updater.sh
VERSION="0.0.1"
SOURCE_DIR="${BASH_SOURCE[@]}"
AUTO_UPDATE_URL='https://raw.githubusercontent.com/fukatechnologies/gateway/master/autoupdate.sh'

function update()
{
    RANDOM_FILE=$(mktemp -p "" "XXXXX.sh")
    curl -s -L $AUTO_UPDATE_URL > $RANDOM_FILE
	
    NEW_VER=$(grep "^VERSION" "$RANDOM_FILE" | awk -F'[="]' '{print $3}')
    ABS_SCRIPT_PATH=$(readlink -f "$SOURCE_DIR")
    if [ "$NEW_VER" \> "$VERSION" ]
    then
        printf "New version found: \e[31;1m%s\e[0m -> \e[32;1m%s\e[0m\n" "$VERSION" "$NEW_VER"
        echo "cp \"$RANDOM_FILE\" \"$ABS_SCRIPT_PATH\"" > $TEMP_FILE
        echo "rm -f \"$RANDOM_FILE\"" >> $TEMP_FILE
		
        echo "echo Reexecuting: `basename ${BASH_SOURCE[@]}` $@" >> $TEMP_FILE
        echo "exec \"$ABS_SCRIPT_PATH\" \"$@\"" >> $TEMP_FILE

        chmod +x $TEMP_FILE
        chmod +x "$RANDOM_FILE"
		
        exec $TEMP_FILE
    else
        rm -f "$RANDOM_FILE"
    fi
}

rm -f $TEMP_FILE
update $@
echo $@
