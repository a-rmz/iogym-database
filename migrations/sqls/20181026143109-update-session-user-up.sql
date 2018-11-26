ALTER TABLE users
ALTER COLUMN rfid_code TYPE VARCHAR(8);

ALTER TABLE sessions
-- Remove the FK constraint
DROP CONSTRAINT sessions_user_id_fkey,
-- Drop the FK column
DROP COLUMN user_id,
-- Add the new column
ADD COLUMN user_rfid_code VARCHAR(8) REFERENCES users (rfid_code) ON DELETE CASCADE NOT NULL;
