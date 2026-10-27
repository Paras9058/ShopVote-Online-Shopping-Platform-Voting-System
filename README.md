# ShopVote – Online Shopping Platform Voting System

## About the Project
ShopVote is a full stack Java web application that allows users to vote for their preferred online shopping platform. Users can select platforms such as Amazon, Flipkart, Myntra, Meesho, and others. The application stores votes in a MySQL database and displays the voting results.

## Features
- Simple and user-friendly voting form
- Multiple shopping platform options
- Stores votes in a MySQL database
- Displays voting results
- Prevents repeated voting within the same browser session

## Technologies Used
- **Frontend:** HTML, JSP
- **Backend:** Java Servlets
- **Database:** MySQL
- **Database Connectivity:** JDBC
- **Server:** Apache Tomcat 11
- **Build Tool:** Maven
- **IDE:** Apache NetBeans

## Project Structure
```text
ShopVoteNetBeans/
├── src/
├── pom.xml
└── README.md
```

## Requirements
- Java JDK 17 or compatible JDK
- Apache NetBeans
- Apache Tomcat 11
- MySQL Server
- MySQL Connector/J

## Database Setup

Open MySQL Workbench and execute:

```sql
CREATE DATABASE ShopVoteDB;

USE ShopVoteDB;

CREATE TABLE votes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    platform VARCHAR(50) NOT NULL,
    voter_token VARCHAR(100) NOT NULL UNIQUE,
    vote_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Database Configuration

Open `DBConnection.java` and configure your MySQL username and password.

Do not upload your real database password to GitHub.

## How to Run
1. Clone or download this repository.
2. Open the project in Apache NetBeans.
3. Configure the MySQL database connection.
4. Make sure MySQL Server is running.
5. Build the project using Maven.
6. Run the project on Apache Tomcat.
7. Open the application in your browser.

## Project Purpose
This project demonstrates how frontend pages, Java Servlets, JDBC, and a MySQL database work together in a full stack web application.

## Author
Developed as a student mini project.

## License
This project is intended for educational purposes.
