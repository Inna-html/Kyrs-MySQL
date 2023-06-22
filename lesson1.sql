use innaHTML;

show databases ; /* показывает все таблицы */

show tables ;

create table users( /* создает таблицу users */
    id int primary key not null auto_increment,
    name varchar(20) not null ,
    age int not null, 
    gender varchar(6)
);

select * from users; /* выбирает таблицу users */

drop table users; /* удаляет таблицу users */

select * from users ;

insert into users values (null, 'max', 15, 'male' ); /* добавить */

select id, name from users;

select * from users where name 'oleg';

select * from users where name like 'o%'; /* выберет всех юзерев где есть первая о */

select * from users where name like '%o%'; /* чтоб была буква о*/

select * from users where name like '_o%'; /* пропускает букву и ищет с о и другие */

select * from users where age=20;
select * from users where age>=20;
select * from users where age<=20;
select * from users where age!=20;

select * from users where age between 20 and 30;
select * from users where age>=20 and age<=30;
select * from users where age>=20 and age<=30 or name='max';

select * from users where age in (20, 30, 40);

select * from users where length(name) = 4;

select * from users order by name asc; /* сортироватие по алфавиту*/

select * from users order by name desc; /* сортировка имени в обратном алфавитном порядке */

select * from users where length(name) = 4 order by name dasc; 
/* сортировка имени по количеству букв и в обратном порядке */

select * from users where length(name) = 4 order by age dasc; 
/* сортировка имени по количеству букв и в обратном порядке по возрасту на меньше*/

select * from users where length(name) = 4 and gender='female' order by age dasc; 
/* сортировка имени по количеству букв женщин и в обратном порядке по возрасту*/

select * from users limit 2 ; /* выдача юзеров по 2*/
select * from users limit 2  offset 2; /* выдача 2 через 2*/


select max(age) as max_age from users; 
/* максим возраст {'max(age)':50}*/

select min(age) as min_age from users; 
select Sum(age) from users; 

select avg(age) from users; 
/* среднее арифметич */

select count(*) from users;
/* подсчитать всех */

select count(*), gender from users group by gender;
/* подсчитать два поля муж и жен */

select sum(age), gender from users group by gender;
/* подсчитать сумму всех по гендеру */

/* ========================================================================================== */

select * from cars where years>2020;

select count(*) as count, model from cars where years>2020 group by model;

select count(*) as count, model from cars where years>2020 group by model order by count dasc limit 1;

select count(*) as count, model from cars where years>2020 group by model having count=4;
/*  having вместо where */

/* ===========================================================================================*/ 

select * from users ;

delete from users where name='oleh';

update users set name='kira', gender='female' where id=9;


