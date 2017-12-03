/* Create an account */
insert into account values (
  null,
  'lupos@tcd',
  '1234',
  'stefano',
  'lupo',
  100);

/* Add provider to that account */
insert into provider values (
  null,
  'stefano programming',
  1,
  '123 Fake Street',
  'Sutton',
  'Dublin',
  99
);

/* Try add provider with incorrect fk */
insert into provider values (
  null,
  'stefano programming',
  99,
  '123 Fake Street',
  'Sutton',
  'Dublin',
  99
);

/* Try add provider with duplicated fk */
insert into provider values (
  null,
  'stefano programming',
  1,
  '123 Fake Street',
  'Sutton',
  'Dublin',
  99
);

/* Add an offer from the provider */
insert into offer values (
  '10% off for everyone',
  1,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  TO_DATE('15-08-2018', 'DD-MM-YYYY'),
  'Discounts are cool'
);