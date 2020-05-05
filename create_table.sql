-- State Table
CREATE TABLE states (
    state_name VARCHAR(20) NOT NULL,
    CONSTRAINT state_pk PRIMARY KEY(state_name)
);

-- City Table 
CREATE TABLE city(
    state_name VARCHAR(20) NOT NULL,
    city_name VARCHAR(20) NOT NULL,
    cid INTEGER NOT NULL,
    CONSTRAINT city_pk PRIMARY KEY(cid),
    CONSTRAINT state_city_fk FOREIGN KEY(state_name)
    REFERENCES states(state_name)
);

-- Airport Table
CREATE TABLE airport(
    airport_name VARCHAR(60) NOT NULL,
    FAA_approved_abbreviation VARCHAR(20) NOT NULL,
    cid INTEGER NOT NULL,
    CONSTRAINT airport_pk PRIMARY KEY(airport_name),
    CONSTRAINT airport_city_fk FOREIGN KEY(cid)
    REFERENCES city(cid)
);

-- Flight Type
CREATE TABLE FlightType(
    flight_type VARCHAR(20) not null,
    CONSTRAINT flight_type_pk PRIMARY KEY(flight_type)
);

-- Airline Table
CREATE TABLE airline(
    aid INTEGER NOT NULL,
    airline_name VARCHAR(50) NOT NULL,
    flight_type VARCHAR(20) NOT NULL,
    cid INTEGER NOT NULL,
    CONSTRAINT airline_pk PRIMARY KEY(aid),
    CONSTRAINT airline_city_fk FOREIGN KEY(cid)
    REFERENCES city(cid),
    CONSTRAINT airline_flight_type_fk FOREIGN KEY(flight_type)
    REFERENCES FlightType(flight_type)
);

-- Airport-airline table
CREATE TABLE airport_airline
(
    airport_name VARCHAR(60) NOT NULL,
    aid INTEGER NOT NULL,
    CONSTRAINT airport_airline_pk PRIMARY KEY(airport_name, aid),
    CONSTRAINT airport_airline_airport_fk FOREIGN KEY(airport_name)
    REFERENCES airport(airport_name),
    CONSTRAINT airport_airline_airline_fk FOREIGN KEY(aid)
    REFERENCES airline(aid)
);

-- Airplane Table
CREATE TABLE airplane(
    manufacturer VARCHAR(20) NOT NULL,
    model_number INTEGER NOT NULL,
    passenger_maximum INTEGER NOT NULL,
    tail_number varchar(20) NOT NULL,
    plane_name VARCHAR(20) NOT NULL,
    date_manufactured DATE NOT NULL,
    aid INTEGER NOT NULL,
    CONSTRAINT airplane_pk PRIMARY KEY(tail_number),
    CONSTRAINT airplane_airline_fk FOREIGN KEY(aid)
    REFERENCES airline(aid)
);

-- Flight Schedule table
CREATE TABLE flight_schedule(
    fsid INTEGER NOT NULL,
    arrival_time time NOT NULL,
    departure_time time NOT NULL,
    arrival_airport VARCHAR(60) NOT NULL,
    departure_airport VARCHAR(60) NOT NULL,
    flight_number VARCHAR(20) NOT NULL,
    CONSTRAINT flight_schedule_pk PRIMARY KEY(fsid),
    CONSTRAINT flight_schedule_fk_arrival FOREIGN KEY(arrival_airport)
    REFERENCES airport(airport_name),
    CONSTRAINT flight_schedule_fk_departure FOREIGN KEY(departure_airport)
    REFERENCES airport(airport_name)
);

-- charged flight table
CREATE TABLE charged_flight(
    fsid INTEGER NOT NULL,
    CONSTRAINT charged_flight_pk PRIMARY KEY(fsid),
    CONSTRAINT charge_flight_flight_schedule_fk FOREIGN KEY(fsid)
    REFERENCES flight_schedule(fsid)
);

-- international flight
CREATE TABLE international_flight(
    fsid INTEGER NOT NULL,
    CONSTRAINT charge_flight_pk PRIMARY KEY(fsid),
    CONSTRAINT international_flight_flight_schedule_fk FOREIGN KEY(fsid)
    REFERENCES flight_schedule(fsid)
);


-- chargeType
CREATE TABLE chargeType(
    chargeType VARCHAR(20) NOT NULL,
    CONSTRAINT chargeType_pk primary key(chargeType)
); 

-- CHARGE TABLE
CREATE TABLE charge(
    fsid INTEGER NOT NULL,
    charge_type VARCHAR(20) NOT NULL,
    charge_amount VARCHAR(20) NOT NULL,
    CONSTRAINT charge_pk PRIMARY KEY(fsid, charge_type),
    constraint charge_charge_type_fk foreign key(charge_type)
    references chargeType(chargeType),
    CONSTRAINT charge_charge_flight_fk FOREIGN KEY(fsid)
    REFERENCES charged_flight(fsid)
);

-- Flight Crew
CREATE TABLE flight_crew
(
    flight_crew_name VARCHAR(20) NOT NULL,
    CONSTRAINT flight_crew_pk PRIMARY KEY(flight_crew_name)
);

-- Flight table
CREATE TABLE flight(
    flight_departure_time TIME NOT NULL,
    final_arrival_time TIME NOT NULL,
    flight_crew_name VARCHAR(20) NOT NULL,
    fsid INTEGER NOT NULL,
    tail_number VARCHAR(20) NOT NULL, 
    flight_date DATE NOT NULL,
    CONSTRAINT flight_pk PRIMARY KEY(fsid),
    CONSTRAINT flight_crew_fk FOREIGN KEY(flight_crew_name)
    REFERENCES flight_crew(flight_crew_name),
    CONSTRAINT flight_airplane_fk FOREIGN KEY(tail_number)
    REFERENCES airplane(tail_number),
    CONSTRAINT flight_schedule_flight_fk FOREIGN KEY(fsid)  
    REFERENCES flight_schedule(fsid)
);

-- Crew Member
CREATE TABLE crew_member(
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    aid INTEGER NOT NULL,
    dob DATE NOT NULL,
    FAA_number VARCHAR(20) NOT NULL,
    cmid INTEGER NOT NULL,
    CONSTRAINT crew_member_pk PRIMARY KEY(cmid),
    CONSTRAINT crew_member_airline_fk FOREIGN KEY(aid)
    REFERENCES airline(aid)
);

-- Pilot 
CREATE TABLE pilot(
    CMID INTEGER NOT NULL,
    hourOfExperience INTEGER NOT NULL,
    flight_crew_name VARCHAR(20),
    CONSTRAINT pilot_pk PRIMARY KEY(CMID),
    CONSTRAINT pilot_fk FOREIGN KEY(CMID)
    REFERENCES crew_member(cmid),
    CONSTRAINT pilot_flight_crew FOREIGN KEY(flight_crew_name)
    REFERENCES flight_crew(flight_crew_name)
);

-- Flight Attendant
CREATE TABLE flight_attendant(
    cmid INTEGER NOT NULL,
    flight_crew_name VARCHAR(20),
    CONSTRAINT flight_attendant_pk PRIMARY KEY(cmid),
    CONSTRAINT flight_attendant_fk FOREIGN KEY(cmid)
    REFERENCES crew_member(cmid),
    CONSTRAINT flight_attendant_flight_crew FOREIGN KEY(flight_crew_name)
    REFERENCES flight_crew(flight_crew_name)
);

-- Navigator
CREATE TABLE navigator(
    cmid INTEGER NOT NULL,
    flight_crew_name VARCHAR(20) ,
    CONSTRAINT navigator_pk PRIMARY KEY(cmid),
    CONSTRAINT navigator_fk FOREIGN KEY(cmid)
    REFERENCES crew_member(cmid),
    CONSTRAINT navigator_flight_crew_fk FOREIGN KEY(flight_crew_name)
    REFERENCES flight_crew(flight_crew_name)
);

-- Co-pilot
CREATE TABLE co_pilot(
    cmid INTEGER NOT NULL,
    flight_crew_name VARCHAR(20),
    CONSTRAINT co_pilot_pk PRIMARY KEY(cmid),
    CONSTRAINT co_pilot_fk FOREIGN KEY(cmid)
    REFERENCES crew_member(cmid),
    CONSTRAINT co_pilot_flight_crew_fk FOREIGN KEY(flight_crew_name)
    REFERENCES flight_crew(flight_crew_name)
);

-- Severity Table
CREATE TABLE severity(
    severity_amount INTEGER NOT NULL,
    CONSTRAINT severity_pk PRIMARY KEY(severity_amount)
);

-- Incident Type
CREATE TABLE IncidentType(
    incident_type VARCHAR(20) NOT NULL,
    CONSTRAINT incident_type_pk PRIMARY KEY(incident_type)
);

-- Incident table
CREATE TABLE incident_report(
    incident_type VARCHAR(20) NOT NULL,
    severity_amount INTEGER NOT NULL,
    reported INTEGER NOT NULL,
    involved INTEGER NOT NULL, 
    fsid INTEGER NOT NULL,
    CONSTRAINT incident_report_pk PRIMARY KEY (reported, involved, fsid, incident_type, severity_amount),
    CONSTRAINT incident_report_crew_member_reported_fk FOREIGN KEY(reported)
    REFERENCES crew_member(cmid),
    CONSTRAINT incident_report_crew_member_involved_fk FOREIGN KEY(involved)
    REFERENCES crew_member(cmid),
    CONSTRAINT incident_report_flight_fk FOREIGN KEY(fsid)
    REFERENCES flight(fsid),
    CONSTRAINT incident_report_incident_type_fk FOREIGN KEY(incident_type)
    REFERENCES IncidentType(incident_type),
    CONSTRAINT incident_report_serverity_fk FOREIGN KEY(severity_amount)
    REFERENCES severity(severity_amount)
);
