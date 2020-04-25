create table users (
    user_id int not null auto_increment,
    full_name varchar(100) not null,
    username varchar(20) not null,
    password_hash varchar(120) not null,
    perm_level enum('admin', 'standard') not null,
    primary key (user_id)
);

create table projects (
    project_id int not null auto_increment,
    project_name varchar(100) not null,
    start_date date,
    end_date date,
    active bool not null,
    primary key (project_id)
);

create table working_on (
    user_id int not null,
    project_id int not null,
    primary key (user_id, project_id),
    foreign key (user_id) references users(user_id),
    foreign key (project_id) references projects(project_id)
);