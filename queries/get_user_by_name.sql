-- :name get_user_by_name :one
select * from users where username = :name;