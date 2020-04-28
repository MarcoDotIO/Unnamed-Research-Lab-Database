-- :name get_user_by_id :one
select * from users where user_id = :user_id;

-- :name get_user_by_name :one
select * from users where username = :username;

-- :name list_users :many
select * from users;

-- :name get_users_by_project_id :many
select * from working_on inner join users
    on working_on.user_id = users.user_id
    and project_id = :project_id;

-- :name update_user_details :affected
update users set username = :username, full_name = :full_name
    where user_id = :user_id;

-- :name update_password :affected
update users set password_hash = :password_hash
    where user_id = :user_id;

-- :name create_user :insert
insert into users (full_name, username, password_hash, perm_level) values
(
    :full_name,
    :username,
    :password_hash,
    'standard'
);
