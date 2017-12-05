/* Make account's candidate key unique */
ALTER Table account
ADD CONSTRAINT account_candidate_unique UNIQUE (email);



/* Make provider's candidate (and composite) key unique */
ALTER Table provider
ADD CONSTRAINT provider_candidate_unique UNIQUE (name, fk_account);

/* Add fk_account to provider */
ALTER TABLE provider
ADD CONSTRAINT fk_provider_account
  FOREIGN KEY (fk_account)
  REFERENCES account(id);



/* Make category's candidate (and composite) key unique */
ALTER Table category
ADD CONSTRAINT category_candidate_unique UNIQUE (name, parent);

/* Add recursive foreign key parent to category */
ALTER TABLE category
ADD CONSTRAINT fk_category_category
  FOREIGN KEY (parent)
  REFERENCES category(id);



/* Add fk_provider to offers */
ALTER TABLE offer
ADD CONSTRAINT fk_offer_provider
  FOREIGN KEY (fk_provider)
  REFERENCES provider(id);

/* Add fk_category to offer */
ALTER TABLE offer
ADD CONSTRAINT fk_offer_category
  FOREIGN KEY (fk_category)
  REFERENCES category(id);




/* Add fk_provider to provider_category */
ALTER TABLE provider_category
ADD CONSTRAINT fk_provider_category_provider
  FOREIGN KEY (fk_provider)
  REFERENCES provider(id);

/* Add fk_category_name, fk_category_parent to provider_category */
ALTER TABLE provider_category
ADD CONSTRAINT fk_provider_category_category
  FOREIGN KEY (fk_category)
  REFERENCES category(id);





/* Make job's candidate (and composite) key unique */
ALTER Table job
ADD CONSTRAINT job_candidate_unique UNIQUE (fk_account, fk_provider, fk_category, start_date);

/* Add fk_account to job */
ALTER TABLE job
ADD CONSTRAINT fk_job_account
  FOREIGN KEY (fk_account)
  REFERENCES account(id);

/* Add fk_provider to job */
ALTER TABLE job
ADD CONSTRAINT fk_job_provider
  FOREIGN KEY (fk_provider)
  REFERENCES provider(id);

/* Add fk_category to job */
ALTER TABLE job
ADD CONSTRAINT fk_job_category
  FOREIGN KEY (fk_category)
  REFERENCES category(id);




/* Add fk_job to review */
ALTER TABLE review
ADD CONSTRAINT fk_review_job
  FOREIGN KEY (fk_job)
  REFERENCES job(id);

/* Add fk_job to portfolio_entry */
ALTER TABLE portfolio_entry
ADD CONSTRAINT fk_portfolio_entry_job
  FOREIGN KEY (fk_job)
  REFERENCES job(id);








