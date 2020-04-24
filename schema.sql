create table users (
    user_id int not null auto_increment,
    full_name varchar(100) not null,
    username varchar(20) not null,
    password_hash varchar(120) not null,
    perm_level enum('admin', 'standard') not null,
    primary key (user_id)
);
