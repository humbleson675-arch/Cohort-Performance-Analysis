USE action;
-- 01_data_quantity_check is the name of the file saved inside the sql
-- purpose: check underlings records before trusting any analysis built
-- on them.alter

-- Attended data quantity checks
-- Enrollments per status- unknown record
SELECT status, COUNT(*) AS total_enrolments
FROM enrolments
GROUP BY status;

-- 178/565 (31.5%) of enrolments have an unknown status.alter

-- Attendance by status- NOT Recorded
SELECT status, COUNT(*) AS total_attendance
FROM attendance
WHERE status = 'Not Recorded'
GROUP BY status;
-- 1873/58944 (3.2%) of attendance records have a status of 'Not Recorded'

-- Missing contact information for students
SELECT 
     SUM(email ='') AS missing_email,
      SUM(phone ='') AS missing_phone
	FROM students;
    -- 195/260 of students have missing contact information (email or phone).
    
    -- Decission made from these results:
    -- 'Not Recorded' attendance rows are excluded from attendance-rate calculations
    -- Nknow enrollement status is kept as its own category.
    
    