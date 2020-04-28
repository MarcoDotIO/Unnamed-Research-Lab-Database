-- :name get_item_by_id :one
select * from items where item_id = :item_id;