USE action;
-- Question 
-- Does attendance decline as the courses progress?

SELECT 
DATE_FORMAT(session_date, '%Y-%M') AS month,
ROUND(
100 * SUM(status IN('Present', 'Late')) /COUNT(*), 1
)
AS attendance_rate,
COUNT(*) AS total_sessions
FROM attendance
WHERE status <> 'Not Recorded'
GROUP BY month;

-- Result
-- Attendance starts high at the begining fo the program
-- And declines as the courses progress.
