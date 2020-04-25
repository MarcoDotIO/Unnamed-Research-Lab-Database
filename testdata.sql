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
);

insert into projects (project_name, start_date, end_date, active) values
(
    'Project X',
    date('2020-01-01'),
    date('2020-12-31'),
    1
);

insert into working_on (user_id, project_id) values
(2, 1);