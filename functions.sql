/* Setup access to dbms_output.put_line() */
set serveroutput on size 30000;


/* Checks to see if a provider with provider_id is in category category_id */
/* This is used to ensure that the job being created is for a provider who is actually registered in that category */
create or replace function is_provider_in_category(provider_id in number, category_id in number) 
    return number 
    is 
      is_in_category number(3);
begin
  dbms_output.put_line('provider_id: ' || provider_id); 
  dbms_output.put_line('category_id: ' || category_id);

  select count(*) into is_in_category from provider_category where provider_id = provider_category.fk_provider and category_id = provider_category.fk_category;
  return is_in_category;
end;
/

/* Checks to see if this is a leaf category (has no children) */
/* This is used to ensure that providers aren't inserted into categories with children as parent categories are to be vague */
create or replace function num_children_of_category(category_id in number) 
    return number 
    is 
      num_children number(3);
begin
  dbms_output.put_line('category_id: ' || category_id);

  select count(*) into num_children from category where category.parent=category_id;
  return num_children;
end;
/

/* Checks if an account (based on the provider_id) already has a provider in a certain category */
create or replace function account_provider_in_category(category_id in number, provider_id in number) 
    return number 
    is 
      has_provider_in_category number(1);
      account_id number(10);
begin
  dbms_output.put_line('category_id: ' || category_id);
  dbms_output.put_line('provider_id: ' || provider_id);

  select provider.fk_account into account_id from provider where provider.id=provider_id;
  dbms_output.put_line('account_id: ' || account_id);

  select count(*) into has_provider_in_category from provider_category where provider_category.fk_provider in 
    (select id from provider where provider.fk_account = account_id) 
    and provider_category.fk_category = category_id;
  return has_provider_in_category;
end;
/


/* Updates a prioviders category score on getting a review */
/* This function works correctly and can be called using code below */
/* However I had some trouble getting this to run properly inside a trigger that run on an update */
/* of the review table as this function needs to query that same table */
/* This results in issues due to mutability of tables */
create or replace function update_provider_cat_score(job_id in number) 
    return number 
    is 
      has_provider_in_category number(1);
      provider_id number(10);
      category_id number(10);
      new_average number(3);
begin
  dbms_output.put_line('job_id: ' || job_id);

  /* Get relevant provider and category */
  select fk_provider, fk_category into provider_id, category_id from job where id=job_id;

  dbms_output.put_line('provider_id: ' || provider_id);
  dbms_output.put_line('category_id: ' || category_id);

  -- Works
  -- update provider_category set score = 99 where fk_provider=1 and fk_category=4;--provider_id and fk_category=category_id;
  
  select avg(review.rating) into new_average from review where review.fk_job in 
    (select id from job where fk_provider=provider_id and fk_category=category_id);

  dbms_output.put_line('average: ' || new_average); 
  has_provider_in_category := 1;
  return has_provider_in_category;
end;
/


/*
-- Sample for calling 
DECLARE 
  job_id number(10) := 8;
  ans number(1);
BEGIN 
   ans := update_provider_cat_score(job_id); 
   dbms_output.put_line('Answer: ' || ans); 
END; 
/
*/




