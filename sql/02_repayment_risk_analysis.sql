-- Credit Risk & Portfolio Analysis
-- Default rate analysis by repayment status
-- Source: UCI Default of Credit Card Clients
-- Database: SQLite

WITH repayment_groups AS (
	SELECT
		CASE
			WHEN PAY_0 <= 0 THEN "No reported delay / Other"
			WHEN PAY_0 = 1 THEN "1 Month delay"
			ELSE "2+ months delay"
		END AS repayment_group,
		"default payment next month" AS default_status
	FROM credit_clients_raw
)

SELECT
	repayment_group,
	COUNT(*) AS total_clients,
	SUM(default_status) AS defaulted_clients,
	ROUND(
		100.0 * SUM(default_status) / COUNT(*),
		2
		) AS default_rate

FROM repayment_groups
GROUP BY repayment_group
ORDER BY
	CASE repayment_group
		WHEN "No reported delay / Other" THEN 1
		WHEN "1 Month delay" THEN 2
		ELSE 3
	END;