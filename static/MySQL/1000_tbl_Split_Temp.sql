
# Split Staging
-- USE demo;
-- DROP TABLE IF EXISTS Split_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Split_Temp';

CREATE TABLE Split_Temp (
	guid BINARY(36) NOT NULL
    , display_order INT NOT NULL
	, substring VARCHAR(4000) NOT NULL
);
