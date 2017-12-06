/* Show all categories and their parents */
SELECT a.name AS "Category Name", b.name AS "Parent Name" FROM category a, category b WHERE (a.parent = b.id);

/** List all offers from providers in category */
SELECT account.email, provider.name, offer.title, offer.description  FROM offer 
inner join provider on offer.fk_provider=provider.id 
inner join account on provider.fk_account=account.id
where offer.fk_category = (SELECT id from category where name='Maths Grinds');

/* List all of the jobs in some category */
select account.first_name as "Customer Name", provider.name as "Provider Name", category.name as "Category", job.start_date, job.status from job 
inner join account on account.id=job.fk_account
inner join provider on provider.id=job.fk_provider
inner join category on (category.id=job.fk_category) and (job.fk_category=(select id from category where name='Maths Grinds'));

/* Get all reviews for a certain provider */
select category.name as "Category", account.first_name as "Reviewer", review.rating, review.description from review
inner join job on (job.id=review.fk_job) and job.fk_provider=(select id from provider where name='John''s Music Lessons')
inner join account on account.id=job.fk_account
inner join category on job.fk_category=category.id;

/* Get all portfolio entries for a certain provider */
select portfolio_entry.title, portfolio_entry.description, category.name from portfolio_entry
inner join job on job.id=portfolio_entry.fk_job and job.fk_provider=(select id from provider where name='John''s Music Lessons')
inner join category on category.id=job.fk_category;

/*
select provider.fk_account, provider_category.fk_provider, provider_category.fk_category from provider_category
inner join provider on provider.fk_account = 1
inner join provider_category on provider_category.fk_provider = provider.id;
 */

/* Checks if account already has a provider in a certain category */
select count(*) from provider_category where provider_category.fk_provider in (select id from provider where provider.fk_account = 1) 
and provider_category.fk_category = 4;


/** INNER join providers and accounts -> only returns rows for entries who are BOTH PROVIDERS AND ACCOUNTS **/
SELECT provider.name, provider.overall_score, account.first_name  FROM account 
inner join provider on account.id=provider.fk_account;

/** LEFT join providers and accounts -> returns ALL rows from accounts (includes customers!) and their provider info if applicable **/
SELECT account.first_name, provider.name, provider.overall_score  FROM account 
left join provider on account.id=provider.fk_account;


