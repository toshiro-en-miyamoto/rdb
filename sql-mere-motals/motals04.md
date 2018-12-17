# Chapter 4. Creating a Simple Query

## select items from a table

When you execute a SELECT statement, it usually retrieves one or more rows of information - the exact number depends on how you construct the statement. Those rows are collectively known as a **result set**, which is the term I use throughout the reminder of this book. ([1], $4)

* Show me the names of all our vendors.
* What are the names and prices of all the products we carry?

## select distinct items from a table

When working with SELECT statements, you'll inevitably come across result sets with duplicate rows. There is no cause for alarm if you see such a result set. Use the DISTINCT keyword in your SELECT statement, and the result set will be free and clear of all duplicate rows. ([1], $4)

The DISTINCT keyword asks your database system to evaluate the values of all the column as a single unit on a row-by-row basis and eliminate any redundant rows it finds. The remaining unique rows are then returned to the result set. ([1], $4)

* Which states do our customers come from?
* Give me a unique list of engagement dates. I'm not concerned with how many engagements there are per date.
* Where are we holding our tournaments?
* Show me a list of unique recipe class IDs in the recipes table.

## select items from a table, order by an item

By definition, the rows of a result set returned by a SELECT statement are unordered. The sequence in which they appears is typically based on their physical position in the table. The actual sequence is often determined dynamically by your database system based on how it decides to most efficiently satisfy your request. ([1], $4)

Some vendor implementations allow you to include any column from any table in the FROM clause. However, the SQL Standard specifies that the only columns you can use in the ORDER BY clause are those that are currently listed in the SELECT clause. ([1], $4)

The Default Unicode Collation Element Table uses the Unicode order for CJK ideographs (Kanji). This represents a radical-stroke ordering for the characters in JIS levels 1 and 2. There is no algorithmic mapping from Kanji characters to the phonetic readings for those characters, because there is too much linguistic variation. The common practice for sorting in a database by reading is to store the reading in a separate field, and construct the sort keys from the readings. [2]

* List all entertainers and the cities they'are based in, and sort the results by city and name in ascending order.
* Give me a list of the buildings on campus and the number of floors for each building. Sort the list by building in ascending order.
* Give me a list of all tournament dates and locations. I need the dates in descending order and the location in alphabetical order.
* What types of recipes do we have, and what are the names of the recipes we have for each type? Can you sort the information by type and recipe name?


