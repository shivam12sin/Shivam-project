# Quiz Web Application

A web-based quiz platform built using JSP, Servlets, MySQL, HTML, CSS, and JavaScript. The application supports three distinct user roles: **Admins**, **Teachers**, and **Students**, each with role-specific functionalities.

---

## Table of Contents

1. [Features](#features)  
2. [Technologies Used](#technologies-used)  
3. [Prerequisites](#prerequisites)  
4. [Setup](#setup)  
5. [Usage](#usage)  
6. [Development Configuration](#development-configuration)  
7. [Contributing](#contributing)  
8. [License](#license)

---

## Features

- **User Authentication**: Secure login and role-based access control.  
- **Admin Role**:  
  - Manage application settings, quizzes, and user accounts.  

- **Teacher Role**:  
  - Create quizzes and manage student records.  

- **Student Role**:  
  - Attempt quizzes and track progress.  

- **Dynamic Quiz Management**: Add, update, or delete quizzes seamlessly.  
- **Responsive UI**: Built with HTML, CSS, and JavaScript for a user-friendly experience.  

---

## Technologies Used

- **Frontend**: HTML, CSS, JavaScript  
- **Backend**: JSP, Servlets  
- **Database**: MySQL  
- **Build Tool**: Maven  
- **Server**: Apache Tomcat  
- **Testing**: JUnit  

---

## Prerequisites

- **Java 17** or higher installed.  
- **Apache Maven** (minimum version 3.6.0) installed.  
- **Apache Tomcat** (version 10 or compatible) installed.  
- **MySQL Server** installed and running.  

---
## Setup

Follow these steps to set up the Quiz Web Application:

### 1. Clone the Repository
Clone the project repository to your local machine:
```bash
git clone <repository-url>
cd <project-folder>


Configure the Database



4. Build the Project
Use Maven to clean and build the project:

mvn clean install

5. Deploy to Tomcat
Locate the generated WAR file in the target directory (e.g., quiz-master.war).
Copy the WAR file to the webapps folder of your Apache Tomcat server.

6. Start the Server
Start your Tomcat server.
Access the application in your web browser at:
http://localhost:8080/quiz-master

