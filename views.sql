-- Create a view for all providers linked to an account and the categories they work in
create view account_providers as 
select account.first_name, account.last_name, provider.name as "Provider Name", category.name as "Category" from provider 
inner join account on account.id=provider.fk_account
inner join provider_category on provider_category.fk_provider=provider.id
inner join category on category.id = provider_category.fk_category;

-- Create a view for all completed jobs
-- Note: any job that has a review is paid as that check is implemented on creation of a review 
create view jobs_completed as
select provider.name as "Provider", category.name as "Category", account.first_name as "Customer", review.rating as "Review Rating", job.start_date, job.status from job
inner join account on account.id = job.fk_account
inner join provider on provider.id = job.fk_provider
inner join category on category.id = job.fk_category
inner join review on review.fk_job = job.id;


-- Create view for jobs in progress
create view jobs_in_progress as
select provider.name as "Provider", category.name as "Category", account.first_name as "Customer", job.start_date, job.status from job
inner join account on account.id = job.fk_account
inner join provider on provider.id = job.fk_provider
inner join category on category.id = job.fk_category
where job.status='in-progress';


-- Create view for getting all categories and their parents (recursive due to hierarchical structure)
create view categories_with_parents as 
select a.name as "Category Name", b.name as "Parent Name" from category a, category b where (a.parent = b.id);


-- Create a view for all offers by category
create view offers_by_category as 
select account.email, provider.name, offer.title, offer.description from offer 
inner join provider on offer.fk_provider=provider.id 
inner join account on provider.fk_account=account.id


-- Create a view for reviews for each provider
create view reviews_by_provider as 
select category.name as "Category", provider.name as "Provider", account.first_name as "Reviewer", review.rating, review.description from review
inner join job on job.id=review.fk_job
inner join provider on provider.id = job.fk_provider
inner join account on account.id=job.fk_account
inner join category on job.fk_category=category.id;

-- Create restricted account table for customers/providers to access
create view account_restricted as 
select account.email, account.first_name, account.last_name, account.trustworthy_score from account;