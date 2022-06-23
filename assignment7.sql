Q-1 Write a query which will output 123,456.78(as string datatype) for the input value of 123456.77912.
SELECT cast('123456.77912' as text)

Q-2 Write a query to find position of letter 'd' in the string 'abcdefgh'.
SELECT instr('abcdefgh','d')

Q-3 Write a query which will output "hello world" for input string "Hello World".
select lower('Hello World')

Q-4 Write a query to find 3 characters from the left of any given string.
select substr('hello world',1,3)

Q-5 Write a query to find 3 characters from the right of any given string.
select substr('hello world',-1,-3)

Q-6 Write a query which will return length of any given string.
SELECT length('hello world')

Q-7 Write a query which will output "------abcd" for input string "abcd".
SELECT '------'||'abcd'

Q-8 Write a query which will output "abcd......" for input string "abcd".
SELECT 'abcd'||'.......'

Q-9 Write a query which will output "abcd  " for input string "  abcd  ".
SELECT ltrim('    abcd      ')

Q-10 Write a query which will output "  abcd" for input string "  abcd  ".
SELECT rtrim('    abcd      ')

Q-11 Write a query which will output "is" for input string "The weather is very nice.".
SELECT substr('The weather is very nice.',12,3)

Q-12 Write a query which will output "hellohellohello" for input string "hello".


Q-13 Write a query which will output ".ecin yrev si rehtaew ehT" for input string "The weather is very nice.".


Q-14 Explain the use of function SOUNDEX().
SELECT soundex('hello'),soundex('helllq');

Q-15 Write a query which will output "is very nice." for input string "The weather is very nice.".
SELECT substr('The weather is very nice.',12,20);

Q-16 Explain the use of TRIM function.
SELECT trim('          The weather is very nice.          ');