-- :name get_item_by_id :one
select * from items_ext where item_id = :item_id;

-- :name find_items :many
select * from items_ext where item_name like :item_name;

-- :name get_items_by_loanee :many
select * from items_ext where user_id = :user_id;

-- :name return_item :affected
update checkouts set active = false
    where item_id = :item_id and active = 1;

-- :name checkout :insert
insert into checkouts
    (item_id, user_id, checkout_time, due_time, active) values
    (:item_id, :user_id, curtime(), curtime(), 1);

-- :name add_item :insert
insert into items
    (item_id, item_name, loanable, home_id) values
    (:item_id, :item_name, :loanable, :home_id);