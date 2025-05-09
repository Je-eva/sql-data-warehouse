Some points for myself.
Using medallion ie, bronze -- silver -- gold 
1. Use excel or similar stuffs for understanding to solve data problems and then apply business logic
2. The metadata of the table needs to be modified accordingly if we are to add extra columns or change the column type. so update the table creation script too
3. the bulk update needs to be used with sourcee file
4. use GO for separating
5. use procedures so that repetitive tasks wil be skipped
6. use try catch and getdatefor better logging of errors
7. chekc for data standardzation and invalid stuffs.. make sure naming is correct eg, M -> Male etc
8. check for conditions eg, if data is not adding up correctly,contact the data sourced experts and come to a conclusion on what to be used
9. nullif, abs, declare @,
10. using double case , one for selecting the filter and other for trasnfomrtoin.. or use cte and then do it
11. do data checks as much as possible to ensure data quality is good 

the bronze layer is just about inserting the data value...
silver layer cleans and trasnforms data along with help of data experts to solve any bad data 
