#!/bin/bash
CUR_VER="0.0.0.1"
GEN_FILE=run.sh
SCRIPT_LOCATION="${BASH_SOURCE[@]}"
AUTO_UPDATE_URL='https://raw.githubusercontent.com/fukatechnologies/gateway/master/autoupdate.sh'

function autoupdater()
{
    RANDOM_FILE=$(mktemp -p "" "XXXXX.sh")
    curl -s -L "$AUTO_UPDATE_URL" > "$RANDOM_FILE"
    NEW_VER=$(grep "^CUR_VER" "$RANDOM_FILE" | awk -F'[="]' '{print $3}')
    if [ "$CUR_VER" \< "$NEW_VER" ]
    then
        printf "Updating from \e[31;1m%s\e[0m -> \e[32;1m%s\e[0m\n" "$CUR_VER" "$NEW_VER"

		ALT_FILE=$(readlink -f "$SCRIPT_LOCATION")
        echo "cp \"$RANDOM_FILE\" \"$ALT_FILE\"" > $GEN_FILE
        echo "rm -f \"$RANDOM_FILE\"" >> $GEN_FILE
        echo "echo Attempt re-execution: `basename ${BASH_SOURCE[@]}` $@" >> $GEN_FILE
        echo "exec \"$ALT_FILE\" \"$@\"" >> $GEN_FILE

        chmod +x $GEN_FILE
        chmod +x $RANDOM_FILE
        sh $GEN_FILE
    else
	echo "Up to date."
        rm -f $RANDOM_FILE
    fi
}

rm -f $GEN_FILE
echo "Current version: $CUR_VER"
autoupdater "$@"
echo "$@"
echo "Update ended."
