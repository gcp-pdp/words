bq load \
  --quote='' \
  --field_delimiter=tab \
  --source_format=CSV \
  --project_id=$PROJECT \
  $DATASET.$TABLE \
  "gs://books/ngrams/books/googlebooks-eng-all-1gram-20120701-*.gz"
