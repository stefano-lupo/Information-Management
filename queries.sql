/** List all offers from providers in category cleaning */
SELECT account.email, provider.name, offer.title, offer.description  FROM offer 
inner join provider on offer.fk_provider=provider.id 
inner join account on provider.fk_account=account.id
where offer.fk_category = (SELECT id from category where name='Maths Grinds');





/** INNER join providers and accounts -> only returns rows for entries who are BOTH PROVIDERS AND ACCOUNTS **/
SELECT provider.name, provider.overall_score, account.first_name  FROM account 
inner join provider on account.id=provider.fk_account;

/** LEFT join providers and accounts -> returns ALL rows from accounts (includes customers!) and their provider info if applicable **/
SELECT account.first_name, provider.name, provider.overall_score  FROM account 
left join provider on account.id=provider.fk_account;


SELECT a.name AS "Category Name", b.name AS "Parent Name" FROM category a, category b WHERE a.parent = b.id;