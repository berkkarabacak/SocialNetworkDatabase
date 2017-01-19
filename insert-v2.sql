INSERT INTO MEMBER(Password,First_name,Middle_name,Last_name,E_mail,Active,Online)
VALUES (qwert123, 'Volkan',NULL,'Sezgin','volkansezgin93@gmail.com',1,1);

INSERT INTO CV(Summary,Interests,Profile_id) VALUES('Salihli Anadolu Ogretmen Lisesi Mezunu, Ege Universitesinde Bilgisayar Muhendisligi Okuyor.','Nesneye Dayali Programlama, Yapay Zeka, Bitcoin Madenciliği',
(SELECT TOP 1 Profile_id FROM MEMBER WHERE E_mail='volkansezgin93@gmail.com'));

INSERT INTO CV_SKILLS(Cv_id,Skill) VALUES((SELECT Cv_id FROM  CV WHERE Profile_id in (SELECT Profile_id
FROM MEMBER  WHERE E_mail='volkansezgin93@gmail.com')),'Java');
--HER BIR SKILL ICIN TEKRARLANACAK
INSERT INTO LANGUAGES_KNOWN (CV_id, Language_name, Proficiency) VALUES ((SELECT Cv_id FROM CV WHERE Profile_id in (SELECT
Profile_id FROM MEMBER WHERE E_mail='volkansezgin93@gmail.com')),'English,Svenska,Dansk,Suomi,Espana',4);
--HER BIR DIL ICIN TEKRARLANACAK
INSERT INTO EDUCATION_INFO(School_name, Department_name,Starting_Date,Graduation_date,Graduated,Privacy,Cv_id)
VALUES ('Salihli Anadolu Öğretmen Lisesi',NULL,'15-18-2007','6-18-2011',1,3,(SELECT Cv_id FROM CV WHERE Profile_id in (SELECT
Profile_id FROM MEMBER WHERE E_mail='volkansezgin93@gmail.com')));

INSERT INTO EDUCATION_INFO(School_name,Department_name,Starting_date,Graduation_date,Graduated,
UPDATE MEMBER_PROFILE SET Privacy=3, Date_of_birth='4-16-1993',Relationship_status_code=1,Phone_number=323,Gender='M',
Religion='Islam',Homeland=1,Lives_in=1,Current_school=(SELECT TOP 1 Education_info_id FROM EDUCATION_INFO WHERE Cv_id in (SELECT
Cv_id FROM CV WHERE Profile_id in (SELECT Profile_id FROM MEMBER WHERE E_mail='volkansezgin93@gmail.com')))
WHERE Profile_id in (SELECT Profile_id FROM MEMBER WHERE E_mail='volkansezgin93@gmail.com');
INSERT INTO ADDRESSES(Profile_id, Line_1, Line_2, City, Zip_code, Privacy) VALUES 
((SELECT TOP 1 Profile_id FROM MEMBER WHERE E_mail='volkansezgin93@hotmail.com'),'250/2 Sk. No:3 Database caddesi, Bornova',NULL,1,'35353',3);




-- onur yerine kendi bilgilerini yaz---
/****************************************************/

INSERT INTO MEMBER(Password, First_name, Middle_name, Last_name, E_mail, Active, Online)
VALUES('1234563311', 'Onur', NULL, 'Temurou', 'onur_bonus@lel.jp', 1, 1);

INSERT INTO CV(Interests, Profile_id, Summary)
VALUES('Japan', (SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp'),
'BAL mezunu, Ege Universitesinde Bilgisayar Muhendisligi okuyorum.');

INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp')), 'C#');
INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp')), 'C');
INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp')), 'Java');

INSERT INTO LANGUAGES_KNOWN(Cv_id, Language_name, Proficiency)
VALUES((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp')),
		'English', 3);
INSERT INTO LANGUAGES_KNOWN(Cv_id, Language_name, Proficiency)
VALUES((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp')),
		'Turkish', 1);
INSERT INTO LANGUAGES_KNOWN(Cv_id, Language_name, Proficiency)
VALUES((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp')),
		'Japanese', 3);

INSERT INTO EDUCATION_INFO(Cv_id, School_name, Department_name, Graduated, Starting_date, Graduation_date)
VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp')),
		'Ege University', 'Computer Engineering', 0, '9-15-2012', NULL);

INSERT INTO EDUCATION_INFO(Cv_id, School_name, Department_name, Graduated, Starting_date, Graduation_date)
VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp')),
		'Bornova Anadolu Lisesi', NULL, 1, '9-15-2008', '6-20-2012');

UPDATE MEMBER_PROFILE
SET Privacy = 2, Date_of_birth = '11-8-1994', About = 'Japon kzlar eklesin.', Gender = 'M', 
Current_school = (SELECT TOP 1 Education_info_id FROM EDUCATION_INFO WHERE Cv_id IN((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp'))) 
AND Graduated = 0),
Current_job = NULL, 
Religion = NULL, Homeland = 1, Lives_in = 1, Nickname = 'DHJS'
WHERE Profile_id in (SELECT Profile_id FROM  MEMBER WHERE E_mail='onur_bonus@lel.jp');

INSERT INTO ADDRESSES(Profile_id, City, Line_1, Privacy)
VALUES ((SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp'),
		1, 'NARBEL, Narlıdere', 2);

INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp'),
		'Music', 0);
INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp'),
		'Steins;Gate', 1);
INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'onur_bonus@lel.jp'),
		'Bakemonogatari', 1);

/***********************************************************************************************************************/

INSERT INTO MEMBER(Password, First_name, Middle_name, Last_name, E_mail, Active, Online)
VALUES('19071907fb', 'Ali', 'Osman', 'Delioğlu', 'deliali@hotmail.com', 1, 0);

INSERT INTO CV(Interests, Profile_id, Summary)
VALUES('SPARQL', (SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com'),
NULL);

INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com')), 'C#');
INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com')), 'C++');
INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com')), 'Java');
INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com')), 'MSSQL');
INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com')), 'Groovy');


INSERT INTO LANGUAGES_KNOWN(Cv_id, Language_name, Proficiency)
VALUES((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com')),
		'English', 3);
INSERT INTO LANGUAGES_KNOWN(Cv_id, Language_name, Proficiency)
VALUES((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com')),
		'Turkish', 1);

INSERT INTO EDUCATION_INFO(Cv_id, School_name, Department_name, Graduated, Starting_date, Graduation_date)
VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com')),
		'Ege University', 'Computer Engineering', 0, '9-15-2012', NULL);

UPDATE MEMBER_PROFILE
SET Privacy = 2, Date_of_birth = '3-3-1993', About = '100 kiloysak 99''u...', Gender = 'M', 
Current_school = (SELECT TOP 1 Education_info_id FROM EDUCATION_INFO WHERE Cv_id IN((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com'))) 
AND Graduated = 0),
Current_job = NULL, 
Religion = NULL, Homeland = 1, Lives_in = 1, Nickname = NULL
WHERE Profile_id in (SELECT Profile_id FROM  MEMBER WHERE E_mail = 'deliali@hotmail.com');

INSERT INTO ADDRESSES(Profile_id, City, Line_1, Privacy)
VALUES ((SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com'),
		1, '', 2);

INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com'),
		'Programming', 0);
INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com'),
		'Se7en', 1);
INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'deliali@hotmail.com'),
		'Usual Suspects', 1);

/***********************************************************************************************************************/

INSERT INTO MEMBER(Password, First_name, Middle_name, Last_name, E_mail, Active, Online)
VALUES('123qweasdzxc', 'Jennifer', NULL, 'Greenstone', 'jgreen@gmail.com', 1, 0);

INSERT INTO CV(Interests, Profile_id, Summary)
VALUES('Big Data', (SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com'),
NULL);

INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com')), 'Javascript');
INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com')), 'PHP');
INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com')), 'Python');


INSERT INTO LANGUAGES_KNOWN(Cv_id, Language_name, Proficiency)
VALUES((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com')),
		'English', 1);
INSERT INTO LANGUAGES_KNOWN(Cv_id, Language_name, Proficiency)
VALUES((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com')),
		'German', 4);

INSERT INTO EDUCATION_INFO(Cv_id, School_name, Department_name, Graduated, Starting_date, Graduation_date)
VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com')),
		'Harvard University', 'Software Engineering', 1, '9-15-2006', '6-30-2011');

INSERT INTO JOB_EXPERIENCE(Date_started,Organization, Position, Cv_id)
VALUES('10-3-2011', 1, 'Software Engineer',
		(SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com')));

UPDATE MEMBER_PROFILE
SET Privacy = 1, Date_of_birth = '6-9-1987', About = NULL, Gender = 'F', 
Current_school = NULL,
Current_job = (SELECT TOP 1 Job_id FROM JOB_EXPERIENCE WHERE Cv_id IN ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com'))) AND Date_left IS NULL), 
Religion = 'Christianity', Homeland = 93, Lives_in = 91, Nickname = NULL
WHERE Profile_id in (SELECT Profile_id FROM  MEMBER WHERE E_mail = 'jgreen@gmail.com');

INSERT INTO ADDRESSES(Profile_id, City, Line_1, Privacy)
VALUES ((SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com'),
		1, NULL, 2);

INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com'),
		'Programming', 0);
INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com'),
		'Playing Guitar', 0);
INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com'),
		'American Beauty', 1);
INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'jgreen@gmail.com'),
		'Holy Bible', 3);

/**********************************************************************************************/
INSERT INTO MEMBER(Password,First_name,Middle_name,Last_name,E_mail,Active,Online)
VALUES ('nandesuka','George','Lincoln','Owell','georgelowell@gmail.com',1,0);



INSERT INTO CV(Summary, Interests, Profile_id) VALUES ('Software Engineer at Oracle, former SE for Microfost','Algorithm Efficiency, Efficient Data Structures', 
(SELECT TOP 1 Profile_id FROM MEMBER WHERE E_mail='georgelowell@gmail.com'));


--
INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT Cv_id FROM CV WHERE Profile_id in (SELECT
Profile_id FROM MEMBER WHERE E_mail='georgelowell@gmail.com')),'Java');

INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT Cv_id FROM CV WHERE Profile_id in (SELECT
Profile_id FROM MEMBER WHERE E_mail='georgelowell@gmail.com')),'.NET');

INSERT INTO CV_SKILLS(Cv_id, Skill) VALUES ((SELECT Cv_id FROM CV WHERE Profile_id in (SELECT
Profile_id FROM MEMBER WHERE E_mail='georgelowell@gmail.com')),'C');

INSERT INTO LANGUAGES_KNOWN (Cv_id, Language_name, Proficiency) VALUES ((SELECT Cv_id FROM CV WHERE Profile_id in (SELECT
Profile_id FROM MEMBER WHERE E_mail='georgelowell@gmail.com')),'English',0);

INSERT INTO EDUCATION_INFO(Cv_id, School_name, Department_name, Graduated, Starting_date, Graduation_date)
VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'georgelowell@gmail.com')),
		'California State University', 'Computer Science', 1, '9-19-1980', '6-8-1985');

INSERT INTO EDUCATION_INFO(Cv_id, School_name, Department_name, Graduated, Starting_date, Graduation_date)
VALUES ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'georgelowell@gmail.com')),
		'Tennyson High School', NULL, 1, '10-02-1975', '6-13-1979');

UPDATE MEMBER_PROFILE SET Privacy=0, Date_of_birth='12-5-1960',Relationship_status_code=3,Phone_number=05006982299,Gender='M',
Religion='Christianity',Homeland=92,Lives_in=62, Current_school=null, Current_job= (SELECT TOP 1 Job_id FROM JOB_EXPERIENCE WHERE Cv_id IN ((SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'georgelowell@gmail.com'))) AND Date_left IS NULL)

WHERE Profile_id in (SELECT Profile_id FROM  MEMBER WHERE E_mail='georgelowell@gmail.com');
INSERT INTO ADDRESSES(Profile_id, Line_1, Line_2, City, Zip_code, Privacy) VALUES ((SELECT TOP 1 Profile_id FROM MEMBER WHERE E_mail='georgelowell@gmail.com'),'Whiteknights Number 4 Reading, Berkshire',NULL,62,'217',0);

INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'georgelowell@gmail.com'),
		'Programming', 0);
INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'georgelowell@gmail.com'),
		'Jogging', 0);
INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'georgelowell@gmail.com'),
		'1984', 3);
INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'georgelowell@gmail.com'),
		'Eagle of Freedom', 4);
INSERT INTO PROFILE_EXTENSIONS(Profile_id, Name, Category_id)
VALUES((SELECT Profile_id FROM MEMBER WHERE E_mail = 'georgelowell@gmail.com'),
		'Angelina Jolie', 2);
		
 INSERT INTO JOB_EXPERIENCE(Date_started,Organization,Location,Date_left, Position, Cv_id)
VALUES('7-29-1986', 2,92,'10-13-2002', 'Software Engineer',
(SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'georgelowell@gmail.com')));

INSERT INTO JOB_EXPERIENCE(Date_started,Organization,Location, Position, Cv_id)
VALUES('10-16-2002', 1,62, 'Software Engineer',
(SELECT TOP 1 Cv_id FROM CV WHERE Profile_id IN (SELECT Profile_id FROM MEMBER WHERE E_mail = 'georgelowell@gmail.com')));