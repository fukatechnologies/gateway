#!/bin/bash
CUR_VER="0"
GEN_FILE=run.sh
SCRIPT_LOCATION="${BASH_SOURCE[@]}"
AUTO_UPDATE_URL='https://raw.githubusercontent.com/fukatechnologies/gateway/master/autoupdate.sh'

function autoupdater()
{
    TMP_FILE=$(mktemp -p "" "XXXXX.sh")
    curl -s -L "$AUTO_UPDATE_URL" > "$TMP_FILE"
    NEW_VER=$(grep "^VERSION" "$TMP_FILE" | awk -F'[="]' '{print $3}')
    if [ "$CUR_VER" \< "$NEW_VER" ]
    then
        printf "Updating from \e[31;1m%s\e[0m -> \e[32;1m%s\e[0m\n" "$CUR_VER" "$NEW_VER"

		ALT_FILE=$(readlink -f "$SCRIPT_LOCATION")
        echo "cp \"$TMP_FILE\" \"$ALT_FILE\"" > $GEN_FILE
        echo "rm -f \"$TMP_FILE\"" >> $GEN_FILE
        echo "echo Running script again: `basename ${BASH_SOURCE[@]}` $@" >> $GEN_FILE
        echo "exec \"$ALT_FILE\" \"$@\"" >> $GEN_FILE

        chmod +x $GEN_FILE
        chmod +x "$TMP_FILE"
        exec $GEN_FILE
    else
        rm -f "$TMP_FILE"
    fi
}

rm -f $GEN_FILE
echo "Checking..."
autoupdater "$@"
echo "$@"
echo "Update ended."
