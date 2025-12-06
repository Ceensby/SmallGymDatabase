<h1> Small Gym Database System – README </h1>

This project provides a comprehensive MSSQL database design for a small-scale gym management system, including relational schema, primary/foreign key relationships, unique + check + default constraints, and a composite key structure.

<h2> 1-Purpose of the Project </h2>

This database is designed to manage:

<ul> <li> Members (UserTable) </li> <li> Trainers (TrainerTable) </li> <li> Payment information (PaymentTable) </li> <li> Login information (LoginTable) </li> <li> Gym details (GymTable) </li> <li> Permission modules (PermissionTable) </li> </ul>

for a gym.

<h2> 2-Database Diagram </h2> Below is the relational data model of the project:
<br>
<img width="600" height="400" alt="SmallGymDatabaseDiagram" src="https://github.com/user-attachments/assets/f43746c1-fa6a-48de-8107-28cf7540a284" /> <h2> 3-SQL Files Used </h2> <h3> 1. CreateTables.sql </h3>

This file contains all necessary commands to create the tables:

PK (Primary Key) definitions

FK (Foreign Key) relationships

Unique Constraints

Identity columns

Tables included:

<ul> <li> UserTable // Members </li> <li> LoginTable // User login information </li> <li> PaymentTable // Payment records </li> <li> TrainerTable // Trainer records </li> <li> GymTable // Gym information </li> <li> PermissionTable // Permission modules </li> </ul>

Important Features:

GymTable.GymId → identity(200,1)

PermissionTable.PermissionId → identity(300,1)

PaymentTable (PaymentId + CustomerId) → Composite Primary Key

<h3> 2. Constraints.sql </h3>

This file contains all CHECK and DEFAULT constraints that ensure data accuracy.

<h4> Check Constraints </h4> <ul> <li> LoginTable => LoginPassword <br> Must start with an uppercase letter and include at least 2 digits </li> <li> PermissionTable => PermissionModule <br> Must not contain numbers </li> <li> GymTable => GymType <br> Must not contain numbers </li> <li> UserTable => UserName <br> Must not contain numbers </li> <li> UserTable => UserEmail <br> Must contain '@' </li> <li> PaymentTable => PaymentAmount <br> Must be between 0 – 100000 </li> <li> PaymentTable => PaymentDate <br> Cannot be in the future </li> <li> TrainerTable => TrainerPassword <br> Must include at least 1 uppercase letter + 2 digits </li> </ul> <h4> Default Constraints </h4>

UserTable // UserAddress 'No'

TrainerTable // TrainerAddress 'No'

GymTable // GymAddress 'No'

PaymentTable // PaymentDescription 'No'

These rules ensure that the database stores standardized, secure, and clean data.

<h2> 4-Relationships Between Tables </h2>

UserTable ↔ TrainerTable → Each member may have a trainer.

UserTable ↔ GymTable → Each member is associated with a gym.

GymTable ↔ PermissionTable → Each gym has a module.

LoginTable ↔ UserTable → User login information.

PaymentTable ↔ UserTable → Relationship for the user making the payment (uses Composite Key).

<h2> 5-Important Design Notes </h2>

PaymentTable uses a Composite PK (PaymentId + CustomerId), which is a structure not commonly used in most systems.
This ensures that a user can have multiple payments without PaymentId conflicts.

<hr>

Strong password rules are defined for password fields in different tables.

<h2> 6-Usage </h2>

To use this project:

     USE GymDB;
     GO


    -- 1. Run the CreateTables.sql file
    -- 2. Run the Constraints.sql file
    -- 3. (Optional) DummyData.sql 

The database will be ready to use.

<h2> 7-Dummy Data </h2> You may access the older version of the dummy data file, but it only works for the initial state of the project. <br> The currently uploaded dummy data file will be updated. <h2> 8-License </h2>

This project has been prepared entirely for educational purposes. The table structures, constraints, and relational model have been designed to improve my technical skills in database design and to provide a practical example.

Additionally, this work serves as a precursor and foundational preparation for the upcoming main University Database project. The structure here is a simpler model created to test relationship logic, key structures, check/default rules, and data integrity on a smaller and cleaner architecture before transitioning into a university system.

It has been shared as a “sample project” to define design principles, identify potential errors, and clarify approaches before starting the real project. Therefore, it should not be considered a final product; rather, it is a preparation and prototype phase that lays the groundwork for a more comprehensive database system.

<h2> 9-Contact </h2>

If you want to review this project:

Primary Email: Cbektas12@outlook.com
<br>
Formal Email: Cansubektas@stu.topkapi.edu.tr
<br>
LinkedIn: Cansu Bektaş
