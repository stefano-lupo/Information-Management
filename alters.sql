/* Add fk_account to provider */
ALTER TABLE provider
ADD CONSTRAINT fk_account
  FOREIGN KEY (fk_account)
  REFERENCES account(id);

/* Add fk_provider to offers */
ALTER TABLE offer
ADD CONSTRAINT fk_provider
  FOREIGN KEY (fk_provider)
  REFERENCES provider(id);
