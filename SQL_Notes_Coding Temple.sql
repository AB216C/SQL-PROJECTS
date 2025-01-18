
-- DDL(Data Definition Language)----------
CREATE DATABASE SQL_CODES;
USE SQL_CODES;


-- Instructors Table
CREATE TABLE instructors (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- TO CREATE ONE TO MANY CONNECTION BETWEEN INSTRUCTORS VS STUDENTS, instructor_id will need to be added to the StudentS Table
-- Plus, Students table will need to declare that it has a foreign key(instructure_id) and where it came from instructor(id)
-- ONE DELETE SET NULL: IF Instructor_id is deleted from Instructor table, Null will be recorded in a students Table as new instructor_id  instead of a number
-- ON UPDATE CASCADE: In case Instructor id is updated to a different number, Students attached to the instructor will automatically receive a new id


CREATE TABLE students (
	id INT auto_increment PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    enrollment_date DATE,
    instructors_id INT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (instructors_id) REFERENCES instructors(id)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);


-- Courses Table
CREATE TABLE courses (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- There is no need to insert foreign key in course table because foreign Key there is a table reserved for it since we expect
-- many to many relationship between students and courses
-- CREATING courses and students table(Many-to-Many relationship)
-- Courses_students table (Many-to-Many Relationship)

CREATE TABLE courses_students (
	student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (course_id) REFERENCES courses(id)
		ON DELETE CASCADE
        ON UPDATE CASCADE);


-- Add a new column to a table

ALTER TABLE instructors ADD office_location VARCHAR(100);

-- Change a data type of a column

ALTER TABLE instructors MODIFY department VARCHAR(70);

-- Rename a column and update its datatype

ALTER TABLE instructors CHANGE COLUMN name instructors_name VARCHAR(100);

-- Renaming a Table

RENAME TABLE courses TO MY_COURSES;
RENAME TABLE MY_COURSES TO courses;

-- Dropping a column(Deleting a column)

ALTER TABLE instructors DROP COLUMN office_location;

-- Add a foreign key to link a table

ALTER TABLE students ADD COLUMN advisor_id INT,
  ADD CONSTRAINT fk_student_advisor FOREIGN KEY(advisor_id) REFERENCES instructors(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE;
        

-- DML(Data Manupulation Language)
-- CRUD(Create, Read, Update, delete)

-- Insert Instructors
INSERT INTO instructors (instructors_name, department) VALUES
	("John Doe", "Computer Science"),
    ("Jane Smith", "Data Science"),
	('Mark Taylor', 'Web Development'),
    ('Emily Davis', 'Mobile Development'),
    ('Laura Brown', 'Cybersecurity');


-- Insert Students
INSERT INTO students (name, enrollment_date, instructors_id) VALUES
	('Alice Johnson', "2023-09-10", 1),
	('Bob Carter', '2023-09-10', 2),
    ('Charlie Miller', '2023-09-15', 3),
    ('Diana Lee', '2023-09-20', 4),
    ('Evan White', '2023-09-25', NULL);
    


INSERT INTO courses (title, credits) VALUES
	('Introduction to Programming', 3),
	('Data Structures', 4),
    ('Web Development Fundamentals', 3),
    ('Mobile App Development', 3),
    ('Cybersecurity Basics', 2);



INSERT INTO courses_students (student_id, course_id) VALUES
	(1, 1), (1, 2),
	(2, 2), (2, 3),
    (3, 3), (3, 4),
    (4, 4), (4, 5),
    (5, 1), (5, 5);


-- UPDATE instructor's department



UPDATE instructors
SET department = "Full Stack Software Development"
WHERE id = 1;


-- UPDATE STUDENT'S NAME

UPDATE students
SET name = "Mary"
WHERE id = 2;



-- DELET A SPECIFIC STUDENT FROM A DATABASE

DELETE FROM students
WHERE id = 3;

select * from students;


-- DQL (Data Query Language)

-- list of students and order by enrollment dates
SELECT * FROM students
ORDER BY enrollment_date DESC;


-- Find students with name contain "Evan"

SELECT * FROM students 
WHERE name LIKE '%Evan%';

-- Finding courses with title starts with 'I'
SELECT * FROM courses
WHERE title LIKE 'I%';

-- Finding students with name starts with '_lic'
-- Underscore(_) signify a name can start with one character plus lic. Alice, Kalica

SELECT * FROM students
WHERE  name like '_lic%';

-- BONUS-iNNER_QUERRIES

SELECT course_id FROM courses_students  WHERE student_id = 1;

SELECT * FROM courses 
WHERE id IN (
SELECT course_id FROM courses_students  WHERE student_id = 1);

-- SELECT ALL INSTRUCTORS WITH THEIR STUDENTS
-- There is one to many relationship between instructors and students
SELECT i.instructors_name AS instructor, s.name AS student  FROM 
instructors i LEFT JOIN students s
ON i.id = s.instructors_id;


SELECT i.instructors_name, s.name  FROM 
instructors i LEFT JOIN students s
ON i.id = s.instructors_id;


SELECT *  FROM 
instructors i LEFT JOIN students s
ON i.id = s.instructors_id;

-- SELECT ALL STUDENTS WITH THEIR ENROLLMENT COURSE

SELECT s.name, c.title from students s
JOIN courses_students cs ON s.id = cs.student_id
JOIN courses c ON cs.course_id = c.id;


SELECT * from students s
JOIN courses_students cs ON s.id = cs.student_id
JOIN courses c ON cs.course_id = c.id;

-- COUNT THE NUMBER OF STUDENTS per INSTRUCTOR

SELECT i.instructors_name AS Instructor, COUNT(s.id) AS StudentCount
FROM instructors i
LEFT JOIN students s ON i.id = s.instructors_id
GROUP BY i.instructors_name;


-- Find Courses Taken by Students Under a Specific Instructor
SELECT c.title AS Course, c.credits AS Credits
FROM courses c
JOIN courses_students cs ON c.id = cs.course_id
JOIN students s ON cs.student_id = s.id
WHERE s.instructors_id = 1;










