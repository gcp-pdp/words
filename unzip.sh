PROJECT=gcp-pdp-words-dev
DATASET=words
GCS="gs://books/ngrams/books/googlebooks-"

#unzip N>1

for N in 2 3 4 5; do

for PREFIXN in 0 1 2 3 4 5 6 7 8 9; do
(for CORPUS in chi-sim eng eng-fiction eng-gb eng-us fre ger heb ita rus spa; do 
echo "echo $CORPUS $PREFIXN"
echo "gsutil cat '$GCS$CORPUS-all-${N}gram-20120701-$PREFIXN.gz' | gzip -dc | gsutil cp - gs://gcp-pdp-words-dev/$CORPUS-all-${N}-$PREFIXN.csv"
done) | parallel -j 5 ;
done
for PREFIX0 in 0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z; do
for PREFIX1 in _ 0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z; do
(for CORPUS in chi-sim eng eng-fiction eng-gb eng-us fre ger heb ita rus spa; do 
echo "echo $CORPUS $PREFIX0$PREFIX1"
echo "gsutil cat '$GCS$CORPUS-all-${N}gram-20120701-$PREFIX0$PREFIX1.gz' | gzip -dc | gsutil cp - gs://gcp-pdp-words-dev/$CORPUS-all-${N}-$PREFIX0$PREFIX1.csv"
done) | parallel -j 5 ;
done;
done;

done
