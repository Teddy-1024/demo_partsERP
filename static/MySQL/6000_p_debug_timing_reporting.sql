-- USE partsltd_prod;

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_debug_timing_reporting;

DELIMITER //
CREATE PROCEDURE p_debug_timing_reporting (
	IN a_time_start TIMESTAMP(6)
)
BEGIN
/*
	PROCEDURE p_debug_timing_reporting
	Shared method timing reporting
*/
    DECLARE v_time_end TIMESTAMP(6);

	SET v_time_end := CURRENT_TIMESTAMP(6);
	SELECT
		a_time_start
		, UNIX_TIMESTAMP(a_time_start)
		, MICROSECOND(a_time_start) / 1000
		, v_time_end
		, UNIX_TIMESTAMP(v_time_end)
		, MICROSECOND(v_time_end) / 1000
		, v_time_end - a_time_start AS timestamp_delta
		, UNIX_TIMESTAMP(v_time_end - a_time_start) AS UNIX_TIMESTAMP_timestamp_delta
		, MICROSECOND(v_time_end - a_time_start) AS MICROSECOND_timestamp_delta
		-- , TIME_FORMAT(TIMEDIFF(v_time_end, a_time_start), '%H:%i:%s') AS time_difference
		, CONCAT(
			TIME_FORMAT(TIMEDIFF(v_time_end, a_time_start), '%H hours, %i minutes, %s seconds'),
			', ',
			TIMESTAMPDIFF(MICROSECOND, a_time_start, v_time_end) % 1000000 / 1000, ' milliseconds'
		) AS time_difference
	;
	
END //
DELIMITER ;;

/*
CALL partsltd_prod.p_debug_timing_reporting (
	CURRENT_TIMESTAMP(6)
);
*/