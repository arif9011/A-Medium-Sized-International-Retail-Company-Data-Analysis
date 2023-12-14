# Data Analytics Power BI

# Project Description 
In this project I connected to a variety of sources in order to retrieve the required datasets - this included:

- Azure SQL Database (Source of the Orders table)
- A file of .CSV file ( Source of the Products Table)
- Azure Blob Storage (Source of the Stores table)
- A folder of .csv files (Source of the Customers table)

# Milestone 2 Importing the Data into Power BI
An essential step for every data analysis project is carefully loading and cleaning data to ensure the most relevant an dinformative analysis. Hence, the beginning of this project involved loading in various tables namely; 'Orders', 'Products', 'Stores' and 'Customers'. The tables were loaded and transformed using various Get Data options including Azure SQL Database, CSV file, Azure Blob Storage and a folder.

To ensure that all the data was relevant and of value, the following key transformations were made:

Any data that compromised privacy was removed eg [Card Number] was removed from 'Orders' table.
Distinct columns were created via the Split Column feature to separate date and time data types eg [Order Date] and [Shipping Date] columns were each split into the above 2 data types.
Duplicates, missing and null values were removed from the necessary columns eg duplicates were removed from [Product Code] in the 'Products' table due to each code being unique.
Calculated columns were created to convert necessary values so that the units are all the same eg conversion of grams to kg in the 'Products' table.
Columns were combined to provide more informative information eg [First Name] and [Last Name] columns from 'Customers' table were combined to make [Full Name] column.
All unused columns in tables were removed along with some being renamed in order to align with Power BI naming conventions.
