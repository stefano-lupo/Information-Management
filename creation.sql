
/**
  Go through all data types and add constraints
  Eg Job status one of('in progress' etc)
*/

drop table account;

create table account(
  email varchar(50) not null,
  password varchar(50) not null,
  first_name varchar(50) not null,
  last_name varchar(50),
  trustworthy_score number(3),
  primary key (email)
);

drop table provider;

/* overall_score derived */
create table provider(
  name varchar(50) not null,
  fk_account varchar(50) not null,
  address_street varchar(50),
  address_town varchar(50),
  address_county varchar(50),
  overall_score number(3),
  primary key (name, fk_account varchar)
);


/* Provider score was multivalue and composite */
create table provider_scores_category(
  fk_provider varchar(50) not null,
  fk_category_name varchar(50) not null,
  fk_category_parent varchar(50) not null,
  score number(3) not null,
  primary key (fk_provider, fk_category_name, fk_category_parent)
);


create table offer(
  title varchar(50) not null,
  fk_provider varchar(50) not null,
  start_date date not null,
  end_date date not null,
  description varchar(200),
  primary key (title, fk_provider, start_date)
);

/* Add status constraint */
create table job(
  fk_account varchar(50) not null,
  fk_provider varchar(50) not null,
  start_date date not null,
  end_date date not null,
  status varchar(50),
  primary key (fk_account, fk_provider, start_date)
);


create table review(
  fk_account varchar(50) not null,
  fk_provider varchar(50) not null,
  start_date date not null,
  title varchar(100) not null,
  description varchar(200),
  rating number(3),
  primary key (fk_account, fk_provider, start_date)
);


create table portfolio_entry(
  fk_account varchar(50) not null,
  fk_provider varchar(50) not null,
  start_date date not null,
  title varchar(100) not null,
  description varchar(200),
  primary key (fk_account, fk_provider, start_date)
);


create table category(
  name varchar(50) not null,
  parent varchar(50) not null,
  primary key (name, parent)
);

