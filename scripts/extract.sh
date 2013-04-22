DATADIR=$1
DATE=`ls $DATADIR/idwiki | tail -2 | head -n 1`

for lang in "ja" "ar" "ca" "cs" "bg" "ca" "cs" "de" "el" "es" "fr" "hu" "it" "ko" "pl" "pt" "ru" "sl" "tr" "en"
do
   ../run ProcessInterLanguageLinks $DATADIR interlanguage-links-temp.txt.gz -${lang}-id .nt.gz en ${lang},id
done


for FILE in `ls $DATADIR/idwiki/${DATE}/*interlanguage-links-same-as*`
do
   gzip -cd $FILE > ${FILE}.same
done

cat $DATADIR/idwiki/${DATE}/*.same > $DATADIR/idwiki/${DATE}/idwiki-${DATE}-interlanguage-links-same-as.nt
gzip -c $DATADIR/idwiki/${DATE}/idwiki-${DATE}-interlanguage-links-same-as.nt > $DATADIR/idwiki/${DATE}/idwiki-${DATE}-interlanguage-links-same-as.nt.gz

for FILE in `ls $DATADIR/idwiki/${DATE}/*interlanguage-links-see-also*`
do
   gzip -cd $FILE > ${FILE}.see
done

cat $DATADIR/idwiki/${DATE}/*.see > $DATADIR/idwiki/${DATE}/idwiki-${DATE}-interlanguage-links-see-also.nt
gzip -c $DATADIR/idwiki/${DATE}/idwiki-${DATE}-interlanguage-links-see-also.nt > $DATADIR/idwiki/${DATE}/idwiki-${DATE}-interlanguage-links-see-also.nt.gz


rm $DATADIR/idwiki/${DATE}/*.same
rm $DATADIR/idwiki/${DATE}/*interlanguage-links-same-as-??-id.nt.gz

rm $DATADIR/idwiki/${DATE}/*.see
rm $DATADIR/idwiki/${DATE}/*interlanguage-links-see-also-??-id.nt.gz
