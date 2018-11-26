CREATE TABLE session_frame (
  session_frame_id  uuid PRIMARY KEY,
  session_id        uuid REFERENCES sessions (session_id) ON UPDATE CASCADE ON DELETE CASCADE,
  type              VARCHAR NOT NULL,
  start_time        TIMESTAMP NOT NULL,
  end_time          TIMESTAMP NOT NULL,
  received          TIMESTAMP DEFAULT NOW(),
  data              FLOAT
);
