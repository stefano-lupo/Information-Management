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


alter table job 
add constraint job_status_allowed_values check (status IN ('negotiation', 'in-progress', 'finished', 'paid'));




/* Add fk_job to review */
alter table review
add constraint fk_review_job
  foreign key (fk_job)
  references job(id);

/* Add fk_job to portfolio_entry */
alter table portfolio_entry
add constraint fk_portfolio_entry_job
  foreign key (fk_job)
  references job(id);








