CREATE TABLE school (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT,
    phone_number CHAR(15),
    davlat_maktabi BOOLEAN
);

CREATE TABLE teacher (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    phone_number CHAR(15),
    school_id INT REFERENCES school(id)
);
CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender CHAR(1),
    school_id INT REFERENCES school(id)
);
CREATE TABLE class (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    teacher_id INT REFERENCES teacher(id),
    school_id INT REFERENCES school(id)
);
CREATE TABLE subject (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    class_id INT REFERENCES class(id),
    teacher_id INT REFERENCES teacher(id)
);
CREATE TABLE enrollment (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student(id),
    class_id INT REFERENCES class(id),
    enrollment_date DATE DEFAULT CURRENT_DATE
);
CREATE TABLE grade (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student(id),
    subject_id INT REFERENCES subject(id),
    grade_value VARCHAR(10),
    date_given DATE DEFAULT CURRENT_DATE
);
CREATE TABLE attendance (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student(id),
    class_id INT REFERENCES class(id),
    date DATE DEFAULT CURRENT_DATE
);
INSERT INTO school (name, address, phone_number, davlat_maktabi)

VALUES ('Fargonav maktabi', 'fargona v, toshloq tumani', '941139977', TRUE);

INSERT INTO teacher (first_name, last_name, email, phone_number, school_id)

VALUES ('Azizbek', 'Qodirov', 'azizbek@gmail.com', '991234567', 1);

INSERT INTO student (first_name, last_name, date_of_birth, gender, school_id)

VALUES ('Muhammadjon', 'Abdujabborov', '2007-12-27', 'M', 1);

INSERT INTO class (name, teacher_id, school_id)

VALUES ('Informatika', 1, 1);

INSERT INTO subject (name, class_id, teacher_id)

VALUES ('Algebra', 1, 1);

INSERT INTO enrollment (student_id, class_id)
VALUES (1, 1);

INSERT INTO grade (student_id, subject_id, grade_value)
VALUES (1, 1, 'Alo');

INSERT INTO attendance (student_id, class_id)
VALUES (1, 1);

SELECT * FROM school;

SELECT * FROM teacher;

SELECT * FROM student;

SELECT * FROM class;

SELECT * FROM subject;

SELECT * FROM grade;

SELECT * FROM attendance;

SELECT TO_CHAR(enrollment_date, 'YYYY-MM-DD') FROM enrollment;
SELECT TO_CHAR(date_given, 'YYYY-MM-DD') FROM grade;
SELECT TO_CHAR(date, 'YYYY-MM-DD') FROM attendance;

ALTER TABLE school RENAME TO school_info;

ALTER TABLE teacher RENAME TO staff;

ALTER TABLE school_info RENAME COLUMN phone_number TO contact_number;
ALTER TABLE staff RENAME COLUMN phone_number TO contact_number;







