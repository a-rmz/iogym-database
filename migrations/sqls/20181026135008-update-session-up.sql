ALTER TABLE sessions
DROP COLUMN date,
DROP COLUMN duration,
ADD COLUMN start_time TIMESTAMP,
ADD COLUMN end_time TIMESTAMP;
