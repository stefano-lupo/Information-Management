/* Make account's candidate key unique */
alter Table account
add constraint account_candidate_unique UNIQUE (email);

/* Give account trustworthy_score a default value of 50% */
alter table account modify(trustworthy_score default 50) add constraint account_tw_score_range check (trustworthy_score between 0 and 100);



/* Make provider's candidate (and composite) key unique */
alter Table provider
add constraint provider_candidate_unique UNIQUE (name, fk_account);

/* Add fk_account to provider */
alter table provider
add constraint fk_provider_account
  foreign key (fk_account)
  references account(id);

/* Give provider overall_score a default value of 50% */
alter table provider modify(overall_score default 50) add constraint provider_overall_score_range check (overall_score between 0 and 100);



/* Make category's candidate (and composite) key unique */
alter Table category
add constraint category_candidate_unique UNIQUE (name, parent);

/* Add recursive foreign key parent to category */
alter table category
add constraint fk_category_category
  foreign key (parent)
  references category(id);



/* Add fk_provider to offers */
alter table offer
add constraint fk_offer_provider
  foreign key (fk_provider)
  references provider(id);

/* Add fk_category to offer */
alter table offer
add constraint fk_offer_category
  foreign key (fk_category)
  references category(id);

/* Ensure this offers refers to a category the provider actually works in */ 
/* This trigger makes a call to a user defined function */
create or replace trigger is_offer_provider_in_category
before insert or update on offer
for each row
declare 
  is_in_category number(1);
begin
  is_in_category := is_provider_in_category(:new.fk_provider, :new.fk_category);
  if is_in_category = 0 then
    raise_application_error(-20000, 'Cannot create offer as provider ' || :new.fk_provider || ' is not in category ' || :new.fk_category); 
  end if;
end;
/


/* Ensure start date is before end date */
alter table offer
add constraint offer_date_check check(start_date < end_date);



/* Add fk_provider to provider_category */
alter table provider_category
add constraint fk_provider_category_provider
  foreign key (fk_provider)
  references provider(id);

/* Add fk_category_name, fk_category_parent to provider_category */
alter table provider_category
add constraint fk_provider_category_category
  foreign key (fk_category)
  references category(id);

/* Give provider_category a default score of 50% */
alter table provider_category 
modify(score default 50) 
add constraint provider_category_score_range check (score between 0 and 100);

/* Ensure provider categories are leaf categories only */
create or replace trigger is_leaf_category
before insert or update on provider_category
for each row
declare 
  num_children number(1);
begin
  num_children := num_children_of_category(:new.fk_category);
  if num_children > 0 then
    raise_application_error(-20000, 'Providers may only be in categories with no children - ' || :new.fk_category || ' has ' || num_children || ' children'); 
  end if;
end;
/

/* Ensure account doesnt already have a provider in this category */
create or replace trigger account_in_category
before insert on provider_category
for each row
declare 
  is_already_in_category number(1);
begin
  is_already_in_category := account_provider_in_category(:new.fk_category, :new.fk_provider);
  if is_already_in_category > 0 then
    raise_application_error(-20000, 'Account may only have one provider in a category - '); 
  end if;
end;
/





/* Make job's candidate (and composite) key unique */
alter Table job
add constraint job_candidate_unique UNIQUE (fk_account, fk_provider, fk_category, start_date);

/* Add fk_account to job */
alter table job
add constraint fk_job_account
  foreign key (fk_account)
  references account(id);

/* Add fk_provider to job */
alter table job
add constraint fk_job_provider
  foreign key (fk_provider)
  references provider(id);

/* Add fk_category to job */
alter table job
add constraint fk_job_category
  foreign key (fk_category)
  references category(id);

/* Add allowed values for status field */
alter table job 
add constraint job_status_allowed_values check (status IN ('negotiation', 'in-progress', 'finished', 'paid'));

/* Ensure start date is before end date */
alter table job
add constraint job_date_check check(start_date < end_date);



/* Ensure this job refers to a category the provider actually works in */ 
/* This trigger makes a call to a user defined function */
create or replace trigger is_job_provider_in_category
before insert or update on job
for each row
declare 
  is_in_category number(1);
begin
  is_in_category := is_provider_in_category(:new.fk_provider, :new.fk_category);
  if is_in_category = 0 then
    raise_application_error(-20000, 'Cannot create job as provider ' || :new.fk_provider || ' is not in category ' || :new.fk_category); 
  end if;
end;
/




/* Add fk_job to review */
alter table review
add constraint fk_review_job
  foreign key (fk_job)
  references job(id); 

/* Ensure rating is valid vlaue */
alter table review modify(helpfullness_rating default 0) add constraint review_rating_range check (rating between 0 and 100);

/* Update provider's score in given category on new review */ 
/* This does not work due to mutability issues but the function does */

create or replace trigger update_score_review
after insert or update on review
for each row
declare 
  deleteme number(1);
begin
   deleteme := update_provider_cat_score(:new.fk_job);
end;
/
*/


/* Add fk_job to portfolio_entry */
alter table portfolio_entry
add constraint fk_portfolio_entry_job
  foreign key (fk_job)
  references job(id);








