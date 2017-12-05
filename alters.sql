/* Add fk_account to provider */
ALTER TABLE provider
ADD CONSTRAINT fk_provider_account
  FOREIGN KEY (fk_account)
  REFERENCES account(id);



/* Add fk_provider to offers */
ALTER TABLE offer
ADD CONSTRAINT fk_offfer_provider
  FOREIGN KEY (fk_provider)
  REFERENCES provider(id);



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

/* Add fk_category_name, fk_category_parent to job */
ALTER TABLE job
ADD CONSTRAINT fk_job_category
  FOREIGN KEY (fk_category)
  REFERENCES category(id);


/* Add fk_job to review */
ALTER TABLE review
ADD CONSTRAINT fk_review_job
  FOREIGN KEY (fk_job_account, fk_job_provider, fk_job_start_date)
  REFERENCES job(fk_account, fk_provider, start_date);

/* Add fk_job to portfolio_entry */
ALTER TABLE portfolio_entry
ADD CONSTRAINT fk_portfolio_entry_job
  FOREIGN KEY (fk_job_account, fk_job_provider, fk_job_start_date)
  REFERENCES job(fk_account, fk_provider, start_date);








