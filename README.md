# Assignment TODO:
1. Recheck all data types
2. Add in constraints based on data
3. Check how to do cardinality stuff
    - Eg inserting 2nd provider with safe account_id fk works (and it should) but others shouldnt
4. Providers must make element in category_provider_table
5. Default values for fields (Reviews / scores / helpfullness etc)
6. Dont allow providers be in categories with parent = null as they are root categories (maybe)
  - Only allow it if no other elements in the categories table has that as parent (1 level category)
7. Only allow providers create offers in categories they are actually in.
    - Only allow providers work in their categories etc.
8. Only allow portfolio entries for accounts who actually took part in that job, same for reviews.
9. Make sure all dates are valid (start before end)!
10. Only allow each account have one provider per category 
11. Require an end date to move to finished (job)

Note: Joe bloggs: 1 account two providers in different categories (Joes sparks, Joes Plumbing)
Note: John doe: 1 account, 1 provider, 2 categories (John's Music Lessons in both guitar and piano)

## Semantic constraints
- Dates in offer - end date must be after start date


## Assignment Notes
1. Offer table needs category as providers can work in multiple categories therefore need to keep track of which category this offer is for.



## Inner Join
**ONLY** returns rows in which the join operation finds a match
- ```sql
    SELECT provider.name, offer.title, offer.description  FROM offer inner join provider on offer.fk_provider=provider.id;
    ```
    - If there was a provider who **didn't have any offers**, they would not be returned!

- ```sql
    SELECT provider.name, provider.overall_score, account.first_name  FROM account inner join provider on account.id=provider.fk_account;
    ```
    - Only returns accounts of those who are providers


## Left / Right Join
- Note: Left is the table we are *selecting* from, right is the table we are *joining* on.
- **Left**: Returns all rows in the left table and just nulls the joined columns of any rows who dont have a match.
-   ```sql
    SELECT account.first_name, provider.name, provider.overall_score  FROM account left join provider on account.id=provider.fk_account;
    ```
    - Selects **all accounts** (includes customers), and adds provider info where applicable
-   ```sql
    SELECT provider.name, offer.title, offer.description  FROM offer right join provider on offer.fk_provider=provider.id;
    ```
    - Selects all the providers and lists the offer info where applicable
        - But single provider can have multiple offers: just has multiple rows for same provider with each of their offers.
- Returns **all** rows from **left** table and matches them with entries from the right table if matches occur, otherwise returns null for the matched columns
- Eg: `select provider.name, offer.title from offer where


# Practice Airport / Hotel Database
Q1: Which hotel is Sean Byrne staying in on the 1st of September?
```SQL 
SELECT * FROM Flight, Airport WHERE Flight.departure_airport = Airport.id and Airport.location = "Dublin" 
    and Flight.arrival_airport = (SELECT id FROM Airport WHERE location = "Heathrow")
```

Q2: How much is a business class fare from Dublin to London?
```SQL
SELECT * FROM Fare WHERE flight_no = (select Flight.flight_no from Flight, Airport where Flight.departure_airport = Airport.id and Airport.location = "Dublin" and Flight.arrival_airport = (SELECT id FROM Airport WHERE location = "Heathrow")) AND seat_class = "b"
```

Q3: What is the price of a double room in the Silver Swan?
```sql
SELECT * FROM HOTEL, ROOM WHERE HOTEL.HOTELNO = ROOM.HOTELNO AND ROOM.TYPE = "Double" AND HOTEL.HOTELNAME="Silver Swan"
```

Q4: What Flight is Mary Hoyne on on 2013-05-21
```sql
SELECT * FROM Booking, Customer WHERE Booking.customer_id = Customer.customer_id and Customer.customer_name = "Mary Hoyne" and Booking.departure_date = "2013-05-21"
```