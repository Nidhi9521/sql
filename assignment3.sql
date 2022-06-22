CREATE TABLE student(
studentId INTEGER PRIMARY KEY UNIQUE NOT NULL,
name TEXT);

CREATE TABLE studentDetail(
studentDetailId INTEGER PRIMARY KEY NOT NULL UNIQUE,
studentId INTEGER,
standard INTEGER,
gender TEXT,
FOREIGN KEY(studentId) REFERENCES student(studentId))

CREATE TABLE studentPresent(
studentPresentId INTEGER PRIMARY KEY,
studentId INTEGER,
month Text,
present TEXT,
FOREIGN key (studentId) REFERENCES student(studentId)
);

CREATE TABLE studentHours(
studentHoursId INTEGER PRIMARY KEY UNIQUE ,
studentId INTEGER,
datex date,
hours INTEGER,
FOREIGN KEY (studentId) REFERENCES student(studentId))

CREATE TABLE product(
productId INTEGER PRIMARY KEY UNIQUE,
name TEXT)

CREATE TABLE productPrice(
productPriceId INTEGER PRIMARY KEY UNIQUE,
productId INTEGER,
code TEXT,
effectiveDate date,
price NUMERIC,
FOREIGN KEY (productId) REFERENCES product(productId));


INSERT into student (studentId,name) VALUES(6,'asd'),
(2,'basd'),
(3,'casd'),
(4,'dasd'),
(5,'easd');

SELECT * from student


INSERT into studentDetail (studentDetailId,studentId,standard,gender) VALUES (7,1,10,'female'),
(2,1,5,'male'),
(3,4,6,'female'),
(4,3,7,'male'),
(5,2,8,'female'),
(6,1,9,'male');

SELECT * from studentDetail

INSERT INTO studentPresent (studentPresentId,studentId,month,present) VALUES (1,1,2,30),
(2,1,2,26),
(3,2,1,30),
(4,3,9,28),
(5,4,4,19),
(6,5,5,25);


insert into studentHours (studentHoursId,studentId,datex,hours)
VALUES
(1,1,'2022-05-06',8),
(2,2,'2022-05-06',10),
(3,3,'2022-05-07',9),
(4,4,'2022-05-08',6),
(5,5,'2022-05-09',5);
SELECT * from studentHours


UPDATE student set name="radha" where studentId=3

UPDATE student set name='A.'||name

INSERT INTO "main"."product" ("productId", "name") VALUES ('1', 'apple');
INSERT INTO "main"."product" ("productId", "name") VALUES ('2', 'orange');
INSERT INTO "main"."product" ("productId", "name") VALUES ('3', 'grapes');
INSERT INTO "main"."product" ("productId", "name") VALUES ('4', 'mangoes');

INSERT INTO "main"."productPrice" ( "productId", "code", "effectiveDate", "price") VALUES 
('2', 'AB', '2022-06-28', '500'),
( '3', 'ABC', '2022-07-01', '800'),
( '4', 'CD', '2022-08-05', '900'),
('1', 'EF', '2022-09-19', '1000'),
('2', 'HI', '2022-10-20', '1200');



UPDATE productPrice set price=price+25;

UPDATE product set 
name=name||'A'  where productId=(select productId from productPrice where code='AB');

UPDATE studentPresent set 
present=present+2  where studentId=(select studentId from studentHours where hours>=8);

DELETE from product WHERE productId=3