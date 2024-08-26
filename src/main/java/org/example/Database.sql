CREATE TABLE Users (
                       username VARCHAR(50) PRIMARY KEY,
                       password VARCHAR(100) NOT NULL,
                       adres VARCHAR (255),
                       functie VARCHAR(50),
                       loonschaal INTEGER CHECK(loonschaal >= 0),
                       vakantiedagen INTEGER CHECK (vakantiedagen >= 0)
);

CREATE TABLE Product (
                         id BIGINT PRIMARY KEY,
                         name VARCHAR(100) NOT NULL,
                         brand VARCHAR(100),
                         price DOUBLE PRECISION CHECK(price >= 0),
                         currentSTock INTEGER CHECK(currentStock >= 0),
                         sold INTEGER CHECK(sold >= 0),
                         dateSold DATE,
                         type VARCHAR(50) NOT NULL);

CREATE TABLE Television (
                            id BIGINT PRIMARY KEY,
                            height DOUBLE PRECISION,
                            width DOUBLE PRECISION,
                            schermKwaliteit VARCHAR (50),
                            schermType VARCHAR(50),
                            wifi BOOLEAN,
                            smartTv BOOLEAN,
                            voiceControl BOOLEAN,
                            HDR BOOLEAN,
                            FOREIGN KEY (id) REFERENCES Product(id));

CREATE TABLE RemoteController (
                                  id BIGINT PRIMARY KEY,
                                  smart BOOLEAN,
                                  batteryType VARCHAR(50),
                                  televisionId BIGINT UNIQUE,
                                  FOREIGN KEY (id) REFERENCES Product (id),
                                  FOREIGN KEY (televisionId) REFERENCES Television(id));

CREATE TABLE CIModule (
                          id BIGINT PRIMARY KEY,
                          provider VARCHAR(100),
                          encoding VARCHAR(50),
                          televisionId BIGINT,
                          FOREIGN KEY (id) REFERENCES Product(id),
                          FOREIGN KEY (televisionId) REFERENCES Television(id));

CREATE TABLE WallBracket (
                             id BIGINT PRIMARY KEY,
                             adjustable BOOLEAN,
                             bevestigingsMethode VARCHAR(100),
                             height DOUBLE PRECISION,
                             width DOUBLE PRECISION,
                             televisionId BIGINT,
                             FOREIGN KEY (id) REFERENCES Product(id),
                             FOREIGN KEY (televisionId) REFERENCES Television(id));

INSERT INTO Users (username, password, adres, functie, loonschaal, vakantiedagen)
VALUES
    ('evelienvissers', 'novirocks123','Novi Street 3', 'Manager', 10, 25),
    ('janjanssen', 'codingrocks123', 'Coding Street 11', 'Developer', 8, 20);

INSERT INTO Product (id, name, brand, price, currentStock, sold, dateSold, type)
VALUES
    (1, 'Model X', 'LG', 765.90, 40, 24, '2024-05-12', 'Television'),
    (2, 'Remote A', 'Sony', 29.90, 50, 27, '2024-06-11', 'RemoteController'),
    (3, 'CI Module Y', 'Ziggo', 69.70, 30, 5, '2024-06-24', 'CIModule'),
    (4, 'WallBracket B', 'Bluebuilt', 95.40, 35, 7, '2024-08-11', 'WallBracket');

INSERT INTO Television (id, height, width, schermKwaliteit, schermType, wifi, smartTv, voiceControl, HDR)
VALUES
    (1, 55.0, 123.5, '4K', 'OLED', TRUE, TRUE, FALSE, TRUE);

INSERT INTO RemoteController (id, smart, batteryType, televisionId)
VALUES
    (2, TRUE, 'AA', 1);

INSERT INTO CIModule (id, provider, encoding, televisionId)
VALUES
    (3, 'KPN', 'MPEG-4', 1);

INSERT INTO WallBracket (id, adjustable, bevestigingsMethode, height, width, televisionId)
VALUES
    (4, TRUE, 'Schroef', 40.0, 60.0, 1);

SELECT * FROM User;
SELECT * FROM Product;
SELECT * FROM Television;
SELECT * FROM RemoteController;
SELECT * FROM CIModule;
SELECT * FROM WallBracket;
