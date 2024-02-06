USE SAMPLEDB
GO


select *
from emp

UPDATE emp
SET last_name = 'Greenbank'
WHERE emp_id = 2;