CREATE TABLE Users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('Admin', 'Student', 'Teacher') NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  address VARCHAR(255),
  phone VARCHAR(20)
);

CREATE TABLE Courses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  max_enrollment INT NOT NULL,
  teacher_id INT NOT NULL,
  FOREIGN KEY (teacher_id) REFERENCES Users(id)
);

CREATE TABLE Enrollments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  enrollment_date DATE NOT NULL,
  status ENUM('Enrolled', 'Dropped', 'Waitlisted') NOT NULL,
  FOREIGN KEY (student_id) REFERENCES Users(id),
  FOREIGN KEY (course_id) REFERENCES Courses(id)
);

CREATE TABLE Assignments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  course_id INT NOT NULL,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  due_date DATE NOT NULL,
  points INT NOT NULL,
  FOREIGN KEY (course_id) REFERENCES Courses(id)
);

CREATE TABLE Submissions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  assignment_id INT NOT NULL,
  file_url VARCHAR(255),
  grade INT,
  feedback TEXT,
  submission_date DATE NOT NULL,
  FOREIGN KEY (student_id) REFERENCES Users(id),
  FOREIGN KEY (assignment_id) REFERENCES Assignments(id)
);

CREATE TABLE Attendance (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  date DATE NOT NULL,
  status ENUM('Present', 'Absent', 'Late') NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Holidays (
  id INT AUTO_INCREMENT PRIMARY KEY,
  date DATE NOT NULL,
  description VARCHAR(255)
);

CREATE TABLE Settings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  academic_year INT NOT NULL,
  semester ENUM('Fall', 'Spring', 'Summer') NOT NULL
);