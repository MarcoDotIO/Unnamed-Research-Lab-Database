insert into users (full_name, username, password_hash, perm_level) values (
    'John Doe',
    'admin',
    -- hash for 12345
    '$argon2id$v=19$m=102400,t=2,p=8$USpFSElJaY2xdi5lzHlPqQ$7Mz5qLoT0Wvhci/dTKfa2A',
    'admin'
);
