select * from orders

---------------------------------------------SELECT+WHERE CLAUSE-----------------------------------------------------------
#Q1. Show all orders where Sales > 1000.
select * from orders where Sales>1000

#Q2.Display all records where Region = 'East' and Profit > 0.
select * from orders where Region='East' and Profit>0

#Q3.List all orders made in the year 2019
SELECT *
FROM Orders
WHERE YEAR([Order Date]) = 2019

---------------------------------------------ORDER BY CLAUSE-------------------------------------------------
#Q4.Display the top 10 highest Sales records
SELECT TOP 10 *FROM Orders ORDER BY Sales DESC
 
#Q5.Sort the orders by Profit in ascending order.
select * from Orders ORDER BY Profit asc

------------------------------------------GROUP BY CLAUSE---------------------------------------------------------
#Q6. Find the total sales per Region.
SELECT Region,sum(Sales) as 'sum of sales' from Orders group by Region

#Q7. Find the total profit per Category.
select Category,sum(Profit) as 'Total Profit' from Orders group by Category

#Q8. Count how many orders were placed by each Segment.
Select Segment,count("Order ID") from Orders group by Segment

-----------------------------------------HAVING CLAUSE---------------------------------------

#Q9. Show categories where total sales > 10,000.
SELECT Category,sum(Sales) as 'total Sales' from Orders group by Category having sum(Sales)>10000

#Q10. Find regions where the average profit > 500
Select Region,avg(Profit) as 'average profit' from Orders group by Region having avg(Profit)>500

--------------------------------------DISTINCT CLAUSE-------------------------------------

#Q11. List all unique cities where orders were placed.
SELECT DISTINCT City FROM Orders

#Q12. Find all distinct Ship Modes used in the dataset.
select distinct [Ship Mode] from Orders

----------------------------------------BETWEEN/IN/LIKE CLAUSE-----------------------------------------

#Q13. Show all orders where Sales BETWEEN 500 AND 1500.
select * from Orders where Sales between 500 and 1500

#Q14. Find orders where Region IN ('East', 'West').
select * from Orders where Region IN ('East','West')

#Q15. Show customers whose names start with ‘A’
select * from Orders where [Customer Name] Like'A%'

---------------------------------------JOIN + WHERE Clause----------------------------------
SELECT * FROM Returns
select * from People
select * from Orders


#Q16.Join Orders and Returns tables and show all returned orders.
select o.* from Orders as o inner join Returns as R on o.[Order ID]=R.[Order ID]

#Q17. Join Orders and People tables and list all orders handled by Manager = 'Chris'.
select o.* from Orders as o inner join People as p on o.Region=p.Region where p.Person='Chris'

-------------------------------------Aggregate + CASE WHEN Clause---------------------------------
#Q18. Create a new column “Profit_Status”
ALTER TABLE Orders
ADD Profit_Status VARCHAR(10)

UPDATE Orders
SET Profit_Status = CASE
                      WHEN [Profit] > 0 THEN 'Profit'
                      ELSE 'Loss'
                    END

--------------------------------WITH Clause-----------------------------------------

#Q19. Use a CTE to calculate total sales per region and then filter only those with sales > 50,000.
WITH RegionSales as 
(
select Region,sum(Sales) as Total_Sales from Orders group by Region
)
select * from RegionSales where Total_Sales > 50000

#Q20. Display the top 5 most profitable sub-categories.
SELECT [Sub-Category],sum(Profit) as Total_Profit from Orders group by [Sub-Category] order by Total_Profit DESC
OFFSET 0 ROWS
FETCH first 5 ROWS only

#Q21. Retrieve all columns for orders placed in the state of “California.”
select * from Orders where State='California'

#Q22. Show the Customer Name and Sales for orders with sales greater than 500.
select [Customer Name],Sales from Orders where Sales > 500

#Q23. Find all orders where Discount is 0.2.
select * from Orders where Discount=0.2

#Q24. List all orders where the Ship Mode is “Second Class.”
Select * from Orders where [Ship Mode]='Second Class'

#Q25.Select Order ID and Profit for orders with negative profit.
select [Order ID],Profit from Orders where Profit<0

#Q26. Find orders where the Category is either “Furniture” or “Technology.”
select * from Orders where Category in('Furniture','Technology')

#Q27. Show Customer Name and Sales for orders where City is not “New York.”
select [Customer Name],Sales from Orders where City !='New York'

#Q28. Select all orders where Quantity is greater than 10.
select * from Orders where Quantity > 10

#Q29. Retrieve all orders where Region is “South” and Profit is greater than 100
select * from Orders where Region='South' and Profit > 100

#Q30. List all distinct Customer Names in the dataset.
select distinct [Customer Name] from Orders

#Q31.Retrieve unique City names from the orders.
select distinct City from Orders

#Q32. Show all Product Names in ascending order.
select [Product Name] from Orders order by [Product Name] asc

#Q33. Display all Order IDs sorted by Order Date descending.
Select [Order ID],[Order Date] from Orders order by [Order Date] desc

#Q34. List all distinct Ship Modes.
select distinct [Ship Mode] from Orders

#Q35. Retrieve all unique Sub-Category names sorted alphabetically.
select distinct [Sub-Category] from Orders order by [Sub-Category] asc

#Q36. Find all distinct combinations of Category and Sub-Category.
select distinct [Sub-Category],Category from Orders

#Q37. Show the top 10 most recent orders.
select top 10 * from Orders order by [Order Date] desc

#Q38. List Customer Name and City without duplicates.
select distinct [Customer Name],City from Orders

#Q39. Retrieve the highest Sales values for each unique Customer Name.
select [Customer Name],max(Sales) as Highest_Sales from Orders group by [Customer Name] 
order by Highest_Sales DESC

#Q40. Find total sales per Category.
select Category, sum(Sales) as total_sales from Orders group by Category order by total_sales

#Q41. Find the average profit per Sub-Category.
select [Sub-Category], avg(Profit) as 'Average of per category' from Orders group by [Sub-Category]
order by 'Average of per category'

#Q42.Calculate the total quantity sold per Region.
select Region,sum(Quantity) as 'Total Quantity' from Orders group by Region order by 'Total Quantity'

#Q43. Find the number of orders per Ship Mode.
select [Ship Mode], count(*) as Total_Orders from Orders group by [Ship Mode]

#Q44. Find total sales per State where sales are greater than 10,000.
select State,sum(Sales) as Total_sales_per_state from Orders group by State 
having sum(Sales) > 10000

#Q45. Show total profit per Customer Name having profit greater than 1,000.
select [Customer Name],sum(Profit) as 'Total_Profit' from Orders group by [Customer Name]
having sum(Profit) > 1000

#Q46. Find the maximum discount per Category.
select Category,max(Discount) as max_discount_per_category from Orders group by Category 

#Q47. Calculate the average sales per Region and display only regions with avg sales > 500.
select Region,AVG(Sales) as avg_sales_of_region from Orders group by Region having AVG(Sales) > 500 

#Q48. Count the number of orders per City where Category = ‘Furniture’.
SELECT City,COUNT(*) as Total_Orders FROM Orders WHERE Category='Furniture' group by City

#Q49. Show the total profit per Sub-Category having profit < 0.
SELECT [Sub-Category],sum(Profit) total_profit from Orders group by [Sub-Category] 
having sum(Profit) <0

#Q50.Join Orders and Customers to show Customer Name and total Sales.
select c.[Customer Name], sum(o.Sales) as Total_Sales from Orders as o inner join Customer as c on o.[Customer ID]=
c.[Customer ID] group by c.[Customer Name] order by Total_Sales desc

select * from  sys.tables

#Q51. Join Orders and Customers to show Customer Name and total Sales.
select [Customer Name], sum(Sales) as total_sales from Orders group by [Customer Name] order by total_sales desc

#Q52.Find orders where the Customer Segment is “Corporate” using a subquery.
select * from Orders where Segment in ( select Segment from Orders where Segment='Corporate')

#Q53. Join Orders and Products to list orders for Technology products.
Select * from Orders
select * from People
select *from Returns

select o.[Order ID], o.Category, o.[Product Name], r.Returned from Orders o join Returns r 
on o.[Order ID]=r.[Order ID] where o.Category='Technology'

#Q54. Retrieve customers who have placed more than 5 orders using a subquery.
select [Customer ID] from Orders group by [Customer ID] having count(*) > 5

#Q55. Join Orders and Returns to find orders that were returned.
select o.[Order ID], o.Category, o.[Customer Name], o.Segment,r.Returned from Orders o join Returns r
on o.[Order ID]=r.[Order ID] where r.Returned='Yes'

---------------we can do this Question like this also anoter method;------------------------------------------------
SELECT o.*
FROM Orders o
JOIN Returns r
    ON o.[Order ID] = r.[Order ID]

#Q56. List Customer Name and State for customers whose total sales exceed 1,000.
Select [Customer Name],State from Orders group by [Customer Name],State having
sum(Sales) > 1000

#Q57. Use a subquery to find orders with the maximum profit.
select * from Orders where Profit = (select max(Profit) from Orders)

#Q58.Retrieve Order ID for customers who bought more than one Sub-Category.
select [Order ID] from Orders where [Customer Name] in (select [Customer Name] from Orders 
group by [Customer Name] having count(distinct[Sub-Category]) > 1)

#Q59. Join Orders and Shipments to list orders shipped via “Express.”
Select * from Orders

SELECT [Order ID],[Customer Name],Category,[Ship Mode] FROM Orders WHERE [Ship Mode] = 'Express'

#Q60.Find Customer Name who never returned a product using a subquery.
select distinct[Customer Name] from Orders where [Customer Name] not in (select [Customer Name] from Orders o 
join Returns r on o.[Order ID] = r.[Order ID])

#Q61. Show the cumulative sales per Region using a window function.
select Region, sum(Sales)over(partition by Region order by Sales) as Cumulative_Sales from Orders 

#Q62. Find top 5 customers with the highest total sales.
select top 5 [Customer Name],sum(Sales) as TotalSales from Orders group by [Customer Name] order by TotalSales desc

#Q63. List orders where sales are above the 90th percentile.
with P as
(
select *,PERCENTILE_CONT(0.9) within group (order by Sales) over () as P90 from Orders) select * from P where Sales>P90

#Q64. Rank customers by total profit using the RANK() function.
WITH CustomerProfit as
(
select [Customer Name],sum(Profit) as TotalProfit from Orders group by [Customer Name]) 
select [Customer Name],TotalProfit,Rank() over (Order by TotalProfit desc) as ProfitRank from CustomerProfit
order by ProfitRank

#Q65.Calculate running total of Sales per Category.  ---------running total=today's sale + all previous sales--------------
select Category,Sales,sum(Sales) over (partition by Category order by [Order Date] Rows between unbounded preceding and current
row) as RunningTotal from Orders order by Category,[Order Date]

#Q66.Show orders with a Sales amount higher than the average sales.
select * from Orders where Sales >(select AVG(Sales) from Orders)

#Q67. Identify Sub-Categories where total sales are above category average.
select Category,[Sub-Category],sum(Sales) as SubCategorySales from Orders group by Category,[Sub-Category] having sum(Sales)>
(select avg(CategoryTotal) from(select Category, sum(Sales) as CategoryTotal from Orders group by Category) as cat where
cat.Category=Orders.Category)

#Q68.List Customer Name and Profit for orders that are in the top 10% by profit.
WITH ProfitCutoff AS (
    SELECT 
        PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY Profit) 
            OVER () AS Profit90
    FROM Orders
)
SELECT 
    [Customer Name],
    Profit
FROM Orders
CROSS JOIN ProfitCutoff
WHERE Profit > Profit90

#Q69.Find Category with the highest average discount.
select top 1 Category,avg(Discount) as average_discount from Orders group by Category order by average_discount desc

#70.Retrieve the second highest sale in each Region.
select Region,Sales from (select Region,Sales,DENSE_RANK() over (Partition by Region order by Sales desc) as rn from Orders)
as t where rn=2