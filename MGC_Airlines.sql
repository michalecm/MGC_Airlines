CREATE TABLE Employees
(employee_id VARCHAR(10) DEFAULT AUTOINCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
birthday DATE NOT NULL,
e_mail VARCHAR(50) NOT NULL,
phone_number VARCHAR(15) NOT NULL,
position VARCHAR(50) NOT NULL);

CREATE TABLE Employee_Positions
(position_name VARCHAR(50) PRIMARY KEY,
salary FLOAT NOT NULL,
working_hours INTEGER NOT NULL);

CREATE TABLE Work_Ticket
(work_ticket_id VARCHAR(10) DEFAULT AUTOINCREMENT PRIMARY KEY,
employee_id VARCHAR(10),
flight_id VARCHAR(10));

CREATE TABLE Boarding_Pass
(ticket_number VARCHAR(10) DEFAULT AUTOINCREMENT PRIMARY KEY,
passenger_id VARCHAR(10),
flight_id VARCHAR(10));

CREATE TABLE Airport
(airport_name VARCHAR(50) PRIMARY KEY,
country VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL);

CREATE TABLE Passengers
(passenger_id VARCHAR(10) DEFAULT AUTOINCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
phone_number VARCHAR(15) NOT NULL,
e_mail VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
_state VARCHAR(50),
passport VARCHAR(10) NOT NULL,
nationality VARCHAR(75) NOT NULL);

CREATE TABLE Flight(
flight_id VARCHAR(10) DEFAULT AUTOINCREMENT PRIMARY KEY,
plane_id VARCHAR(10),
estimated_departure_time TIME NOT NULL,
estimated_arrival_time TIME NOT NULL,
depart_date DATE NOT NULL,
depart_time TIME NOT NULL,
arrival_date DATE NOT NULL,
arrival_time TIME NOT NULL,
depart_port VARCHAR(50) NOT NULL,
arrival_port VARCHAR(50) NOT NULL); 

CREATE TABLE Planes(
plane_id VARCHAR(10) DEFAULT AUTOINCREMENT PRIMARY KEY,
number_of_seats INTEGER NOT NULL,
model_no VARCHAR(15) NOT NULL);

ALTER TABLE Work_Ticket
ADD CONSTRAINT work2employees
FOREIGN KEY(employee_id)
REFERENCE Employees(employee_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE Employees
ADD CONSTRAINT employee_position2position_name
FOREIGN KEY(position)
REFERENCE Employee_Positions(position_name)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE Work_Ticket
ADD CONSTRAINT work_ticket2flight
FOREIGN KEY(flight_id)
REFERENCE Flight(flight_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE Boarding_Pass
ADD CONSTRAINT boarding_pass2flight
FOREIGN KEY(flight_id)
REFERENCE Flight(flight_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE Boarding_Pass
ADD CONSTRAINT boarding_pass2passengers
FOREIGN KEY(passenger_id)
REFERENCE Passengers(passenger_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE Flight
ADD CONSTRAINT flight_depart2airport
FOREIGN KEY(depart_port)
REFERENCE Airport(airport_name)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE Flight
ADD CONSTRAINT flight_arrive2airport
FOREIGN KEY(arrival_port)
REFERENCE Airport(airport_name)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE Flight
ADD CONSTRAINT flight_plane2planes
FOREIGN KEY(plane_id)
REFERENCE Planes(plane_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

INSERT INTO Airport (airport_name, country, city)

VALUES
('Riga International Airport', 'Latvia', 'Riga'),
('Vilnius International Airport', 'Lithuania', 'Vilnius'),
('Tallinn Airport', 'Estonia', 'Tallinn'),
('Kaunas International Airport', 'Lithuania', 'Karmelava'),
('Palanga International Airport', 'Lithuania', 'Palanga');

INSERT INTO Employee_Positions (position_name, salary, working_hours)

VALUES
('Pilot', '100000.50', '60'),
('Copilot', '85000.50', '40'),
('Janitor', '35000', '30'),
('Luggage Crew', '50000', '50'),
('Board Crew', '50000', '50');

INSERT INTO Employees(first_name, last_name, birthday, e_mail, phone_number, position)

VALUES
('John', 'Smith', '1950-06-06', 'johnsmith@email.com', '9798886318', 'Pilot'),
('Adam', 'Smith', '1955-05-05', 'adamsmith@email.com', '7778889999', 'Copilot'),
('Kristi', 'Hanson', '1973-01-01', 'kristihanson@email.com', '5678575577', 'Board Crew'),
('Silver', 'Kontus', '1992-05-23', 'kontus@email.com', '345678988', 'Janitor'),
('Karen', 'Uus', '1990-10-03', 'karen@email.com', '93688647', 'Luggage Crew');

INSERT INTO Passengers(first_name, last_name, phone_number, e_mail, country, city, _state, passport, nationality)

VALUES
('Mason', 'Michalec', '9792246339', 'myemail@email.com', 'USA', 'Nacogdoches', 'Texas', '8876562', 'United States Citizen'),
('Gulce', 'Mert', '123456789', 'gulce@turkey.com', 'Turkey', 'Izmir', '', '8647987', 'Turkish Citizen'),
('Cem', 'Hasgoren', '838585939', 'cem@cem.com', 'Turkey', 'Istanbul', '', '2597934', 'Turkish Citizen'),
('Erin', 'Cloudtworth', '379876543', 'cloudt@erin.ee', 'Estonia', 'Tallinn', '', '1597934', 'Estonian Citizen'),
('Karlis', 'Pleiko', '204204833', 'karlis@pleiko.net', 'Latvia', 'Riga', '', '2345678', 'Latvian Citizen');

INSERT INTO Planes(number_of_seats, model_no)

VALUES
('300', 'A383'),
('300', 'A383'),
('415', 'B25'),
('119', '9A1'),
('225', 'AK47'),
('880', 'PPL880');

INSERT INTO Flight(plane_id, estimated_departure_time, estimated_arrival_time, depart_date, depart_time, arrival_date, arrival_time, depart_port, arrival_port)

VALUES
('1', '17:15:00', '18:15:00', '2018-05-05', '18:00:00', '2018-05-05', '19:13:00', 'Riga International Airport', 'Tallinn Airport'),
('2', '05:20:00', '08:55:00', '2018-10-03', '05:27:00', '2018-10-03', '08:47:00', 'Vilnius International Airport', 'Tallinn Airport'),
('3', '12:01:00', '12:58:00', '2018-06-06', '12:00:00', '2018-06-06', '01:00:00', 'Vilnius International Airport', 'Palanga International Airport'),
('4', '01:04:00', '03:11:00', '2018-04-17', '01:04:00', '2018-04-17', '03:11:00', 'Kaunas International Airport', 'Riga International Airport'),
('4', '22:53:00', '23:50:00', '2018-09-22', '23:33:00', '2018-09-23', '00:50:00', 'Tallinn Airport', 'Riga International Airport');

INSERT INTO Boarding_Pass(passenger_id, flight_id)

VALUES
('1', '1'),
('2', '1'),
('3', '2'),
('4', '4'),
('5', '3');

INSERT INTO Work_Ticket(employee_id, flight_id)

VALUES
('1', '1'),
('3', '1'),
('4', '4'),
('5', '1'),
('2', '2'),
('1', '3'),
('2', '1'),
('1', '5'),
('4', '2'),
('3', '4'),
('5', '3');

