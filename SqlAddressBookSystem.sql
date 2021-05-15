
----UC1-------
create database AddressBook_System;
-----UC2 -----
use AddressBook_System;
--Creating address book table
create table Address_Book
(FirstName varchar(50) not null,
LastName varchar(50),
Address varchar(200) not null,
City varchar(50) not null,
State varchar(50) not null,
Zip int not null,
PhoneNo int not null,
Email varchar(150) not null
);

--UC3 Ability to insert new contacts to addressbook-----

use AddressBook_System;

--Insert data into table
insert into Address_Book(FirstName,LastName,Address,City,State,Zip,PhoneNo,Email)
values
('Navya', 'Upadhyay','Sec-3','Kanpurpur', 'UP', 214336,941144552, 'Navya@gmail.com'),
 ('Dheer', 'Meena', 'Sec-2', 'karauli', 'Rajasthan', 211136, 991144552, 'dheer@gmail.com'),
 ('Shubham', 'Nehra', 'Sec-1', 'Agra', 'UP', 217336, 954684552, 'shubham@gmail.com'),
 ('Rajat', 'Baisla', 'Sec-5', 'Patna', 'Bihar', 217336, 969684552 ,'rajat@gmail.com');
--Retrieving all the data from table
select * from Address_Book;

--UC4 Ability to edit existing contact person using their name----
use AddressBook_System;

--Edit and Update data of an existing contact
update Address_Book set City='Jhansi' where FirstName='Shubham' and LastName='Nehra';
--Retrieving all the data from table
select * from Address_Book;

--UC5 Ability to delete existing contact person using their name
use AddressBook_System;

--Edit and Update data of an existing contact
delete from Address_Book  where FirstName='Dheer' and LastName='Meena';
--Retrieving all the data from table
select * from Address_Book;

--UC 6 : Ability to retrieve person belonging to a city or state from address book table
use AddressBook_System;

--Retrieve details of people belonging to either city Agra or state UP
select * from Address_Book where State='UP' or City='Kanpur';

--UC7 Ability to understand the size of address book by City and State

use AddressBook_System;

-- displaying the count of contacts by city
 select City,count(*) as 'Number of Contacts'
  from Address_Book
  group by City;
 --displaying the count of contacts by state
 select State,count(*) as 'Number of Contacts'
  from Address_Book 
  group by State;

--UC8 Ability to retrieve entries sorted alphabetically by Person’s name for a given city

use AddressBook_System;
--Retrieve entries sorted alphabetically by name for Agra
select * from Address_Book where City='Agra' order by FirstName+LastName; 

--UC9 Ability to identify each Address Book with name and Type
use AddressBook_System;
select * from Address_Book;
--Altering address_book to add new columns, addressbookName and Type of contacts
alter table Address_Book add addressBookType varchar(30), addressBookName varchar(40);
--Updating the new columns
update Address_Book set addressBookType = 'Friends' where City ='Agra';
update Address_Book set addressBookName = 'PriyanshuRecords';
update Address_Book set addressBookType = 'Family' where LastName ='Nehra';
update Address_Book set addressBookType = 'Profession' where addressBookType is null;
--Retrieving all the data from table
select * from Address_Book;

--UC10 Ability to get number of contact persons 
 
use AddressBook_System;
 --Getting number of contact persons for each ContactType
select addressBookType,Count(addressBookType) as NumberOfContacts from Address_Book group by addressBookType;

--UC11 Ability to add person to both Friend and Family

use AddressBook_System;
--Adding the same person to both friend and family types
insert into Address_Book(FirstName,LastName,Address,City,State,Zip,PhoneNo,Email,addressBookType,addressBookName)
values('Radha', 'Yadav','Sec-6','Delhi', 'Delhi', 214566,941144333, 'Radha@gmail.com','Family','PriyanshuRecords');
--Retrieving details of the duplicated contact
select * from Address_Book where FirstName='Navya' and LastName='Upadhyay';

