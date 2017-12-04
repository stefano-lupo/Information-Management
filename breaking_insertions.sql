
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