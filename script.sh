#!/bin/sh
gnome-terminal --working-directory="$GEDIT_CURRENT_DOCUMENT_DIR" -- bash -c "cat in.txt | python3 '$GEDIT_CURRENT_DOCUMENT_DIR/$GEDIT_CURRENT_DOCUMENT_NAME' > aux.txt;"



sleep 0.3
cat aux.txt

if cmp -s aux.txt out.txt; then
	echo "ACCEPTED"
else
	echo "WRONG ANSWER"
	diff aux.txt out.txt
fi
rm aux.txt
