/*******************************************************
  Account
*********************************************************/
insert into account values (
  null,
  'lupos@tcd',
  '1234',
  'stefano',
  'lupo',
  100);

insert into account values (
  null,
  'pete@tcd',
  '1234',
  'pete',
  'o hara',
  100);

insert into account values (
  null,
  'frank@tcd',
  '1234',
  'frank',
  'smith',
  100);

insert into account values (
  null,
  'john@tcd',
  '1234',
  'john',
  'doe',
  100);




/*******************************************************
  Provider
*********************************************************/
insert into provider values (
  null,
  'Stefano''s Programming Palace',
  1,
  '123 Fake Street',
  'Sutton',
  'Dublin',
  99
);

insert into provider values (
  null,
  'Pete''s Pickles',
  2,
  '123 Fake Street',
  'Sutton',
  'Dublin',
  12
);

insert into provider values (
  null,
  'Frank''s Fries',
  3,
  '123 Fake Street',
  'Sutton',
  'Dublin',
  50
);

insert into provider values (
  null,
  'John''s Jars',
  4,
  '123 Fake Street',
  'Sutton',
  'Dublin',
  22
);



/*******************************************************
  Offer
*********************************************************/
insert into offer values (
  '10% off for everyone',
  1,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  TO_DATE('15-08-2018', 'DD-MM-YYYY'),
  'Discounts are cool'
);

insert into offer values (
  'Pickles or half price',
  2,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  TO_DATE('15-08-2018', 'DD-MM-YYYY'),
  'Discounts are cool'
);

insert into offer values (
  'Fries 60% off, only 2 days old!',
  3,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  TO_DATE('15-08-2018', 'DD-MM-YYYY'),
  'Willing to reheat for £1'
);

insert into offer values (
  'Jars, not just java executables!',
  4,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  TO_DATE('15-08-2018', 'DD-MM-YYYY'),
  'Discounts are cool'
);


/*******************************************************
  Categories
*********************************************************/
insert into category values (
  'Tech',
  Null
);

insert into category values (
  'Tech',
  Null
);

