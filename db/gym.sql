DROP TABLE sessions;
DROP TABLE instructors;
DROP TABLE members;

CREATE TABLE instructors
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  activity VARCHAR(255)
);

CREATE TABLE members
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  age INT2
);

CREATE TABLE sessions
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  -- date time
  member_id INT8 references members(id),
  instructor_id INT8 references instructors(id)
);
