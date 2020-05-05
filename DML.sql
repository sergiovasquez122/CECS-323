
INSERT INTO states(state_name) VALUES ('Alabama'), ('Alaska'), ('Arizona'), ('Arkansas'), ('California'), ('Colorado'), ('Connecticut'), ('Delaware'), ('Florida'), ('Georgia'),
                               ('Hawaii'), ('Idaho'), ('Illinois'), ('Indiana'), ('Iowa'), ('Kansas'), ('Kentucky'), ('Louisiana'), ('Maine'), ('Maryland'),
                               ('Massachusetts'), ('Michigan'), ('Minnesota'), ('Mississippi'), ('Missouri'), ('Montana'), ('Nebraska'), ('Nevada'), ('New Hampshire'), ('New Jersey'),
                               ('New Mexico'), ('New York'), ('North Carolina'), ('North Dakota'), ('Ohio'), ('Oklahoma'), ('Oregon'), ('Pennsylvania'), ('Rhode Island'), ('South Carolina'),
                               ('South Dakota'), ('Tennesse'), ('Texas'), ('Utah'), ('Vermont'), ('Virginia'), ('Washington'), ('West Virginia'), ('Wisconsin'), ('Wyoming'),
                               ('Beijing'), ('Tokyo'), ('Dubai'), ('London'), ('Shanghai'), ('Île-de-France'), ('Guangdong'), ('North Holland'), ('West Sussex');


INSERT INTO city(state_name, city_name, cid) VALUES ('Georgia', 'Atlanta', 1), ('California', 'Los Angeles', 2), ('Illinois', 'Chicago', 3), ('Texas', 'Dallas', 4), ('Colorado', 'Denver', 5),
                           ('New York', 'New York', 6), ('California', 'San Francisco', 7), ('Washington', 'Seattle', 8), ('Nevada', 'Las Vegas', 9), ('Florida', 'Orlando', 10),
                           ('New Jersey', 'Newark', 11), ('North Carolina', 'Charlotte', 12), ('Arizona', 'Phoenix', 13), ('Texas', 'Houston', 14), ('Florida', 'Miami', 15),
                           ('Massachusetts', 'Boston', 16), ('Minnesota', 'Minneapolis', 17), ('Florida', 'Fort Lauderdale', 18), ('Michigan', 'Detroit', 19), ('Pennsylvania', 'Philadelphia', 20),
                           ('Maryland', 'Baltimore', 21), ('Utah', 'Salt Lake City', 22), ('California', 'San Diego', 23), ('Virginia', 'Washington D.C', 24), ('Florida', 'Tampa', 25),
                           ('Oregon', 'Portland', 26), ('Hawaii', 'Honolulu', 27), ('Beijing', 'Chaoyang-Shunyi', 28), ('Tokyo', 'Ōta', 29), ('Dubai', 'Garhoud', 30), ('London', 'Hillingdon', 31), ('Shanghai', 'Pudong', 32), 
                           ('Île-de-France', 'Roissy-en-France', 33), ('Guangdong', 'Guangzhou', 34), ('North Holland', 'Haarlemmermeer', 35), ('Tokyo', 'Minato', 36), ('West Sussex', 'Crawley', 37), 
                           ('Texas', 'Fort Worth', 38), ('New York', 'Long Island City', 39), ('Florida', 'Miramar', 40);

--Airports
INSERT INTO airport(airport_name, FAA_approved_abbreviation, cid) VALUES ('Hartsfield-Jackson Atlanta International Airport', 'ATL', 1), ('Los Angeles International Airport', 'LAX', 2), ('O''Hare International Airport', 'ORD', 3),
                    ('Dallas/Fort Worth International Airport', 'DFW', 4), ('Denver International Airport', 'DEN', 5), ('John F. Kennedy International Airport', 'JFK', 6), ('San Francisco International Airport', 'SFO', 7),
                    ('Seattle–Tacoma International Airport', 'SEA', 8), ('McCarran International Airport', 'LAS', 9), ('Orlando International Airport', 'MCO', 10), ('Newark Liberty International Airport', 'EWR', 11),
                    ('Charlotte Douglas International Airport', 'CLT', 12), ('Phoenix Sky Harbor International Airport', 'PHX', 13), ('George Bush Intercontinental Airport', 'IAH', 14), ('Miami International Airport', 'MIA', 15),
                    ('General Edward Lawrence Logan International Airport', 'BOS', 16), ('Minneapolis–Saint Paul International Airport', 'MSP', 17), ('Fort Lauderdale–Hollywood International Airport', 'FLL', 18), ('Detroit Metropolitan Airport', 'DTW', 19),
                    ('Philadelphia International Airport', 'PHL', 20), ('LaGuardia Airport', 'LGA', 6), ('Baltimore–Washington International Thurgood Marshall Airport', 'BWI', 21), ('Salt Lake City International Airport', 'SLC', 22),
                    ('San Diego International Airport', 'SAN', 23), ('Washington Dulles International Airport', 'IAD', 24), ('Ronald Reagan Washington National Airport', 'DCA', 24), ('Chicago Midway International Airport', 'MDW', 3),
                    ('Tampa International Airport', 'TPA', 25), ('Portland International Airport', 'PDX', 26), ('Daniel K. Inouye International Airport', 'HNL', 27), ('Beijing Capital International Airport', 'PEK', 28), ('Tokyo Haneda Airport', 'HND', 29),
                    ('Dubai International Airport', 'DXB', 30), ('London Heathrow Airport', 'LHR', 31), ('Shanghai Pudong International Airport', 'PVG', 32), ('Charles de Gaulle Airport', 'CDG', 33),
                    ('Guangzhou Baiyun International Airport', 'CAN', 34), ('Amsterdam Airport Schiphol', 'AMS', 35);

-- Insert all possible flight types
INSERT INTO FlightType(flight_type) VALUES ('International'), ('Domestic'), ('Local');

INSERT INTO AIRLINE(AID, AIRLINE_NAME, CID, FLIGHT_TYPE)
VALUES
(100, 'Hollywood_Airlines', 2, 'Local'),
(200, 'Socal_Airlines', 2, 'Local'),
(300, 'Sunny_Cali_Airlines', 2, 'Local'),
(400, 'CheapTickets', 2, 'Domestic'),
(500, 'California_Airlines', 2, 'Domestic'),
(600, 'Compton_Airlines', 2, 'Local'),
(700, 'Delta_Airlines', 2, 'Domestic'),
(800, 'Psi_Airlines', 2, 'International'),
(900, 'Gamma_Airlines', 2, 'International'),
(1000, 'Theta_Airlines', 2, 'International');

INSERT INTO airline(aid, airline_name, flight_type, cid) VALUES (1, 'All Nippon Airways', 'International', 36), (2, 'Virgin Atlantic Airways', 'International', 37), (3, 'Emirates', 'International', 30), 
                    (4, 'American Airlines', 'Domestic', 28), (5, 'Delta Air Lines', 'Domestic', 1), (6, 'Southwest Airlines', 'Domestic', 4), (7, 'JetBlue Airways', 'Local', 29), (8, 'Spirit Airlines', 'Local', 30), 
                    (9, 'United Airlines', 'Local', 3);

INSERT INTO airport_airline(airport_name, aid) VALUES 
                    ('Tokyo Haneda Airport', 1), 
                    ('Dubai International Airport', 3), 
                    ('Hartsfield-Jackson Atlanta International Airport', 5),
                    ('Hartsfield-Jackson Atlanta International Airport', 6),
                    ('Los Angeles International Airport', 7), 
                    ('Los Angeles International Airport', 900),
                    ('Los Angeles International Airport', 6),
                    ('O''Hare International Airport', 6),
                    ('Tokyo Haneda Airport', 900),
                    ('Los Angeles International Airport', 9),
                    ('San Diego International Airport', 9),
                    ('Los Angeles International Airport', 100),
                    ('San Diego International Airport', 100),
                    ('Dubai International Airport', 900);

INSERT INTO AIRPLANE(manufacturer, model_number, passenger_maximum, tail_number, plane_name, date_manufactured, aid) VALUES ('Airbus Corp Jets', 801, 20, 'A8F', 'The Unavoidable', '03/20/2019', 3), 
                                                                                ('Boeing Business Jets', 100, 20, 'C19', 'No''Rona', '05/09/1997', 6),
                                                                                ('Textron Aviation', 304, 80, 'NBC', 'Unit', '01/01/1971', 8), 
                                                                                ('Aerosup Inc.', 214, 65, 'L3G', 'Heartburn', '02/14/2012', 2), 
                                                                                ('AMC MRO', 420, 42, '42O', 'Mary Jane', '04/20/1975', 4),
                                                                                ('Boeing Business Jet', 225, 400, '252', 'The Survivor', '02/02/2000', 9),
                                                                                ('Airbus Corp Jets', 802, 200, 'A8G', 'Blue Dragon', '03/20/1998', 6),
                                                                                ('SpaceX', 777, 500, 'N721AA', 'The dreamer', '08/23/1996', 900),
                                                                                ('Boeing', 600, 500, '100', 'Blue jet', '08/23/1944', 200),
                                                                                ('Raytheon', 744, 600, '200', 'The Beast', '07/23/1932', 1000),
                                                                                ('Raytheon', 325, 500, '10001', 'The flyer', '08/23/1996', 900),
                                                                                ('AMC MRO', 444, 42, '10002', 'Celeb_flyers', '07/07/1997', 100);

INSERT INTO FLIGHT_SCHEDULE (FSID, ARRIVAL_TIME, DEPARTURE_TIME, ARRIVAL_AIRPORT, DEPARTURE_AIRPORT, FLIGHT_NUMBER) 
	 VALUES
         (1000, '18:00:00', '06:00:00', 'Tokyo Haneda Airport', 'Los Angeles International Airport', 'A00'),
	 (1001, '11:00:00', '07:00:00', 'O''Hare International Airport', 'Los Angeles International Airport', '8AF'),
	 (1002, '08:30:00', '04:00:00', 'Hartsfield-Jackson Atlanta International Airport', 'Los Angeles International Airport', 'BN2'),	 
        (1003, '14:00:00', '13:00:00', 'San Diego International Airport', 'Los Angeles International Airport', 'KL3'),
	 (1004, '10:00:00', '08:00:00', 'Tokyo Haneda Airport', 'Amsterdam Airport Schiphol', 'TA7'),
	 (1005, '11:00:00', '06:00:00', 'Washington Dulles International Airport', 'Seattle–Tacoma International Airport', 'SW4'),
	 (1006, '12:00:00', '10:00:00', 'Dubai International Airport', 'San Diego International Airport', 'GM6'),
	 (1007, '01:00:00', '07:00:00', 'Philadelphia International Airport', 'Portland International Airport', 'LH1'),
	 (1008, '11:00:00', '09:00:00', 'Denver International Airport', 'Dallas/Fort Worth International Airport', 'A00'),
	 (1009, '03:00:00', '10:30:00', 'Salt Lake City International Airport', 'Baltimore–Washington International Thurgood Marshall Airport', 'BN2'),
	 (100001, '14:00:00', '10:00:00', 'Los Angeles International Airport', 'Shanghai Pudong International Airport', '1000'),
	 (100002, '22:00:00', '15:00:00', 'Shanghai Pudong International Airport', 'Los Angeles International Airport', '1001'),
	 (100003, '14:00:00', '10:00:00', 'Los Angeles International Airport', 'Tokyo Haneda Airport', '1002'),
	 (100004, '14:00:00', '10:00:00', 'Tokyo Haneda Airport', 'Los Angeles International Airport', '1003'),
	 (100005, '14:00:00', '10:00:00', 'Tokyo Haneda Airport', 'Los Angeles International Airport', '1004'),
	 (100006, '22:00:00', '15:00:00', 'Los Angeles International Airport', 'Tokyo Haneda Airport', '1005'),
	 (10007, '23:00:00', '15:10:00', 'Dubai International Airport', 'Tokyo Haneda Airport', '2490'),
	 (1010, '15:00:00', '13:00:00', 'San Diego International Airport', 'Los Angeles International Airport', 'KL4'),
	 (1011, '18:00:00', '15:30:00', 'Los Angeles International Airport', 'San Diego International Airport', 'KL5');

INSERT INTO CHARGETYPE(CHARGETYPE)
VALUES
('Water'),
('Pillows'),
('Blankets');

-- All data for incidents
INSERT INTO INCIDENTTYPE(INCIDENT_TYPE) VALUES
('Injury'),
('Complaint'),
('Praise');

-- All date for SEVERITY TABLE
INSERT INTO SEVERITY(SEVERITY_AMOUNT) VALUES
(1),
(2),
(3),
(4),
(5);

INSERT INTO FLIGHT_CREW(FLIGHT_CREW_NAME) VALUES ('United_flyers'), 
                                                 ('International Flyers'), 
                                                 ('Hollywood_flyers'),
                                                 ('The Southerners'),
                                                 ('Tango');

INSERT INTO CREW_MEMBER(FIRST_NAME, LAST_NAME, EMAIL, AID, DOB, FAA_NUMBER, CMID)
VALUES ('Manny', 'Cortez', 'manc@gamma.com', 900, '02/23/1992', '1000', 1000),
       ('Hector', 'Rodriguez', 'Hec@gamma.com', 900, '02/24/1993', '1001', 1001),
       ('Pablo', 'Picasso', 'ppac@gamma.com', 900, '03/03/1993', '1002', 1002),
       ('Peter', 'Parker', 'ppark@gamma.com', 900, '04/04/1994', '1003', 1003),
       ('Mary', 'Jane', 'mjay@gamma.com', 900, '05/05/1995', '1004', 1004),
       ('Ryan', 'Hiroko', 'ryan@socal.com', 200, '08/23/1946', '1', 100),
       ('Pascal', 'Vasquez', 'pvasq@socal.com', 200, '09/25/1945', '2', 200),
        ('Jeremey', 'Howard', 'jhow@gamma.com', 1000,'10/10/1950', '3', 300),
        ('Kevin', 'Bacon', 'bacon@bacon.com', 100,'08/08/1958', '1005', 1005),
        ('Angelina', 'Jolie', 'jolie@jolie.com', 100, '06/04/1975', '1006', 1006),
        ('Brad', 'Pitt', 'pitt@pitt.com', 100, '12/18/1963', '1007', 1007),
        ('Jennifer', 'Aniston', 'aniston@aniston.com', 100, '02/11/1969', '1008', 1008),
        ('Andrew', 'Ng', 'andrew@cmu.com', 100, '08/23/1976', '1009', 1009),
        ('Tim', 'Roughgarden', 'tim@stanford.com', 100, '07/20/1975', '1010', 1010),
        ('Sergio', 'Vasquez', 'svasq@gamma.com', 900, '08/23/1996', '1011', 1011),
       ('Eduardo', 'Rocha', 'Erocha@gamma.com', 900, '02/24/1991', '1012', 1012),
       ('Paul', 'Wilkinson', 'pjwilk@gamma.com', 900, '03/03/1983', '1013', 1013),
       ('Jamal', 'Ashraf', 'ashraf@gamma.com', 900, '04/04/1976', '1014', 1014),
       ('Joshua', 'Hayter', 'jhayt@gamma.com', 900, '05/05/1990', '1015', 1015),
        ('Eric', 'Leighman', 'eric@united.com', 9, '02/19/1987', '1016', 1016),
       ('Erik', 'Dermaine', 'erik@united.com', 9, '02/18/1993', '1017', 1017),
       ('Rachel', 'Zax', 'rachzax@united.com', 9, '08/19/1985', '1018', 1018),
       ('Jeff', 'Erickson', 'jerick@united.com', 9, '03/12/1982', '1019', 1019),
       ('Jeff', 'Edmond', 'jed@united.com', 9, '03/05/1992', '1020', 1020),
        ('Andrew', 'Perez', 'andy@south.com', 6, '08/19/1975', '1021', 1021),
        ('Julie', 'Anderson', 'julie@south.com', 6, '09/12/1976', '1022', 1022),
        ('Ian', 'McFellow', 'ian@south.com', 6, '4/04/1974', '1023', 1023),
        ('Kendrick', 'Williams', 'kwill@south.com', 6, '03/03/1973', '1024', 1024),
        ('Cole', 'Hart', 'chart@south.com', 6, '04/21/1965', '1025', 1025),
        ('Jeff', 'Kline', 'jkline@united.com', 9, '04/25/1975', '1026', 1026);

INSERT INTO PILOT(FLIGHT_CREW_NAME, CMID, HOUROFEXPERIENCE)
VALUES
(null, 100, 7500),
(null, 200, 5000),
(null, 300, 5500),
('International Flyers', 1000, 15000),
('Hollywood_flyers', 1005, 100),
('Tango', 1011, 200000),
('United_flyers', 1016, 5000),
('The Southerners', 1021, 12500);

INSERT INTO CO_PILOT(CMID, FLIGHT_CREW_NAME) 
VALUES   (1001, 'International Flyers'),
         (1006, 'Hollywood_flyers'),
         (1012, 'Tango'),
         (1017, 'United_flyers'),
         (1022, 'The Southerners');

INSERT INTO FLIGHT_ATTENDANT (CMID, FLIGHT_CREW_NAME) 
VALUES
	 (1003, 'International Flyers'),
	 (1004, 'International Flyers'),
	 (1008, 'Hollywood_flyers'),
	 (1009, 'Hollywood_flyers'),
	 (1010, 'Hollywood_flyers'),
	 (1014, 'Tango'),
	 (1015, 'Tango'),
	 (1019, 'United_flyers'),
         (1026, 'United_flyers'),
	 (1024, 'The Southerners'),
	 (1025, 'The Southerners');


INSERT INTO NAVIGATOR (CMID, FLIGHT_CREW_NAME) 
	 VALUES (1002, 'International Flyers'),
	 (1007, 'Hollywood_flyers'),
	 (1013, 'Tango'),
	 (1018, 'United_flyers'),
	 (1023, 'The Southerners');

INSERT INTO FLIGHT (FLIGHT_DEPARTURE_TIME, FINAL_ARRIVAL_TIME, FLIGHT_CREW_NAME, FSID, TAIL_NUMBER, FLIGHT_DATE) 
	VALUES ('10:00:00', '14:00:00', 'International Flyers', 100001, '10001', '1996-08-23'),
	 ('15:00:00', '22:00:00', 'International Flyers', 100002, '10001', '1996-08-23'),
	 ('10:31:00', '14:31:00', 'International Flyers', 100003, '10001', '2020-05-01'),
	 ('11:31:00', '15:00:00', 'International Flyers', 100004, '10001', '2020-05-04'),
	 ('13:00:00', '14:00:00', 'Hollywood_flyers', 1003, '10002', '2020-05-01'),
	 ('10:00:00', '14:00:00', 'International Flyers', 100005, '10001', '2020-05-06'),
	 ('15:00:00', '22:00:00', 'International Flyers', 100006, '10001', '2020-05-06'),
	 ('15:10:00', '23:00:00', 'Tango', 10007, 'N721AA', '2020-05-06'),
	 ('13:31:00', '15:00:00', 'United_flyers', 1010, '252', '2020-04-26'),
	 ('16:32:00', '18:00:00', 'United_flyers', 1011, '252', '2020-04-26'),
	 ('07:35:00', '11:31:00', 'The Southerners', 1001, 'A8G', '2020-04-26'),
	 ('04:45:00', '09:00:00', 'The Southerners', 1002, 'A8G', '2020-04-27');

INSERT INTO INTERNATIONAL_FLIGHT (FSID) 
	VALUES (10007),
	 (100001),
	 (100002),
	 (100005),
	 (100006);

INSERT INTO INCIDENT_REPORT (INCIDENT_TYPE, SEVERITY_AMOUNT, REPORTED, INVOLVED, FSID) 
	VALUES ('Praise', 5, 1000, 1001, 100001),
	 ('Injury', 1, 1000, 1001, 100005),
	 ('Praise', 3, 1001, 1000, 100002),
	 ('Praise', 2, 1001, 1000, 100006),
	 ('Injury', 2, 1011, 1012, 10007);

INSERT INTO CHARGED_FLIGHT (FSID) 
	 VALUES (1001),
	 (1002),
	 (1003),
	 (1010),
	 (1011);

INSERT into 
CHARGE(FSID, CHARGE_TYPE, CHARGE_AMOUNT)
VALUES (1003, 'Water', '2.50'),
       (1003, 'Blankets', '3.50'),
       (1003, 'Pillows', '5.50'),
       (1001, 'Pillows', '10.00'),(1002, 'Blankets', '3.00'),
       (1010, 'Water', '4.25'),
        (1011, 'Blankets', '5.00');
