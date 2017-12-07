create user webapp identified by webapp;
grant insert, select, delete, update on 
account, provider, category, offer, provider_category, job, review, portfolio_entry
to webapp;


-- Allow customers to read from all tables, but only modify job and review tables.
create role customer;

grant select on 
account_restricted, provider, provider_category, offer, category, portfolio_entry
to customer;

grant insert, update, delete on 
job, review
to customer;

-- Allow providers to read from all tables, but only modify job, porfolio_entry and offer tables.
create role providers;

grant select on 
account_restricted, provider, category, provider_category, review
to providers;

grant insert, update, delete on 
job, portfolio_entry, offer
to providers;

-- Allow db manager full access to all tables, but not to create new tables etc
create role db_manager;

grant select, insert, update, delete on 
account, provider, category, provider_category, offer, job, portfolio_entry, review
to db_manager with grant option;