-- :name get_item_by_id :one
select * from items_ext where item_id = :item_id;

-- :name find_items :many
select * from items_ext where item_name like :item_name