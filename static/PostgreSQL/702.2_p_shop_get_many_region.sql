

CREATE OR REPLACE FUNCTION p_shop_get_many_region (
	IN a_get_inactive_region BOOLEAN
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_get_inactive_region BOOLEAN;
	result_region REFCURSOR;
BEGIN
	v_get_inactive_region := COALESCE(a_get_inactive_region, FALSE);
    
    OPEN result_region FOR
		SELECT 
			R.id_region,
			R.code,
			R.name,
			R.active,
			R.display_order
		FROM Shop_Region R
		WHERE v_get_inactive_region
			OR R.active
		ORDER BY R.display_order
		;
	-- RETURN NEXT result_region;
END;
$$ LANGUAGE plpgsql;


/*

DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
    curs1 refcursor;
    rec1 record;
    curs2 refcursor;
    rec2 record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_region (
		FALSE -- a_get_inactive_region
	) LOOP
        RAISE NOTICE 'Fetching from cursor: %', curs;
        LOOP
            FETCH curs INTO rec;
            EXIT WHEN NOT FOUND;
            RAISE NOTICE 'Record: %', rec;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fetch_results();

*/
