ALTER TABLE sessions
DROP COLUMN end_time,
DROP COLUMN start_time,
ADD COLUMN duration FLOAT,
ADD COLUMN date DATE DEFAULT CURRENT_DATE;
