

CREATE OR REPLACE FUNCTION p_shop_get_many_currency (
	IN a_get_inactive_currency BOOLEAN
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_get_inactive_currency BOOLEAN;
	result_currency REFCURSOR;
BEGIN
	v_get_inactive_currency := COALESCE(a_get_inactive_currency, FALSE);
    
	OPEN result_currency FOR
		SELECT 
			C.id_currency,
			C.code,
			C.name,
			C.factor_from_GBP,
			C.active,
			C.display_order
		FROM Shop_Currency C
		WHERE v_get_inactive_currency
			OR C.active
		ORDER BY C.display_order
		;
	RETURN NEXT result_currency;
END;
$$ LANGUAGE plpgsql;


/*

DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_currency (
		FALSE -- a_get_inactive_currency
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
