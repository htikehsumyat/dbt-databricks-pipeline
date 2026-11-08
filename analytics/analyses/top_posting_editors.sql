SELECT
    company_name,
    COUNT(DISTINCT job_id) AS jobs_changed
FROM {{ ref('job_postings_snapshot') }}
WHERE dbt_valid_to IS NOT NULL
GROUP BY company_name
ORDER BY jobs_changed DESC
LIMIT 10