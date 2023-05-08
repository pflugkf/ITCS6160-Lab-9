DROP DATABASE IF EXISTS insurance_company;
CREATE DATABASE insurance_company;
USE insurance_company;

CREATE TABLE customer (
	driver_id INT NOT NULL,
    name VARCHAR(45) NOT NULL,
    address VARCHAR(50),
    PRIMARY KEY (driver_id)
);

CREATE TABLE car (
	license VARCHAR(10) NOT NULL,
    model VARCHAR(45) NOT NULL,
    year INT,
    owner_id INT,
    PRIMARY KEY (license),
    FOREIGN KEY (owner_id) REFERENCES customer(driver_id)
);

CREATE TABLE accident (
	report_number VARCHAR(10) NOT NULL,
    date DATE NOT NULL,
    location VARCHAR(50),
    PRIMARY KEY (report_number)
);

CREATE TABLE car_accident (
	driver_id INT NOT NULL,
    license VARCHAR(10) NOT NULL,
    report_number VARCHAR(50),
    damage_amount INT,
    PRIMARY KEY (driver_id, license, report_number),
    FOREIGN KEY (driver_id) REFERENCES customer(driver_id),
    FOREIGN KEY (license) REFERENCES car(license),
    FOREIGN KEY (report_number) REFERENCES accident(report_number)
);

INSERT INTO customer VALUE (252867543, 'Kristin Pflug', '444 Walden Station Drive, Charlotte, NC');
INSERT INTO customer VALUE (386575309, 'Jane Doe', '1 University Way, Cullowhee, NC');

INSERT INTO car VALUE ('VIN-8493', 'Toyota Prius', 2007, 252867543);
INSERT INTO car VALUE ('SVR-2528', 'Mazda Protege', 2001, 252867543);
INSERT INTO car VALUE ('AMV-5913', 'Toyota Corolla', 2020, 386575309);

INSERT INTO accident VALUE (8675309213, '2014-04-03', 'Raleigh, NC');

INSERT INTO car_accident VALUE (252867543, 'SVR-2528', 8675309213, 500);