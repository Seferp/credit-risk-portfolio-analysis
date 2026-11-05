-- Credit Risk & Portfolio Analysis
-- Analysis of default rates by credit limit segment
-- Source: UCI Default of Credit Card Clients
-- Database: SQLite


WITH credit_segments AS (
	SELECT
		CASE
			WHEN LIMIT_BAL <= 50000 THEN "Very low"
			WHEN LIMIT_BAL <= 100000 THEN "Low"
			WHEN LIMIT_BAL <= 200000 THEN "Medium"
			WHEN LIMIT_BAL <= 500000 THEN "High"
			ElSE "Very high"
		END AS credit_limit_group,
		"default payment next month" AS default_status
	FROM credit_clients_raw
)
SELECT
	credit_limit_group,
	COUNT(*) AS total_clients,
	SUM(default_status) AS defaulted_clients,
	ROUND(
	100.0 * SUM(default_status) / COUNT(*),
	2
	) AS default_rate,
	ROUND(
	100.0 * SUM(default_status) / (SELECT SUM(default_status) FROM credit_segments),
	2
	) AS share_of_defaults

FROM credit_segments
GROUP BY credit_limit_group
ORDER BY
	CASE credit_limit_group
		WHEN "Very low" THEN 1
		WHEN "Low" THEN 2
		WHEN "Medium" THEN 3
		WHEN "High" THEN 4
		ELSE 5
	END;