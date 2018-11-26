ALTER TABLE user_gym
DROP CONSTRAINT user_gym_user_id_fkey,
ADD CONSTRAINT user_gym_user_id_fkey
FOREIGN KEY (user_id)
REFERENCES users(user_id)
ON UPDATE CASCADE;
