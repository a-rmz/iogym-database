ALTER TABLE users
ALTER COLUMN rfid_code TYPE VARCHAR(4);

ALTER TABLE sessions
-- Remove the FK constraint
DROP CONSTRAINT sessions_user_rfid_code_fkey,
-- Drop the FK column
DROP COLUMN user_rfid_code,
-- Add the new column
ADD COLUMN user_id uuid REFERENCES users (user_id) ON DELETE CASCADE NOT NULL;
