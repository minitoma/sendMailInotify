#!/bin/sh

inotifywait -mqr -e close_write "/home/tcalatayud/sendMailInotify/dossier" | while read FILE 
do
echo $FILE
BEGIN=$(echo $FILE | cut -d' ' -f 1)
END=$(echo $FILE | cut -d' ' -f 3)
echo $BEGIN
echo $END

PATHFILE=$BEGIN$END

echo $PATHFILE

echo "Bonjour" | mailx -a $PATHFILE -S from="t.calatayud@maine-et-loire.fr" -S smtp=smtp://smtp.cg49.fr -s "test" t.calatayud@maine-et-loire.fr
rm $PATHFILE

done
