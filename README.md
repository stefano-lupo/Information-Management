# Assignment TODO:
1. Recheck all data types
2. Add in constraints based on data
3. Check how to do cardinality stuff
    - Eg inserting 2nd provider with safe account_id fk works (and it should) but others shouldnt
4. Providers must make element in category_provider_table
5. Default values for fields (Reviews / scores / helpfullness etc)
6: Dont allow providers be in categories with parent = null as they are root categories (maybe)
  - Only allow it if no other elements in the categories table has that as parent (1 level category)

## Semantic constraints
- Dates in offer - end date must be after start date

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