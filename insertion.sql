/*******************************************************
  Categories
*********************************************************/
/* 1 */
insert into category values (
  1,
  'Tech',
  Null
);

insert into category values (
  2,
  'Software Development',
  1
);

insert into category values (
  3,
  'Web Design',
  1
);

insert into category values (
  4,
  'Home and Garden',
  Null
);

insert into category values (
  5,
  'Cleaning',
  4
);

insert into category values (
  6,
  'Landscaping',
  4
);




/*******************************************************
  Stefano Lupo
*********************************************************/
insert into account values (
  1,
  'lupos@tcd',
  '1234',
  'stefano',
  'lupo',
  100);

insert into provider values (
  1,
  'Stefano''s Databases',
  1,
  '123 Fake Street',
  'Sutton',
  'Dublin',
  99
);

insert into provider_category values (
  1,
  2,
  99
);

insert into offer values (
  '10% off for your next Database!!',
  1,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  TO_DATE('15-08-2018', 'DD-MM-YYYY'),
  'Stefano''s discount'
);




/******************************************************
  Frank Smith
*********************************************************/
insert into account values (
  2,
  'frank@tcd',
  '1234',
  'frank',
  'smith',
  100
);

insert into provider values (
  2,
  'Frank''s WebDesign',
  2,
  '123 frank Street',
  'Frankland',
  'Frankfurt',
  50
);

insert into provider_category values (
  2,
  3,
  75
);

insert into offer values (
  'php rulez!',
  4,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  TO_DATE('15-08-2018', 'DD-MM-YYYY'),
  '\"; DROP TABLE ACCOUNTS; \*heehehe '
);




/******************************************************
  Gary Glass
*********************************************************/
insert into account values (
  3,
  'gary@tcd',
  '1234',
  'Gary',
  'o hara',
  100
);

insert into provider values (
  3,
  'Gary''s Gardening Service',
  3,
  '1 Garden Street',
  'Gardenstown',
  'New Garden',
  12
);

insert into provider_category values (
  3,
  6,
  50
);

insert into offer values (
  'Free tree removal (trunk not included)',
  3,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  TO_DATE('15-08-2018', 'DD-MM-YYYY'),
  'Gardening discount'
);





insert into account values (
  4,
  'john@tcd',
  '1234',
  'john',
  'doe',
  100);


insert into provider values (
  null,
  'John''s Window Cleaning',
  4,
  '123 Clean Glass Street',
  'Sparkle',
  'Dublin',
  22
);

insert into provider_category values (
  4,
  5,
  85
);


insert into offer values (
  'Window cleaning 60% off',
  3,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  TO_DATE('15-08-2018', 'DD-MM-YYYY'),
  'Only applies to first window*'
);


