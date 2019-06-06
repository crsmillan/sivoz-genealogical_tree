-- +micrate Up
CREATE TABLE children (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  age INT,
  person_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX child_person_id_idx ON children (person_id);

-- +micrate Down
DROP TABLE IF EXISTS children;
