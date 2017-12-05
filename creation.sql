
/**
  Go through all data types and add constraints
  Eg Job status one of('in progress' etc)
*/



/* Fix line size so its readable */
SET LINESIZE 32000


/*******************************************************
  Account
*********************************************************/
create table account(
  id number(10) not null,
  email varchar(50) not null,
  password varchar(50) not null,
  first_name varchar(50) not null,
  last_name varchar(50),
  trustworthy_score number(3),
  primary key (id)
);


/* Create Sequence and trigger for auto incrementing ID */
CREATE SEQUENCE account_seq START WITH 1;

/* Create trigger to increment the sequence */
CREATE OR REPLACE TRIGGER account_ai_id 
BEFORE INSERT ON account 
FOR EACH ROW

BEGIN
  SELECT account_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/



/*******************************************************
  Provider
*********************************************************/
/* overall_score derived */
create table provider(
  id number(10) not null,
  name varchar(50) not null,
  fk_account number(10) not null,
  address_street varchar(50),
  address_town varchar(50),
  address_county varchar(50),
  overall_score number(3),
  primary key (id)
);


/* Create Sequence and trigger for auto incrementing ID */
CREATE SEQUENCE provider_seq START WITH 1;


CREATE OR REPLACE TRIGGER provider_ai_id 
BEFORE INSERT ON provider 
FOR EACH ROW

BEGIN
  SELECT provider_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/




/*******************************************************
  Offer - allows null end dates for permanent offers
*********************************************************/
create table offer(
  title varchar(50) not null,
  fk_provider number(10) not null,
  start_date date not null,
  fk_category number(10) not null,
  end_date date,
  description varchar(200),
  primary key (title, fk_provider, start_date)
);


/*******************************************************
  Catrgory
*********************************************************/
create table category(
  id number(10) not null,
  name varchar(50) not null,
  parent number(10),
  primary key (id)
);


/* Create Sequence and trigger for auto incrementing ID */
CREATE SEQUENCE category_seq START WITH 1;

/* Create trigger to increment the sequence */
CREATE OR REPLACE TRIGGER category_ai_id 
BEFORE INSERT ON category 
FOR EACH ROW

BEGIN
  SELECT category_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/


/*******************************************************
  Provider - Catrgory
*********************************************************/
/* Provider score was multivalue and composite */
create table provider_category(
  fk_provider number(10) not null,
  fk_category number(10) not null,
  score number(3) not null,
  primary key (fk_provider, fk_category)
);


/*******************************************************
  Job
*********************************************************/

/* Add status constraint */
create table job(
  id number(10) not null,
  fk_account number(10) not null,
  fk_provider number(10) not null,
  fk_category number(10) not null,
  start_date date not null,
  end_date date,
  status varchar(50),
  primary key (id)
);


/* Create Sequence for auto incrementing ID */
CREATE SEQUENCE job_seq START WITH 1;

/* Create trigger to increment the sequence */
CREATE OR REPLACE TRIGGER job_ai_id 
BEFORE INSERT ON job 
FOR EACH ROW

BEGIN
  SELECT job_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/



/*******************************************************
  Review
*********************************************************/
/* Review default value 50% */
create table review(
  fk_job number(10) not null,
  description varchar(200),
  rating number(3),
  helpfullness_rating number(3),
  primary key (fk_job)
);



/*******************************************************
  Portfolio Entry
*********************************************************/
create table portfolio_entry(
  fk_job number(10) not null,
  title varchar(100) not null,
  description varchar(200),
  primary key (fk_job)
);







