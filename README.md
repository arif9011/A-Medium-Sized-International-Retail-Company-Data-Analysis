### Data Analytics Power BI

### Project Description 
In this project I connected to a variety of sources in order to retrieve the required datasets - this included:

- Azure SQL Database (Source of the Orders table)
- A file of .CSV file ( Source of the Products Table)
- Azure Blob Storage (Source of the Stores table)
- A folder of .csv files (Source of the Customers table)

### Milestone 2: Importing the Data into Power BI
An essential step for every data analysis project is carefully loading and cleaning data to ensure the most relevant an dinformative analysis. Hence, the beginning of this project involved loading in various tables namely; 'Orders', 'Products', 'Stores' and 'Customers'. The tables were loaded and transformed using various Get Data options including Azure SQL Database, CSV file, Azure Blob Storage and a folder.

To ensure that all the data was relevant and of value, the following key transformations were made:

Any data that compromised privacy was removed eg [Card Number] was removed from 'Orders' table.
Distinct columns were created via the Split Column feature to separate date and time data types eg [Order Date] and [Shipping Date] columns were each split into the above 2 data types.
Duplicates, missing and null values were removed from the necessary columns eg duplicates were removed from [Product Code] in the 'Products' table due to each code being unique.
Calculated columns were created to convert necessary values so that the units are all the same eg conversion of grams to kg in the 'Products' table.
Columns were combined to provide more informative information eg [First Name] and [Last Name] columns from 'Customers' table were combined to make [Full Name] column.
All unused columns in tables were removed along with some being renamed in order to align with Power BI naming conventions.

### Milestone 3: Create the Data Model

The next step is to construct the data model for the project. This is creating a Date Table, a star based schema, using measures to incorporate important metrics and establishing date and geographic hierarchies.

### Creating a Date Table

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

### Building the Star Schema Data Model

THe Schema was created to connect each data table with their unique keys. Product Codes, Store Codes, User IDs, Order Date/Shipping Dates

![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/dd6272f8-685e-41c7-b46e-34922eea8fce)


Within this step another table was added to contain all measures that will be created in the following step.

### Creating Key Measures

A few key measures, that will come in use for the report. The below Key Measures have been added

Total Orders

    Total Orders = COUNT(Orders[Order Date])

Total Revenue

    Total Revenue = SUMX(Orders, Orders[Product Quantity] * RELATED(Products[Sale Price]))

Total Profit

    Total Profit = SUMX(Orders, Orders[Product Quantity] * (RELATED(Products[Sale Price]) - RELATED(Products[Cost Price])))

Total Customers

    Total Customers = DISTINCTCOUNT(Orders[User ID])

Total Quantity

    Total Quantity = SUM(Orders[Product Quantity])

Profit YTD

    Profit YTD = TOTALYTD([Total Profit], 'Date Table'[Start of Year])

Revenue YTD

    Revenue YTD = TOTALYTD([Total Revenue], 'Date Table'[Start of Year])
    
#### Creating Date and Geography Hierarchies

Creating Hieratchies will allow us to drill down on our report and perform greater analysis.
#### Milestone 4:  Set Up Report
I have created  four report pages and name them as follows:
Executive Summary,
Customer Detail,
Product Detail,
and Stores Map.

#### Milestone 5: Build The Customer Detail Page 

#### Customer Detail Page <a name="S3"></a>
I created the following visuals, whilst ensuring I followed a consistent format using the format tab for each visual:
- Headline Card Visuals\
Use the 'card' visual with total customers and a new measure, Revenue per Customer.
- Summary Chart\
Use the 'donut' visual with Unique Customers in the Values section and Country in the details section.
- Line Chart\
Date Hierarchy as an x value and Unique Customers as a y value.\
Click on 'add further analysis to your visual' in the visualisation pane to include a Trend Line and Forecast.
- Top 20 Customers Table\
Include whichever information you want in the customer table, applying a Top20 filter.
- Top Customer Cards\
See below.
- Date Slicer

These were fairly easy to produce, with time mainly taken to ensure they were formatted in a presentable way. However, the 'Top Customer Cards' were initially tricky as I couldn't produce a TopN filter, as I used the 'Card' visual. To get around this, I created 3 tables and then applied the TopN filter by adding the 'Full Name' column to each visual filter.

### Screenshot of Customer Detal Page
![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/e9aca39c-e6b6-4e95-a8de-5749353d69bc)

#### Milestone 6: Create an Executive Summary Page

## Executive Summary Page <a name="S4"></a>

I duplicated many of the visuals from the Customer Details page to create the following visuals for the Executive Page:

- Total Revenue, Total Orders and Total Profit card visuals
- A line chart with Total Profit
- Donut charts for Revenue
- A bar chart of Total Orders by Category
- KPI Visuals

To create KPI Visuals I needed to create three measures such as  Previous Quarter Profit, Previous Quarter Revenue and Previous Quarter Orders.

```
Previous Quarter Profit = CALCULATE([TotalProfit], PREVIOUSQUARTER('Date'[Date]))
Previous Quarter Revenue = CALCULATE([Total Revenue], PREVIOUSQUARTER(Dates[Date]))
Previous Quarter Orders = CALCULATE([Total Orders], PREVIOUSQUARTER(Dates[Date]))
```

## Screenshot of Executive Summary Page 
![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/b3a894ba-4748-42aa-93c7-38ddd678bd26)







