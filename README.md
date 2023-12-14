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

### Create the Data Model

The next step is to construct the data model for the project. This is creating a Date Table, a star based schema, using measures to incorporate important metrics and establishing date and geographic hierarchies.

#### Creating a Date Table

Using the Calendar function a new table was created with a continuous list of dates from the earliest order date to the latest shipping date. This Date table was filled out with new columns of the following

- Day Number
- Day Name
- Month Number (i.e. Jan = 1, Dec = 12 etc.)
- Month Name
- Quarter
- Year
- Start of Year
- Start of Quarter
- Start of Month
- Start of Week

#### Building the Star Schema Data Model

THe Schema was created to connect each data table with their unique keys. Product Codes, Store Codes, User IDs, Order Date/Shipping Dates

![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/dd6272f8-685e-41c7-b46e-34922eea8fce)


Within this step another table was added to contain all measures that will be created in the following step.

#### Creating Key Measures

A few key measures, that will come in use for the report. The below Key Measures have been added

Total Orders

    Total Orders = COUNT(Orders[Order Date])

Total Revenue

    Total Revenue = SUMX(Orders, Orders[Product Quantity] * RELATED(Products[Sale Price]))

Total Profit

    Total Profit = SUMX(Orders, Orders[Product Quantity] * (RELATED(Products[Sale Price]) - RELATED(Products[Cost Price])))

Total Customers

    Total Customers = COUNTROWS(DISTINCT(Orders[User ID]))

Total Quantity

    Total Quantity = SUM(Orders[Product Quantity])

Profit YTD

    Profit YTD = TOTALYTD([Total Profit], 'Date Table'[Start of Year])

Revenue YTD

    Revenue YTD = TOTALYTD([Total Revenue], 'Date Table'[Start of Year])
    
#### Creating Date and Geography Hierarchies

Creating Hieratchies will allow us to drill down on our report and perform greater analysis. Below show the 2 hierarchies created

![Date Hierarchy](DateHierarchy.png)

![Geography Hierarchy](GeographyHierarchy.png)

