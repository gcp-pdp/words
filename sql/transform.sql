WITH norm AS (
  SELECT LOWER(word) AS word, year, term_frequency, document_frequency
  FROM `allenday-2020-dev.words.eng_all_1gram` 
  WHERE word NOT LIKE '%\\_%'
--   WHERE NOT REGEXP_CONTAINS(word, r'_(ADJ|ADP|ADV|AUX|CONJ|DET|INTJ|NOUN|NUM|PART|PRON|PROPN|PRT|PUNCT|SCONJ|SYM|VERB|X|\.)$')
),
years AS (
  SELECT 
    word, 
    ARRAY_AGG(STRUCT<year INT64, term_frequency INT64, document_frequency INT64>(year, term_frequency, document_frequency) ORDER BY year) AS year,
  FROM norm
  GROUP BY word
),
frequencies AS (
  SELECT 
    word, 
    SUM(term_frequency) AS term_frequency,
    SUM(document_frequency) AS document_frequency
  FROM norm
  GROUP BY word
),
ranks AS (
  SELECT
    word,
    RANK() OVER(ORDER BY term_frequency DESC) AS term_rank,
    RANK() OVER(ORDER BY document_frequency DESC) AS document_rank
  FROM frequencies
)

SELECT 
  frequencies.*, 
  ranks.term_rank,
  ranks.document_rank,
  years.year,
FROM years, frequencies, ranks
WHERE years.word = frequencies.word AND years.word = ranks.word
ORDER BY document_rank
