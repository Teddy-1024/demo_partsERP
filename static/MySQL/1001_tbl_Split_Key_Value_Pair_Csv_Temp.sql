
# Split Key Value Pair CSV Staging
-- USE demo;
-- DROP TABLE IF EXISTS Split_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Split_Key_Value_Pair_Csv_Temp';

CREATE TABLE Split_Key_Value_Pair_Csv_Temp (
	guid BINARY(36) NOT NULL
    , id INT NOT NULL
	, key_column VARCHAR(4000) NULL
    , value_column VARCHAR(4000) NULL
);
