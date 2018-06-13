DROP TABLE bookings;
DROP TABLE gymclasses;
DROP TABLE members;

CREATE TABLE gymclasses
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  activity VARCHAR(255)
);

CREATE TABLE members
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  address VARCHAR(255) not null,
  telephone INT8,
  email VARCHAR(255) not null,
  age INT2
);

CREATE TABLE bookings
(
  id SERIAL8 primary key,
  member_id INT8 references members(id) on delete cascade,
  gymclass_id INT8 references gymclasses(id) on delete cascade
);
