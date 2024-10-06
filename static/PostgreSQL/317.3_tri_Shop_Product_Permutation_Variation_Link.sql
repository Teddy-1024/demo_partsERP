
-- Shop Product Permutation Variation Link

CREATE OR REPLACE FUNCTION before_insert_Shop_Product_Permutation_Variation_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Product_Permutation_Variation_Link
BEFORE INSERT ON Shop_Product_Permutation_Variation_Link
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Product_Permutation_Variation_Link();


CREATE OR REPLACE FUNCTION before_update_Shop_Product_Permutation_Variation_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Product_Permutation_Variation_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    -- Changed id_product
	SELECT NEW.id_link, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
    -- Changed id_variation
	SELECT NEW.id_link, 'id_variation', OLD.id_variation, NEW.id_variation, NEW.id_change_set
		WHERE NOT OLD.id_variation <=> NEW.id_variation
	UNION
	*/
    -- Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	-- Changed display_order
	SELECT NEW.id_link, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Product_Permutation_Variation_Link
BEFORE UPDATE ON Shop_Product_Permutation_Variation_Link
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Product_Permutation_Variation_Link();
