

/*

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME LIKE '%SHOP%'
	OR TABLE_NAME LIKE '%FILE_TYPE%';


SELECT FOUND_ROWS();



SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE,
    TABLE_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM
    INFORMATION_SCHEMA.TABLES
WHERE
    TABLE_SCHEMA = 'PARTS'
    -- AND TABLE_NAME = 'your_table_name'
;

*/

