PROJECT=gcp-pdp-words-dev
DATASET=words
GCS="gs://books/ngrams/books/googlebooks-"
CSV="gs://gcp-pdp-words-dev/"

#1grams
for PREFIX in 0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z; do
(for CORPUS in chi-sim eng eng-fiction eng-gb eng-us fre ger heb ita rus spa; do 
export TABLE="raw_${CORPUS//-/_}_1gram"
echo "echo $CORPUS $PREFIX $TABLE"
echo "bq load --quote='' --field_delimiter=tab --source_format=CSV --project_id=$PROJECT $DATASET.$TABLE '$GCS$CORPUS-all-1gram-20120701-$PREFIX.gz' ddl/raw.json";
done) | parallel -j 5 ;
done

#[2345]grams
for N in 2 3 4 5; do

for PREFIXN in 0 1 2 3 4 5 6 7 8 9; do
(for CORPUS in chi-sim eng eng-fiction eng-gb eng-us fre ger heb ita rus spa; do 
export TABLE="raw_${CORPUS//-/_}_${N}gram"
echo "echo $CORPUS $PREFIXN $TABLE"
echo "bq load --quote='' --field_delimiter=tab --source_format=CSV --project_id=$PROJECT $DATASET.$TABLE '$CSV$CORPUS-all-$N-$PREFIXN.csv' ddl/raw.json";
done) | parallel -j 5 ;
done

for PREFIX0 in 0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z; do
for PREFIX1 in _ 0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z; do
(for CORPUS in chi-sim eng eng-fiction eng-gb eng-us fre ger heb ita rus spa; do 
export TABLE="raw_${CORPUS//-/_}_${N}gram"
echo "echo $CORPUS $PREFIX0$PREFIX1 $TABLE"
echo "bq load --quote='' --field_delimiter=tab --source_format=CSV --project_id=$PROJECT $DATASET.$TABLE '$CSV$CORPUS-all-$N-$PREFIX0$PREFIX1.csv' ddl/raw.json";
done) | parallel -j 5 ;
done;
done;

done
