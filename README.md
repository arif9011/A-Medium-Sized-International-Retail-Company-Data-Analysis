#### Data Analytics Power BI Report

#### Project Description 
In this project I connected to a variety of sources in order to retrieve the required datasets - this included:

- Azure SQL Database (Source of the Orders table)
- A file of .CSV file ( Source of the Products Table)
- Azure Blob Storage (Source of the Stores table)
- A folder of .csv files (Source of the Customers table)

#### Milestone 2: Importing the Data into Power BI
An essential step for every data analysis project is carefully loading and cleaning data to ensure the most relevant an dinformative analysis. Hence, the beginning of this project involved loading in various tables namely; 'Orders', 'Products', 'Stores' and 'Customers'. The tables were loaded and transformed using various Get Data options including Azure SQL Database, CSV file, Azure Blob Storage and a folder.

To ensure that all the data was relevant and of value, the following key transformations were made:

Any data that compromised privacy was removed eg [Card Number] was removed from 'Orders' table.
Distinct columns were created via the Split Column feature to separate date and time data types eg [Order Date] and [Shipping Date] columns were each split into the above 2 data types.
Duplicates, missing and null values were removed from the necessary columns eg duplicates were removed from [Product Code] in the 'Products' table due to each code being unique.
Calculated columns were created to convert necessary values so that the units are all the same eg conversion of grams to kg in the 'Products' table.
Columns were combined to provide more informative information eg [First Name] and [Last Name] columns from 'Customers' table were combined to make [Full Name] column.
All unused columns in tables were removed along with some being renamed in order to align with Power BI naming conventions.

#### Milestone 3: Create the Data Model

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

#### Screenshot of Customer Detail Page
![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/ea92bd06-bc3f-4626-b9c5-f30a7f057c1b)

#### Milestone 6: Create an Executive Summary Page

#### Executive Summary Page <a name="S4"></a>

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

#### Screenshot of Executive Summary Page 
![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/2982a080-58e6-470e-bdea-fa016c4fbd8c)



#### Mileston 7: Create a Product Detail Page
The purpose of this page is provide an in-depth look at which products within the inventory are performing well, with the option to filter by product and region.

To achieve this, I built a report page that provides insights for all products and regions combined.

Additionally, to allow the users of the report filter data easily, I created a pop-up banner using bookmarks add a slicer toolbar which can be accessed from the navigation pane.

The Product Detail page I created contains the following visuals:

- Card visuals to show which filters are currently selected
- Gauge visuals to show how the selected category's revenue, profit and number of orders are performing against a quarterly target 
- An area chart showing relative revenue performance of each category over time
- A table showing the top 10 products by revenue in the selected context
- A scatter graph of quantity ordered against profit per item for products in the current context
- Created a new calculated column called [Profit per Item] in the Products table, by using a DAX formula to work out the profit per item
  ```
  Profit per Item = Products[Sale price] - Products[Cost price]
  ```
  


Slicer Toolbar
On this page, it is useful to provide a slicer toolbar for clarity and not cluttering the page.
#### Screenshot of Slicer Toolbar
![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/d9302a9e-0472-4ce0-a160-3eb08463bb9c)

Using a button that links to a bookmark, a menu is opened that allows slicing on the page for product category and country, this menu can be closed again with the back button linking to a bookmark of the original page, whilst also keeping the changes of data.

#### Screenshot of Product Detail Page
![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/602e68d6-f786-4bf9-8a1d-8306ffb63702)

#### Mileston 8: Create a Stores Map Page
#### Stores Map
 added a Stores Map page, which lead to me creating a drillthrough and toolkit page to help navigation through the map visual:

- Adding a map visual
- Add a country tile slicer to the top of the page
- Create a drillthrough page with the visuals that I need - the important note here is to add the Country column to the drillthrough option on the drillthrough page which allows you to right-click on the map visual to drillthrough
- Create a tooltip page with a Profit YTD gauge
I need to makesure this tooltip option is enabled and scaled correctly.
To enable, go to File - Options and Settings - Options - Preview Features - Check 'Modern Visual Tooltips' and restart Power BI.
To ensure the Tooltip is scaled, go to File - Options and Settings - Options - Report Settings - Tooltips Auto-Scale.

#### Map
Using a map visualisation is perfect for understanding geographical data. It allows the user to visually see the distribtuion of the stores, along with an indication of their concentration.
#### Slicer (Tile)
The slicer visualisation allows the map visualisation to change depending on the geographical location selected. This means that the user can cater the visualisation to the geographical locations that are of concern to them.

#### Screenshot of Storers Map Page
![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/0d32ee04-9c88-48c9-bfad-6d7aaad0deeb)

For the location, a hierarchy has been used, which means that the user can drill up and down the map to see 'World Region', 'Country' and 'Country Region'.


#### Create Stores Drillthrough page
I also created a Stores drillthrough page that summarises each store's performance. I built this page to make it easy for the region managers to check on the progress of a given store.
This Stores drillthrough page allows a summary for an individual store.
It contains:
- A Top 5 products, showing Profit YTD, Total Orders, Total Revenue
- A Column chart showing total orders by products
- Gauge for Profit YTD and Revenue YTD against target
- Card Visual for current store
The Gauge visual compares against the current YTD against the previous YTD at the point in the year where the target is a 20% increase.

#### Screenshot of Stores Drillthrough page
![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/709066ae-100f-421f-91f3-1c2628f0a338)



#### Tooltip Page
I wanted users to be able to see each store's year-to-date profit performance against the profit target just by hovering the mouse over a store on the map. To do this, I created a custom tooltip page with a profit gauge visual, and then set the tooltip of the visual to the tooltip page I have created
#### Screenshot of Tooltip Page
![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/c2e1f195-47e2-4dce-8c76-e51bf6986ce3)

This is case, the tooltip page adds mathematical information to the map visualisation in 'Stores Map' report page. To reveal the tooltip, simply hover over the data of interest in the visualisation in the 'Stores Map' page. 


#### Milestone 9: Cross-filtering and Navigation
Cross-filtering and creating a navigation pane help to bring structure to the overall Power BI report as well as making the pages easier to navigate and analyse.

#### Cross-filtering
Cross-filtering is an interaction between visuals on a report page, which causes visuals to chaneg based on filters applied on other visuals. However, sometimes there are visuals where we would not like cross-filtering to occur as to causes more mess and confusion than being a helpful insight.

To alter the cross-filtering of a visualisation, one needs to got to 'Format' in the ribbon and then to 'Edit Interactions'.

For this project, I needed to alter the cross-filtering for the following report pages:

- Executive Summary
- Customer Detail
- Product Detail

For 'Executive Summary' page, I altered the cross-filtering so that the 'Orders by Category' stacked chart and the 'Top 10 Products' table would not filter the card visuals or KPIs. Moreover, I edited the interactions between visuals so that the 'Top 10 Products' table would not affect any of the other visuals.

In the 'Customer Detail' page, I made sure that the 'Top 20 Customers' table does not filter any of the other visuals. In addition, the interaction between the 'Total Customers by Category' stacked chart and the 'Total Customers' line graph was altered so that the stacked chart does not affect the line graph. Finally, the 'Total Customers by Country' donut chart was edited so that it cross-filters the 'Total Customers by Category' stacked chart.

There was only one visualisation whose interaction was changed in the 'Product Detail' page, which was the 'Quantity Sold vs Profit per Item' scatter graph. This change resulted in ensuring that the scatter graph does not affect any of the other visuals.

#### Navigation Bar

Click on Insert - Buttons - Blank to insert a blank button to allow you to edit the visual using the format visual options in the visualisation pane. Under 'Style' you can add an icon and a fill, which changes the colour of the navigation button if you hover over it (state: on hover). To ensure the button actions as a navigation button click on the action dropdown and change type to page navigation, using the destination dropdown to choose the relevant page.Finally I have made a group the buttons together, and copy them across to the other pages.

In order from top to buttom, the buttons relate to the following pages:

- Executive Summary
- Customer Detail
- Product Detail
- Stores Map
#### Screenshoot of Navigation 
![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/205e58fa-0351-4daa-8c38-957221d4531e)


#### Milestone 10: Create Metrics for Users Outside the Company Using SQL
I finished this project by creating metrics for users outside the company using SQL. Using VisualStudio and the SQLTools extension, I created a connection to the Postgres database server hosted on Microsoft Azure by the following Step:

- Connected to the SQL Server through VSCode\
Connection Name: OrdersDB\
Connect using: Server and Port\
Server address: powerbi-data-analytics-server.postgres.database.azure.com\
Port: 5432\
Database: orders-db\
Username: ****\
Password: Ask on connect\
I done this using the SQLTools extension which you can get in the extensions tab, and I used the PostgreSQL connection.

- I printed the list of tables and columns within the tables, to help me with my queries.

#### Screenshot List of Tables Name

![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/490819c6-6902-433e-b400-2ed42c08efcb)

#### Screenshot List of the Columns

![image](https://github.com/arif9011/Data-Analytics-Power-BI-Report/assets/115591569/cfe115ab-beb9-4e0c-a070-d628fa0c7684)












