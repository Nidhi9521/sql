CREATE TABLE student_details(
name TEXT,
standard NUMERIC,
sex Text,
monthly_persent TEXT,
daily_hours NUMERIC);

CREATE TABLE products(
name TEXT,
price NUMERIC
);

CREATE TABLE materials(
name TEXT,
price NUMERIC);


INSERT INTO student_details(name,standard,sex,monthly_persent,daily_hours) VALUES
('nasd',4,'female',50,8);

INSERT INTO student_details(name,standard,sex,monthly_persent,daily_hours) VALUES
('nasd',4,'female',50,8),
('aasd',3,'female',40,4),
('basd',6,'male',80,5),
('casd',7,'female',70,9),
('sasd',2,'male',90,10);

INSERT INTO materials (name,price) VALUES('asd','500')
INSERT INTO materials (name,price) VALUES('asd','RS.000')
INSERT INTO materials (name,price) VALUES('asd','RS.500')

SELECT * FROM student_details;
SELECT * from products;
SELECT * from materials;

DELETE from student_details where standard=4;
DELETE from products;