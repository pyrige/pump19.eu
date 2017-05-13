CREATE TABLE IF NOT EXISTS codefall
(
  cid SERIAL PRIMARY KEY,
  description TEXT NOT NULL,
  code TEXT NOT NULL,
  code_type TEXT NOT NULL,
  user_name TEXT NOT NULL,
  claimed BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS gac_history
(
  stream_date DATE NOT NULL,
  game_id INTEGER NOT NULL,
  game_name TEXT NOT NULL
);
