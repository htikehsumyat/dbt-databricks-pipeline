SELECT
    job_title,
    company_name,
    MIN(salary_max) AS lowest_posted,
    MAX(salary_max) AS highest_posted,
    MAX(salary_max) - MIN(salary_max) AS salary_swing
FROM {{ ref('job_postings_snapshot') }}
WHERE salary_currency = 'USD'
GROUP BY job_id, job_title, company_name  -- per-job grain; title + company for display
ORDER BY salary_swing DESC
LIMIT 10