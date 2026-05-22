/*

**Question: What are the most in-demand skills for data engineers?**

- Identify the top 10 in-demand skills for data engineers
- Focus on remote job postings
- **Why?**
    - Retrieves the top 10 skills with the highest demand in the remote job market, providing insights into the most valuable skills for data engineers seeking remote work
*/
/* added comment to test git */
SELECT
  s.skills,
  COUNT(f.job_id) AS demand_count
FROM
  job_postings_fact f
INNER JOIN 
  skills_job_dim sj on f.job_id = sj.job_id
INNER JOIN 
  skills_dim s on s.skill_id = sj.skill_id
WHERE
  f.job_work_from_home = TRUE
AND
  f.job_title_short = 'Data Engineer'
GROUP BY 
  s.skills
ORDER BY 
  demand_count DESC
LIMIT 10;

/*
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
*/