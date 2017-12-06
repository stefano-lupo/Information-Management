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




/* Sample for calling 
DECLARE 
  provider number(1) := 1;
  category number(1) := 4;
  ans number(1);
BEGIN 
   ans := is_provider_in_category(provider, category); 
   dbms_output.put_line('Answer: ' || ans); 
END; 
/

*/



