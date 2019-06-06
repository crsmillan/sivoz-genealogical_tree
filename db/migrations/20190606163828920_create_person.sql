-- +micrate Up
CREATE TABLE people (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  age INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS people;
