--Creating tables obesity and worldhappiness, do this before loading
Drop table if exists obesity;
Drop table if exists worldhappiness;

Create table obesity(
	"Country" Varchar not null,
	"Year" Varchar not Null,
	"Obesity" Float not Null,
	"Sex" Varchar not Null);

select * from obesity;


Create table worldhappiness(
	Country Varchar not null,
	Year Varchar not null,
	Life_Ladder Float not null,
	Log_GDP_Per_Capita Float,
	Social_Support Float,
	Healthy_Life_Expectancy_at_Birth Float,
	Freedom_to_Make_Life_Choices Float,
	Generosity Float,
	Perceptions_of_Corruptions Float,
	Positive_Affect Float,
	Negative_Affect Float);
	
Select * from worldhappiness;


--Creating a query by joining obesity and worldhappiness together by country and date, do this only right before Analysis
drop view if exists ETLTable;

Create view ETLTable as
	Select obesity."Country",
		obesity."Year",
		obesity."Obesity",
		worldhappiness."Positive_Affect"
		From obesity
		Join worldhappiness on obesity."Country" = worldhappiness."Country" and obesity."Year" = worldhappiness."Year";

Select * from ETLTable;

