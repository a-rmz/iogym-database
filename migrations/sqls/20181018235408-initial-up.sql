CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
  user_id     uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
  rfid_code   VARCHAR(4),
  first_name  VARCHAR NOT NULL,
  last_name   VARCHAR NOT NULL,
  email       VARCHAR,
  birthday    DATE
);

CREATE TABLE gyms (
  gym_id  uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
  name    VARCHAR NOT NULL,
  address VARCHAR NOT NULL
);

CREATE TABLE user_gym (
  user_id   uuid REFERENCES users (user_id) ON UPDATE CASCADE,
  gym_id    uuid REFERENCES gyms (gym_id) ON UPDATE CASCADE ON DELETE CASCADE,
  is_admin  BOOLEAN NOT NULL DEFAULT false,
  CONSTRAINT user_gym_pkey PRIMARY KEY (user_id, gym_id)
);

CREATE TABLE device_types (
  device_type_id  uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
  name            VARCHAR NOT NULL,
  units           VARCHAR NOT NULL
);

CREATE TABLE devices (
  device_id       uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
  name            VARCHAR NOT NULL,
  gym_id          uuid REFERENCES gyms (gym_id) ON DELETE CASCADE NOT NULL ,
  device_type_id  uuid REFERENCES device_types (device_type_id) NOT NULL
);

CREATE TABLE sessions (
  session_id  uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
  duration    FLOAT,
  name        VARCHAR,
  date        DATE DEFAULT CURRENT_DATE,
  user_id     uuid REFERENCES users (user_id) ON DELETE CASCADE NOT NULL,
  device_id   uuid REFERENCES devices (device_id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE challenges (
  challenge_id    uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
  name            VARCHAR NOT NULL,
  description     VARCHAR,
  goal            VARCHAR NOT NULL,
  start_date      TIMESTAMP NOT NULL,
  end_date        TIMESTAMP NOT NULL,
  device_type_id  uuid REFERENCES device_types (device_type_id)
);

CREATE TABLE user_challenge (
  user_id       uuid REFERENCES users (user_id) ON UPDATE CASCADE ON DELETE CASCADE,
  challenge_id  uuid REFERENCES challenges (challenge_id) ON UPDATE CASCADE ON DELETE CASCADE,
  is_owner  BOOLEAN NOT NULL DEFAULT false,
  CONSTRAINT user_challenge_pkey PRIMARY KEY (user_id, challenge_id)
);
