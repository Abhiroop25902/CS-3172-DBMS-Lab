create table item_tr(
    item_id numeric(10) primary key,
    quantity numeric(5)
);

create table item_mstr(
    item_id numeric(10) primary key references item_tr(item_id) on delete cascade,
    quantity numeric(5)
);
select * from item_tr;
select * from item_mstr;

create or replace function processEdit()
    returns trigger
    language plpgsql as $$
        begin
            if(tg_op = 'INSERT') then --capitalization necessary here
                insert into item_mstr select new.*;
            elsif(tg_op= 'UPDATE') then --capitalization necessary here
                update item_mstr set quantity = new.quantity where item_id = new.item_id;
            end if;

            return null; -- use of trigger return is valid on before trigger only
        end;
    $$;

create trigger updateInsertMSTR
    after insert or update
    on item_tr
    for each row
    execute function processEdit();

select * from item_tr order by item_id;
select * from item_mstr order by item_id;

insert into item_tr values (10001, 10);
insert into item_tr values (10002, 9);
insert into item_tr values (10003, 8);

update item_tr 
set quantity = quantity - 5
where item_id = 10001;

select * from item_tr order by item_id;
select * from item_mstr order by item_id;


drop table item_mstr;
drop table item_tr;


