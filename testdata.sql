insert into users (full_name, username, password_hash, perm_level) values
(
    'John Doe',
    'admin',
    -- hash for 12345
    '$argon2id$v=19$m=102400,t=2,p=8$USpFSElJaY2xdi5lzHlPqQ$7Mz5qLoT0Wvhci/dTKfa2A',
    'admin'
),
(
    'Billy Bob',
    'bbob',
    '$argon2id$v=19$m=102400,t=2,p=8$USpFSElJaY2xdi5lzHlPqQ$7Mz5qLoT0Wvhci/dTKfa2A',
    'standard'
),
(
    'Marco Polo',
    'mpolo4',
    '$argon2id$v=19$m=102400,t=2,p=8$USpFSElJaY2xdi5lzHlPqQ$7Mz5qLoT0Wvhci/dTKfa2A',
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
);

insert into working_on (user_id, project_id) values
(2, 1), (3,2), (1,2);

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
  124
),
(
  2347,
  'MSI Gaming Laptop',
  false,
  125
),
(
  2348,
  'Arduino Kit',
  true,
  126
);

insert into checkouts (checkout_id, item_id, user_id, checkout_time, due_time, active) values
(
  3546,
  2345,
  2,
  '2020-05-2',
  '2020-05-4',
  true
);