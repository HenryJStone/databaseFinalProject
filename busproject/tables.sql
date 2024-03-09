/*
Henry Stone
CPSC 321
Final project table creations
WIP
*/

/*
creating the tables
*/
DROP TABLE IF EXISTS current_buses;
DROP TABLE IF EXISTS routes;
DROP TABLE IF EXISTS buses;
DROP TABLE IF EXISTS stops;

CREATE TABLE stops (
    stop_num INT,
    stop_names VARCHAR(50),
    city_area VARCHAR(20),
    PRIMARY KEY (stop_num)
);

CREATE TABLE buses (
    bus_num INT,
    bus_model VARCHAR(20) NOT NULL,
    total_seats INT NOT NULL,
    PRIMARY KEY (bus_num)
);

CREATE TABLE routes (
    route_num INT,
    stop1 INT NOT NULL,
    stop2 INT NOT NULL,
    stop3 INT NOT NULL,
    stop4 INT NOT NULL,
    stop5 INT NOT NULL,
    stop6 INT NOT NULL,
    stop7 INT NOT NULL,
    stop8 INT NOT NULL,
    stop9 INT NOT NULL,
    stop10 INT NOT NULL,
    PRIMARY KEY (route_num),
    FOREIGN KEY (stop1) REFERENCES stops(stop_num),
    FOREIGN KEY (stop2) REFERENCES stops(stop_num),
    FOREIGN KEY (stop3) REFERENCES stops(stop_num),
    FOREIGN KEY (stop4) REFERENCES stops(stop_num),
    FOREIGN KEY (stop5) REFERENCES stops(stop_num),
    FOREIGN KEY (stop6) REFERENCES stops(stop_num),
    FOREIGN KEY (stop7) REFERENCES stops(stop_num),
    FOREIGN KEY (stop8) REFERENCES stops(stop_num),
    FOREIGN KEY (stop9) REFERENCES stops(stop_num),
    FOREIGN KEY (stop10) REFERENCES stops(stop_num)
);

CREATE TABLE current_buses (
    bus_num INT,
    min_late INT NOT NULL,
    open_seats INT NOT NULL,
    route_num INT NOT NULL,
    PRIMARY KEY (bus_num),
    FOREIGN KEY (bus_num) REFERENCES buses(bus_num),
    FOREIGN KEY (route_num) REFERENCES routes(route_num)
);

/*
now the code to populate the tables
*/

-- Insert data into stops table with realistic names
INSERT INTO stops (stop_num, stop_names, city_area)
VALUES
    (1, 'Main Street Station', 'Downtown'),
    (2, 'Oakwood Park', 'Suburb'),
    (3, 'Financial District Square', 'Financial District'),
    (4, 'Industrial Zone Hub', 'Industrial Area'),
    (5, 'Maplewood Residential Area', 'Residential'),
    (6, 'Harbor View', 'Waterfront'),
    (7, 'Tech Park', 'Tech District'),
    (8, 'University Campus', 'Academic'),
    (9, 'Green Valley Mall', 'Shopping District'),
    (10, 'Sunset Beach', 'Seaside'),
    (11, 'Art Gallery District', 'Arts'),
    (12, 'Sports Arena', 'Sports'),
    (13, 'Civic Center Plaza', 'Civic Center'),
    (14, 'Fashion Avenue', 'Shopping District'),
    (15, 'Hillside Gardens', 'Residential'),
    (16, 'Tech Innovation Center', 'Tech District'),
    (17, 'Central Park', 'City Park'),
    (18, 'Historic District Square', 'Historic'),
    (19, 'Waterfront Promenade', 'Waterfront'),
    (20, 'Business Hub', 'Financial District'),
    (21, 'Museum Row', 'Arts'),
    (22, 'Suburban Square', 'Suburb'),
    (23, 'Medical Center', 'Health'),
    (24, 'Fashion Mall', 'Shopping District'),
    (25, 'Lakeside Retreat', 'Residential'),
    (26, 'Innovation Hub', 'Tech District'),
    (27, 'City Zoo', 'Recreation'),
    (28, 'Historic Landmark Square', 'Historic'),
    (29, 'Harbor Walk', 'Waterfront'),
    (30, 'Financial Plaza', 'Financial District');

-- Insert data into buses table
INSERT INTO buses (bus_num, bus_model, total_seats)
VALUES
    (101, 'Model X', 50),
    (102, 'Model Y', 40),
    (103, 'Model Z', 30),
    (104, 'City Express', 45),
    (105, 'Suburban Shuttle', 35),
    (106, 'EcoTransporter', 50),
    (107, 'Luxury Liner', 30),
    (108, 'Tech Transit', 40),
    (109, 'Express Cruiser', 55),
    (110, 'Family Mover', 25),
    (111, 'City Voyager', 38),
    (112, 'Urban Explorer', 42),
    (113, 'Metro Sprinter', 40),
    (114, 'Green Commuter', 35),
    (115, 'Tech Innovator', 32),
    (116, 'EcoShuttle', 48),
    (117, 'Executive Shuttle', 28),
    (118, 'Leisure Cruiser', 30),
    (119, 'Business Class', 40),
    (120, 'Rapid Transit', 45),
    (121, 'Sleek Transporter', 48),
    (122, 'Urban Voyager', 40),
    (123, 'EcoMax Shuttle', 32),
    (124, 'City Cruiser XL', 50),
    (125, 'Executive Express', 28),
    (126, 'Innovative Commuter', 35),
    (127, 'Green EcoShuttle', 45),
    (128, 'Leisure Liner', 30),
    (129, 'Tech Explorer', 42),
    (130, 'Metro Sprinter II', 40),
    (131, 'City Express', 45),
    (132, 'Rapid Transporter', 40),
    (133, 'EcoFriendly Cruiser', 38),
    (134, 'Executive Voyager', 28),
    (135, 'City Connect', 33),
    (136, 'Urban Shuttle', 38),
    (137, 'Innovative Cruiser', 32),
    (138, 'Green Explorer', 50),
    (139, 'Leisure Cruiser II', 30),
    (140, 'Tech Commuter', 40),
    (141, 'City Express', 45),
    (142, 'Rapid Transporter', 40),
    (143, 'EcoFriendly Cruiser', 38),
    (144, 'Executive Voyager', 28),
    (145, 'City Connect', 33),
    (146, 'Urban Shuttle', 38),
    (147, 'Innovative Cruiser', 32),
    (148, 'Green Explorer', 50),
    (149, 'Leisure Cruiser II', 30),
    (150, 'Tech Commuter', 40),
    (151, 'City Express', 45),
    (152, 'Rapid Transporter', 40),
    (153, 'EcoFriendly Cruiser', 38),
    (154, 'Executive Voyager', 28),
    (155, 'City Connect', 33),
    (156, 'Urban Shuttle', 38),
    (157, 'Innovative Cruiser', 32),
    (158, 'Green Explorer', 50),
    (159, 'Leisure Cruiser II', 30),
    (160, 'Tech Commuter', 40);


-- Insert data into routes table
INSERT INTO routes (route_num, stop1, stop2, stop3, stop4, stop5, stop6, stop7, stop8, stop9, stop10)
VALUES
    (1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
    (2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2),
    (3, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4),
    (4, 2, 4, 6, 8, 10, 1, 3, 5, 7, 9),
    (5, 9, 8, 7, 6, 5, 4, 3, 2, 1, 10),
    (6, 7, 3, 10, 6, 5, 2, 9, 8, 4, 1),
    (7, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1),
    (8, 2, 4, 6, 8, 10, 1, 3, 5, 7, 9),
    (9, 5, 6, 8, 10, 1, 2, 3, 4, 7, 9),
    (10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
    (11, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
    (12, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2),
    (13, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4),
    (14, 2, 4, 6, 8, 10, 1, 3, 5, 7, 9),
    (15, 9, 8, 7, 6, 5, 4, 3, 2, 1, 10),
    (16, 7, 3, 10, 6, 5, 2, 9, 8, 4, 1),
    (17, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1),
    (18, 2, 4, 6, 8, 10, 1, 3, 5, 7, 9),
    (19, 5, 6, 8, 10, 1, 2, 3, 4, 7, 9),
    (20, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
    (21, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1),
    (22, 1, 3, 5, 7, 9, 2, 4, 6, 8, 10),
    (23, 7, 4, 1, 8, 5, 2, 9, 6, 3, 10),
    (24, 10, 8, 6, 4, 2, 9, 7, 5, 3, 1),
    (25, 3, 5, 7, 9, 2, 4, 6, 8, 10, 1),
    (26, 1, 4, 7, 10, 5, 8, 3, 6, 9, 2),
    (27, 6, 9, 3, 8, 1, 4, 7, 10, 2, 5),
    (28, 2, 5, 8, 1, 4, 7, 10, 3, 6, 9),
    (29, 9, 7, 5, 3, 1, 8, 6, 4, 2, 10),
    (30, 10, 8, 6, 4, 2, 9, 7, 5, 3, 1);

-- Insert data into current_buses table
INSERT INTO current_buses (bus_num, min_late, open_seats, route_num)
VALUES
    (101, 5, 10, 25),
    (102, 10, 15, 2),
    (103, 8, 5, 10),
    (104, 7, 20, 30),
    (105, 12, 8, 23),
    (106, 3, 25, 30),
    (107, 15, 12, 22),
    (108, 6, 18, 2),
    (109, 9, 7, 1),
    (110, 8, 15, 1),
    (111, 4, 20, 2),
    (112, 11, 10, 3),
    (113, 9, 5, 1),
    (114, 11, 12, 3),
    (115, 7, 15, 2),
    (116, 5, 10, 22),
    (117, 12, 10, 2),
    (118, 8, 18, 3),
    (119, 10, 7, 13),
    (120, 6, 22, 2),
    (121, 7, 15, 2),
    (122, 12, 10, 26),
    (123, 6, 18, 3),
    (124, 10, 7, 18),
    (125, 6, 22, 29),
    (126, 8, 15, 14),
    (127, 4, 20, 20),
    (128, 11, 10, 3),
    (129, 9, 5, 1),
    (130, 11, 12, 3),
    (131, 7, 15, 2),
    (132, 6, 22, 2),
    (133, 8, 15, 13),
    (134, 4, 20, 2),
    (135, 11, 10, 9),
    (136, 9, 5, 1),
    (137, 11, 12, 23),
    (138, 7, 15, 2),
    (139, 6, 22, 22),
    (140, 8, 15, 1);
