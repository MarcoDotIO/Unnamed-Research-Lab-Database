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

create table spaces (
    space_id int not null auto_increment,
    space_name varchar(100) not null,
    reservable bool not null,
    primary key (space_id)
);

create table reservations (
    res_id int not null auto_increment,
    user_id int not null,
    space_id int not null,
    start_time datetime not null,
    end_time datetime not null,
    primary key (res_id),
    foreign key (user_id) references users(user_id),
    foreign key (space_id) references spaces(space_id)
);

create table items (
    item_id int not null auto_increment,
    item_name varchar(100) not null,
    loanable boolean not null,
    home_id int,
    primary key (item_id),
    foreign key (home_id) references spaces(space_id)
);

create table checkouts (
    checkout_id int not null auto_increment,
    item_id int not null,
    user_id int not null,
    checkout_time datetime not null,
    due_time datetime not null,
    active boolean not null,
    primary key (checkout_id),
    foreign key (item_id) references items(item_id),
    foreign key (user_id) references users(user_id)
);

--create view users_extra as
    