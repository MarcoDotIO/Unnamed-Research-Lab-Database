-- :name get_project_by_id :one
select * from projects where project_id = :project_id;

-- :name get_active_projects :many
select * from projects where active != 0;

-- :name get_inactive_projects :many
select * from projects where active = 0;
