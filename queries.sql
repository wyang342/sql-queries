select * from classes;
select name, credits from classes where credits > 3;
select * from classes where credits % 2 = 0;
select * from enrollments where student_id = 1 and grade is null;

select student_id, class_id, grade from enrollments
inner join students on enrollments.student_id = students.id
where first_name='Tianna' and grade is null;

select classes.name from enrollments
inner join students on enrollments.student_id = students.id
inner join classes on enrollments.class_id = classes.id
where first_name='Tianna' and grade is null;

select first_name, last_name, birthdate from students
where (first_name ilike '%t%' or last_name ilike '%t%') -- can use () in SQL
and birthdate < Date('1986-1-1');  -- Date must have year, month, date

select avg(age(birthdate)) from students;

select line_1, city, state, zipcode from addresses
where city like '% %';

select first_name, last_name, line_1, city, state, zipcode from students
inner join addresses on students.address_id = addresses.id
where city like '% %';

select avg(credits) from classes;

select first_name, last_name from students
inner join enrollments on students.id = enrollments.student_id
where grade = 'A';

select students.first_name, sum(classes.credits) as credits_enrolled
from students
inner join enrollments on students.id = enrollments.student_id
inner join classes on enrollments.class_id = classes.id
group by students.first_name;

select students.first_name, students.last_name, sum(classes.credits)
from students
inner join enrollments on students.id = enrollments.student_id
inner join classes on classes.id = enrollments.class_id
where enrollments.grade is not null
group by students.first_name, students.last_name;
-- group by X, Y means put all those with the same values for both X and Y in the one group.

select students.first_name, students.last_name, classes.name as class_name
from students
inner join enrollments on students.id = enrollments.student_id
inner join classes on classes.id = enrollments.class_id;

select * from students
where students.birthdate >= '1982-01-01'::date
and students.birthdate <= '1985-12-31'::date;

insert into enrollments(student_id, class_id, grade)
values (5, 4, 'A');