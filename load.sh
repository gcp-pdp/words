PROJECT=gcp-pdp-words-dev
DATASET=words
GCS="gs://books/ngrams/books/googlebooks-"
for PREFIX in 0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z; do
(for CORPUS in chi-sim eng eng-fiction eng-gb eng-us fre ger heb ita rus spa; do 
export TABLE="raw_${CORPUS//-/_}_1gram"
echo "echo $CORPUS $PREFIX $TABLE"
echo "bq load --quote='' --field_delimiter=tab --source_format=CSV --project_id=$PROJECT $DATASET.$TABLE '$GCS$CORPUS-all-1gram-20120701-$PREFIX.gz' ddl/raw.json";
done) | parallel -j 5 ;
done
