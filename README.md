# words

This repo contains scripts to download the [Google Ngram dataset](https://storage.googleapis.com/books/ngrams/books/datasetsv2.html) (v2) and ETL it into BigQuery. We have built it to ETL 1-grams - PRs welcome if you have a use case for `N > 1`.

If you're interested to simply query the data, they're made available [here](https://console.cloud.google.com/...) as part of the [Google Cloud Public Datasets Program](https://cloud.google.com/public-datasets).

# ETL

How this repo is organized.

1. [`load.sh`](load.sh) - this script retrieves Ngram data files from the GCS bucket and loads them into *raw* temp tables using the schema in [`ddl/raw.json`](ddl/raw.json).
2. [`sql/transform.sql`](sql/transform.sql) - this script transforms the *raw* temp tables into those loaded to the BQ PDP tables.
