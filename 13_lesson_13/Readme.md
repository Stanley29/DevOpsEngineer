1. Для початку створимо базу даних з назвою SchoolDB:

    ```
   
           CREATE DATABASE SchoolDB;
           USE SchoolDB;
		   
    ```
	
	1.1. Таблиця Institutions:
	
	```
   
           CREATE TABLE Institutions (
           institution_id INT AUTO_INCREMENT PRIMARY KEY,
           institution_name VARCHAR(255) NOT NULL,
           institution_type ENUM('School', 'Kindergarten') NOT NULL,
           address VARCHAR(255) NOT NULL
           );
		   
    ```
	
	1.2. Таблиця Classes:
	
	```
   
    CREATE TABLE Classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(255) NOT NULL,
    institution_id INT,
    direction ENUM('Mathematics', 'Biology and Chemistry', 'Language Studies') NOT NULL,
    FOREIGN KEY (institution_id) REFERENCES Institutions(institution_id)
    );
		   
    ```
	
	1.3. Таблиця Children:
	
	```
   
    CREATE TABLE Children (
    child_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    year_of_entry YEAR NOT NULL,
    age INT NOT NULL,
    institution_id INT,
    class_id INT,
    FOREIGN KEY (institution_id) REFERENCES Institutions(institution_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
    );
		   
    ```
	
	1.4. Таблиця Parents:
	
	```
   
    CREATE TABLE Parents (
    parent_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    child_id INT,
    tuition_fee DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (child_id) REFERENCES Children(child_id)
    );
		   
    ```
	
	1.5. Вставка даних:
	
	```
   
    -- Вставка даних у таблицю Institutions
    INSERT INTO Institutions (institution_name, institution_type, address) VALUES
    ('Greenwood High', 'School', '123 Maple St'),
    ('Sunrise Kindergarten', 'Kindergarten', '456 Oak St'),
    ('Bluebell School', 'School', '789 Pine St');

    -- Вставка даних у таблицю Classes
    INSERT INTO Classes (class_name, institution_id, direction) VALUES
    ('Math Class 101', 1, 'Mathematics'),
    ('Chemistry Basics', 3, 'Biology and Chemistry'),
    ('Language and Literature', 1, 'Language Studies');

    -- Вставка даних у таблицю Children
    INSERT INTO Children (first_name, last_name, birth_date, year_of_entry, age, institution_id, class_id) VALUES
    ('John', 'Doe', '2010-05-15', 2016, 14, 1, 1),
    ('Jane', 'Smith', '2012-08-22', 2018, 12, 1, 3),
    ('Alice', 'Brown', '2011-03-30', 2017, 13, 3, 2);

    -- Вставка даних у таблицю Parents
    INSERT INTO Parents (first_name, last_name, child_id, tuition_fee) VALUES
    ('Michael', 'Doe', 1, 1500.00),
    ('Sara', 'Smith', 2, 1200.00),
    ('Robert', 'Brown', 3, 1300.00);
		   
    ```
	
	1.6. Запити:
	
	```
   
    -- Отримати список всіх дітей разом із закладом, в якому вони навчаються, та напрямом навчання в класі
    SELECT Children.first_name, Children.last_name, Institutions.institution_name, Classes.direction
    FROM Children
    JOIN Institutions ON Children.institution_id = Institutions.institution_id
    JOIN Classes ON Children.class_id = Classes.class_id;

    -- Отримати інформацію про батьків і їхніх дітей разом із вартістю навчання
    SELECT Parents.first_name AS parent_first_name, Parents.last_name AS parent_last_name, Children.first_name AS child_first_name, Children.last_name AS child_last_name, Parents.tuition_fee
    FROM Parents
    JOIN Children ON Parents.child_id = Children.child_id;

    -- Отримати список всіх закладів з адресами та кількістю дітей, які навчаються в кожному закладі
    SELECT Institutions.institution_name, Institutions.address, COUNT(Children.child_id) AS number_of_children
    FROM Institutions
    LEFT JOIN Children ON Institutions.institution_id = Children.institution_id
    GROUP BY Institutions.institution_name, Institutions.address;
		   
    ```
	
	1.7. Створення бекапу бази даних та відновлення:
	
	```
   
           bash
		   -------------
		   -- Експортуйте базу даних у файл
           mysqldump -u your_username -p SchoolDB > SchoolDB_backup.sql

           -- Імпортуйте бекап у нову базу даних
           mysql -u your_username -p
           CREATE DATABASE NewSchoolDB;
           USE NewSchoolDB;
           SOURCE SchoolDB_backup.sql;
		   
    ```
	
	
	
	
	
	