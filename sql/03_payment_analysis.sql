-- Credit Risk & Portfolio Analysis
-- Bill amounts, payments and credit limits
-- Comparison of Default vs No Default
-- Source: UCI Default of Credit Card Clients
-- Database: SQLite

SELECT
	"default payment next month" AS default_status,
	COUNT(*) AS total_clients,

	ROUND(AVG(Bill_AMT1), 2) AS avg_bill,
	ROUND(AVG(PAY_AMT1), 2) AS avg_payment,
	ROUND(AVG(LIMIT_BAL), 2) AS avg_credit_bill


FROM credit_clients_raw

GROUP BY "default payment next month"
ORDER BY default_status;


SELECT
	"default payment next month" AS default_status,
	COUNT(*) AS total_clients,
	ROUND(AVG(Bill_AMT1), 2) AS avg_bill,
	ROUND(AVG(Pay_AMT1), 2) AS avg_payment,
	ROUND(
		100.0 * SUM(PAY_AMT1) / NULLIF(SUM(Bill_AMT1), 0 ),
		2
		) AS payment_to_bil_ratio

FROM credit_clients_raw
WHERE BILL_AMT1 > 0
GROUP BY "default payment next month"
ORDER BY default_status;





