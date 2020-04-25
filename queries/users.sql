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