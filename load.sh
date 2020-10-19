PROJECT=xxx
DATASET=words
BUCKET="gs://books/ngrams/books"
CORPUS="eng-all"
TABLE="${CORPUS//-/_}"
(for i in 0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z; do 
echo "bq load --quote='' --field_delimiter=tab --source_format=CSV --project_id=$PROJECT $DATASET.$TABLE '$BUCKET/googlebooks-$CORPUS-1gram-20120701-$i.gz'";
done) | parallel -j 10 
