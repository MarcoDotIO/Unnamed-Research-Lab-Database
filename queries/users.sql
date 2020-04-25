-- :name get_user_by_id :one
select * from users where user_id = :user_id;

-- :name get_user_by_name :one
select * from users where username = :username;

-- :name list_users :many
select * from users;