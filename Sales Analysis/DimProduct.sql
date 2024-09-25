--Cleansed DIM_Product Table--
SELECT 
  p.[ProductKey], 
  p.[ProductAlternateKey] AS ProductItemCode --,[ProductSubcategoryKey]
  --,[WeightUnitMeasureCode]
  --,[SizeUnitMeasureCode]
  , 
  p.[EnglishProductName] AS [ProductName] --,[SpanishProductName]
  --,[FrenchProductName]
  --,[StandardCost]
  --,[FinishedGoodsFlag]
  , 
  ps.[EnglishProductSubcategoryName] AS [Sub Category] --joined in from Sub Category table
  , 
  pc.[EnglishProductCategoryName] AS [Product Category] -- joined in from Category table
  , 
  p.[Color] AS [Product Color] --,[SafetyStockLevel]
  --,[ReorderPoint]
  --,[ListPrice]
  , 
  p.[Size] AS [Product Size] --,[SizeRange]
  --,[Weight]
  --,[DaysToManufacture]
  , 
  p.[ProductLine] AS [Product Line] --,[DealerPrice]
  --,[Class]
  --,[Style]
  , 
  p.[ModelName] AS [Product Model Name] --,[LargePhoto]
  , 
  p.[EnglishDescription] AS [Product Description] --,[FrenchDescription]
  --,[ChineseDescription]
  --,[ArabicDescription]
  --,[HebrewDescription]
  --,[ThaiDescription]
  --,[GermanDescription]
  --,[JapaneseDescription]
  --,[TurkishDescription]
  --,[StartDate]
  --,[EndDate]
  , 
  p.Status AS Example, 
  ISNULL (p.[Status], 'Outdated') AS [Product Status] 
FROM 
  [dbo].[DimProduct] as p 
  LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN dbo.DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey 
ORDER BY 
  p.ProductKey asc
