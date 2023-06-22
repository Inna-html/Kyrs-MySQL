select distinct name from users ;
/* имена без повторов */

select distinct name from users 
union
select avg(age) from users;
/* среднее арифмет от юзеров*/

/* ======================================================================= */

select * from client;
select * from department;

select * from c join department on d.idDepartment = c.Department_idDepartment;

select * from c join department on d.idDepartment = c.Department_idDepartment where DepartmentCity='london'

select c.*, from c join department d on d.idDepartment = c.Department_idDepartment where DepartmentCity='london';


create table cities 
(
    id int primary key not null auto_increment,
    city varchar(20) not null
);

create table users 
(
    id int primary key not null auto_increment,
    name varchar(20) not null,
    age int not null,
    city_id int null,
    foreign key (city_id) references cities (id)
);

select * from cities join users u on cities.id = u.city_id

select * from users join cities c onc.id = users.city_id;


select * from users  join cities c on c.id = users.city_id;
select * from users left join cities c on c.id = users.city_id;
/* left rigth какая таблица главнее */

/* =================================================================== */

select * from cars where price>(select avg(price) from cars);


select * from client 
    join department d on d.idDepartment = client.Department_idDepartment
    join application a on client.idClient = a.Client_idClient ;




select * from cars where model='kia' and year<2000;


