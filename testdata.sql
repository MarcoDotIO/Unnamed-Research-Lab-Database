insert into users (full_name, username, password_hash, perm_level) values
(
    'John Doe',
    'jdoe2',
    '827ccb0eea8a706c4c34a16891f84e7b',
    'admin'
),
(
    'Kim Jun-su',
    'kjunsu9',
    '20fa6bb5b5a6edf2c957f62e56711cd5',
    'admin'
),
(
    'Billy Bob',
    'bbob5',
    '32e3dd9f5ad6bcdd2ff6992dedf07696',
    'standard'
),
(
    'Marco Polo',
    'mpolo4',
    '4552c736773d3f92eae1b4f6cad600b7',
    'standard'
),
(
    'Raymond Forta',
    'rforta7',
    '5580c0b7075b8e2cc447e2388d8c0fd7',
    'standard'
);

insert into spaces (space_id, space_name, reservable) values
(
  123,
  'Main-Lab-123',
  true
),
(
  124,
  'Secondary-Lab-124',
  true
),
(
  125,
  'Class-Lab-125',
  true
);



insert into projects (project_name, start_date, end_date, active) values
(
    'Project W',
    date('2020-01-04'),
    date('2020-02-23'),
    0
),
(
    'Project X',
    date('2020-01-01'),
    date('2020-12-31'),
    1
),
(
    'Project Y',
    date('2020-05-01'),
    date('2020-10-31'),
    1
),
(
    'Project Z',
    date('2020-06-04'),
    date('2020-11-23'),
    1
);

insert into working_on (user_id, project_id) values
(3, 2), (4,3), (5,4), (1,2), (2,3);

insert into reservations (res_id, user_id, space_id, start_time, end_time) values
(
  42,
  2,
  123,
  '2020-04-29',
  '2020-04-30'
);

insert into items (item_id, item_name, loanable, home_id) values
(
  2345,
  'Intel Realsense D435',
  true,
  123
),
(
  2346,
  'Oculus Rift Headset',
  true,
  123
),
(
  2347,
  'MSI Gaming Laptop',
  false,
  123
),
(
  2348,
  'Arduino Kit',
  true,
  123
),
(
  2349,
  'Soldering Kit',
  true,
  123
),
(
  2350,
  'Desktop PC',
  false,
  123
);

insert into checkouts (checkout_id, item_id, user_id, checkout_time, due_time, active) values
(
  3546,
  2345,
  3,
  '2020-05-02',
  '2020-05-04',
  true
),
(
  3547,
  2346,
  5,
  '2020-05-02',
  '2020-05-10',
  true
);
