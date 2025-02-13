# Swimming-Academy-Registration-System
Full-stack web app for students to register, view classes, and class assignments.

## Features
- User registration & login
- Class creation,
- Student-class assignments
- Class scheduling

## Tech Stack
- Backend: Spring Framework, MVC Architecture, Spring Repositories
- Frontend: JavaScript, HTML, Bootstrap
- Template Engine: Java Template Engine (JTE)
- Programming Languages: Java

## How to Run
1. Clone this repository:

2. Navigate to the project folder:

3. Add your own repository for the database by configuring the `application.properties` file in the `src/main/resources` directory with your database URL, username, and password. For example:

# Database Configuration: 
spring.datasource.url=jdbc:mysql://localhost:3306/your-database  # Replace with your database URL
spring.datasource.username=your-username  # Replace with your database username
spring.datasource.password=your-password  # Replace with your database password

5. Run the application using your preferred IDE or by using Maven/Gradle: mvn spring-boot:run

6. Open your browser and navigate to http://localhost:8080 to start using the application. 
