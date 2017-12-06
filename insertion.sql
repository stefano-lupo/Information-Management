/*******************************************************
  Categories
*********************************************************/
/* 1 */
insert into category values (
  1,
  'Home Renovation',
  null
);

insert into category values (
  2,
  'Tradesmen',
  1
);

insert into category values (
  3,
  'Carpenters',
  2
);

insert into category values (
  4,
  'Electricians',
  2
);

insert into category values (
  5,
  'Plumbers',
  2
);

insert into category values (
  6,
  'Construction',
  1
);

insert into category values (
  7,
  'Education',
  null
);

insert into category values (
  8,
  'Music',
  7
);

insert into category values (
  9,
  'Academia',
  7
);

insert into category values (
  10,
  'Piano Lessons',
  8
);

insert into category values (
  11,
  'Guitar Lessons',
  8
);

insert into category values (
  12,
  'English Grinds',
  9
);

insert into category values (
  13,
  'Maths Grinds',
  9
);








/*******************************************************
 Joe Bloggs
*********************************************************/
insert into account values (
  1,
  'joe@tcd',
  '1234',
  'Joe',
  'Blogs',
  default
);

/* Joes Sparks */
insert into provider values (
  1,
  'Joe''s Sparks',
  1,
  '123 Johns Sparks Street',
  'Sutton',
  'Dublin',
  default
);

/* Make him an electrician */
insert into provider_category values (
  1,
  4,
  default
);

/* Give him two offers */
insert into offer values (
  '10% off for your next electrician thing!',
  1,
  TO_DATE('20-12-2017', 'DD-MM-YYYY'),
  4,
  TO_DATE('25-12-2017', 'DD-MM-YYYY'),
  'This offer is only available until christmas!'
);

insert into offer values (
  '20% Off Safety Check',
  1,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  4,
  TO_DATE('25-12-2017', 'DD-MM-YYYY'),
  'Get your home tested now.'
);




/******************************************************
  Frank Smith
*********************************************************/
insert into account values (
  2,
  'frank@tcd',
  '1234',
  'Frank',
  'Smith',
  default
);

/* Frank's Carpentry */
insert into provider values (
  2,
  'Frank''s Carpentry',
  2,
  '123 Carpet Street',
  'Frankland',
  'Frankfurt',
  default
);

/* Make him a carpenter */
insert into provider_category values (
  2,
  3,
  default
);

insert into offer values (
  '50% Off Kitchen Cabinets',
  2,
  TO_DATE('30-09-2017', 'DD-MM-YYYY'),
  3,
  TO_DATE('7-10-2017', 'DD-MM-YYYY'),
  'Get your kitchen upgraded now!'
);




/******************************************************
  Cathal Kelly
*********************************************************/
insert into account values (
  3,
  'cathal@tcd',
  '1234',
  'Cathal',
  'Kelly',
  default
);

/* Create Cathal's Construction */
insert into provider values (
  3,
  'Cathal''s Construction',
  3,
  '1 Brick Street',
  'Buildertown',
  'Dublin',
  default
);

/* Make him a construction provider */
insert into provider_category values (
  3,
  6,
  default
);

insert into offer values (
  'Buy one extension, get one free!',
  3,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  6,
  TO_DATE('15-08-2018', 'DD-MM-YYYY'),
  'Now you can exctend both your houses for the price of one of your houses!'
);


/******************************************************
  John Doe
*********************************************************/
insert into account values (
  4,
  'john@tcd',
  '1234',
  'John',
  'Doe',
  default
);

/* Johns Music Lessons */
insert into provider values (
  4,
  'John''s Music Lessons',
  4,
  '123 Fake Street',
  'Musicland',
  'Dublin',
  default
);

/* Make him teach guitar lessons */
insert into provider_category values (
  4,
  10,
  default
);

/* Make him teach piano lessons */
insert into provider_category values (
  4,
  11,
  default
);


/* Give him an (permanent) offer on piano lessons */
insert into offer values (
  '50% Off - Sibling Discount!',
  4,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  10,
  null,
  'Get both of your kids learning piano'
);


/******************************************************
  Register another provider for Joe Bloggs
  Joes Plumbinhg
*********************************************************/
insert into provider values (
  5,
  'John''s Plumbing',
  1,
  '123 Johns Plumbing Address',
  'Sutton',
  'Dublin',
  default
);

/* Add him as a plumber */
insert into provider_category values (
  5,
  5,
  default
);


/******************************************************
  Create Pat Peters
  Note: account 5 but provider 6
*********************************************************/
insert into account values (
  5,
  'pat@tcd',
  '1234',
  'Pat',
  'Peters',
  default
);

/* Create Professor Pete */
insert into provider values (
  6,
  'Professor Pete',
  5,
  '123 Teacher Street',
  'Gradesland',
  'Cork',
  default
);

/* Make him an english teacher */
insert into provider_category values (
  6,
  12,
  default
);


/* Make him a maths teacher */
insert into provider_category values (
  6,
  13,
  default
);

/* Give him an english grinds offer */
insert into offer values (
  '2 for 1 on English Grinds',
  6,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  12,
  TO_DATE('15-08-2018', 'DD-MM-YYYY'),
  'Learn to read, write and spell all at once in double the time!'
);

/* Give him a maths grinds offer */
insert into offer values (
  '30 euro per hour maths grind.',
  6,
  TO_DATE('15-08-2017', 'DD-MM-YYYY'),
  13,
  TO_DATE('15-08-2018', 'DD-MM-YYYY'),
  'Learn to add, subtract and multiply all at once'
);




/******************************************************
  Create a customer John Dorian
*********************************************************/
insert into account values (
  6,
  'eaglessss@tcd',
  'i_love_chocolate___bear',
  'John',
  'Dorian',
  default
);


/******************************************************
  Create a customer Ted Buckland
*********************************************************/
insert into account values (
  7,
  'tedd2yB@sacredheart.com',
  'Aligator7',
  'Theodore',
  'Buckland',
  default
);


/******************************************************
  Create a customer Jan Itor 
*********************************************************/
insert into account values (
  8,
  'jan_itor@sacredheart.com',
  'penny',
  'Jan',
  'Itor',
  default
);

/******************************************************
  Create a customer Bob Kelso
*********************************************************/
insert into account values (
  9,
  'bob@sacredheart.com',
  '1234',
  'Bob',
  'Kelso',
  default
);

/******************************************************
  Create a customer Chris Turk
*********************************************************/
insert into account values (
  10,
  'turk@sacredheart.com',
  '1234',
  'Chris',
  'Turk',
  default
);




/******************************************************
  Create jobs
*********************************************************/



/* JD got english grinds from Professor Pete */
insert into job values (
  1,                                    /* id */
  6,                                    /* Account */
  6,                                    /* Provider */
  12,                                   /* Category */ 
  TO_DATE('23-09-2017', 'DD-MM-YYYY'),  /* Start Date */
  TO_DATE('26-09-2017', 'DD-MM-YYYY'),  /* End Date */
  'paid'                                /* Status */
);

/* JD got maths grinds from Professor Pete */
insert into job values (
  2,                                    /* id */
  6,                                    /* Account */
  6,                                    /* Provider */
  13,                                   /* Category */
  TO_DATE('23-09-2017', 'DD-MM-YYYY'),  /* Start Date */
  TO_DATE('26-09-2017', 'DD-MM-YYYY'),  /* End Date */
  'paid'                                /* Status */
);

/* Ted got piano lessons from John's Music Lessons */
insert into job values (
  3,                                    /* id */
  7,                                    /* Account */
  4,                                    /* Provider */
  10,                                   /* Category */
  TO_DATE('30-09-2017', 'DD-MM-YYYY'),  /* Start Date */
  TO_DATE('4-10-2017', 'DD-MM-YYYY'),   /* End Date */
  'paid'                                /* Status */
);

/* Jan Itor is getting construction work done from Cathals Construction */
insert into job values (
  4,                                    /* id */
  8,                                    /* Account */
  3,                                    /* Provider */
  6,                                    /* Category */
  TO_DATE('4-12-2017', 'DD-MM-YYYY'),   /* Start Date */
  null,                                 /* End Date */
  'in-progress'                         /* Status */
);

/* Jan Itor is getting plumbing work done from Joes Plumbing */
insert into job values (
  5,                                    /* id */
  8,                                    /* Account */
  5,                                    /* Provider */
  5,                                    /* Category */
  TO_DATE('4-12-2017', 'DD-MM-YYYY'),   /* Start Date */
  null,                                 /* End Date */
  'finished'                            /* Status */
);


/* Bob Kelso got some carpentry done by Franks Carpentry */
insert into job values (
  6,                                    /* id */
  9,                                    /* Account */
  2,                                    /* Provider */
  3,                                    /* Category */
  TO_DATE('10-11-2017', 'DD-MM-YYYY'),  /* Start Date */
  TO_DATE('14-11-2017', 'DD-MM-YYYY'),  /* Start Date */
  'paid'                                /* Status */
);


/* Chris Turk got some guitar lessons from John's Music Lessons */
insert into job values (
  7,                                    /* id */
  10,                                   /* Account */
  4,                                    /* Provider */
  11,                                   /* Category */
  TO_DATE('10-11-2017', 'DD-MM-YYYY'),  /* Start Date */
  TO_DATE('14-11-2017', 'DD-MM-YYYY'),  /* Start Date */
  'paid'                            /* Status */
);




/******************************************************
  Create Reviews (by customers on finished jobs)
*********************************************************/


/* JD got english grinds from Professor Pete */
insert into review values (
  1,                                      /* Job */
  'He doth be the best english teacher',  /* Description */
  85,                                     /* Rating */
  50                                      /* Helpfulness */
);


/* JD got maths grinds from Professor Pete */
insert into review values(
  2,                                      /* Job */
  'He doth be the best math teacher',     /* Description */
  95,                                     /* Rating */
  50                                      /* Helpfulness */
);

/* Ted got piano lessons from John's Music Lessons */
insert into review values(
  3,                                      /* Job */
  'Great piano teacher',                  /* Description */
  89,                                     /* Rating */
  50                                      /* Helpfulness */
);

/* Bob gotcarpentry work from Franks Carpentry */
insert into review values(
  6,                                      /* Job */
  'Pathetic carpenter',                   /* Description */
  22,                                     /* Rating */
  50                                      /* Helpfulness */
);

/* Turk got guitar lessons from John's Music Lessons */
insert into review values(
  7,                                      /* Job */
  'Crap guitar teacher',                  /* Description */
  33,                                     /* Rating */
  50                                      /* Helpfulness */
);





/***************************************************************
  Create Portfolio Entries (by providers based on finished jobs)
****************************************************************/

/* Professor Pete's English grinds with John */
insert into portfolio_entry values(
  1,                                     /* Job */
  'LC English Poetry',                   /* Title */
  'Taught some kid how to read Heaney'   /* Description */
);

/* Professor Pete's Maths grinds with John */
insert into portfolio_entry values(
  2,                                     /* Job */
  'LC Maths Trigonometry',               /* Title */
  'Taught some kid SOHCAHTOA'           /* Description */
);

/* Johns Music Lesson's piano lessons with Ted */
insert into portfolio_entry values(
  3,                                      /* Job */
  'Piano Lessons with Beginner',          /* Title */
  'Taught some kid to play 3 Blind Mice'  /* Description */
);

/* Franks Carpentry's capreneting (?) for Bob */
insert into portfolio_entry values(
  6,                                      /* Job */
  'Built a Computer Desk',                /* Title */
  'It looked nice but it fell down alot'  /* Description */
);

/* Johns Music Lesson's guitar lessons with Chris */
insert into portfolio_entry values(
  7,                                      /* Job */
  'Expert Level Guitar Lessons',          /* Title */
  'My best student. Thought him Wonderwall and Sweet Child of Mine'   /* Description */
);













