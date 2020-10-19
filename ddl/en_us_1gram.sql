[
    {
        "name": "word",
        "type": "STRING",
        "mode": "REQUIRED"
    },
    {
        "name": "term_frequency",
        "type": "INTEGER",
        "mode": "REQUIRED"
    },
    {
        "name": "term_rank",
        "type": "INTEGER",
        "mode": "REQUIRED"
    },
    {
        "name": "document_frequency",
        "type": "INTEGER",
        "mode": "REQUIRED"
    },
    {
        "name": "document_rank",
        "type": "INTEGER",
        "mode": "REQUIRED"
    },
    {
        "name": "year",
        "type": "RECORD",
        "fields": [
            {
                "name": "year",
                "type": "INTEGER",
                "mode": "REQUIRED"
            },
            {
                "name": "term_frequency",
                "type": "INTEGER",
                "mode": "REQUIRED"
            },
            {
                "name": "term_rank",
                "type": "INTEGER",
                "mode": "REQUIRED"
            },
            {
                "name": "document_frequency",
                "type": "INTEGER",
                "mode": "REQUIRED"
            },
            {
                "name": "document_rank",
                "type": "INTEGER",
                "mode": "REQUIRED"
            }
        ],
        "mode": "REQUIRED"
    }
]
