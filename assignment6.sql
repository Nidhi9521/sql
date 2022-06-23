-   Tables Used:=
    
    -	student  (studentid, name)

    -   studentdetail (studentdetailid, studentid, standard, gender)

    -   studentpresent (studentpresentid, studentid, month, present)

    -   studenthours (studenthoursid, studentid, datex, hours)

    -   product (productid, name)

    -   productprice (productpriceid, productid, code, effdt, price)


-   Write queries for following requirements:

Q-1 Print total number of boys and girls within a single record.
	Fields : Boys, Girls

	Required Output:
	================
	Boys	Girls
	5	3

SELECT (SELECT count(*) from studentDetail WHERE gender='male') as Boys,
(SELECT count(*) from studentDetail WHERE gender='female') as Girls


Q-2 Find total number of Hours for Boys and Girls. 
	Fields : Gender, Present(Hrs)

	Required Output:
	================
	Gender	Present(Hrs)
	Boys	100
	Girls	120

SELECT sum(studentHours.hours),studentDetail.gender 
FROM studentHours INNER JOIN studentDetail 
on studentHours.studentId=studentDetail.studentId GROUP by gender

Q-3 Find all latest prices for each code for each product.
	Fields : Product Name, Code, Date, Price

	Required Output:
	================
	Product Name	Code	Date		Price
	Computer	COMP	2007-01-01	Rs. 24,000/-