@echo off
setlocal enabledelayedexpansion

:: set "test=C:\C:\ \"
set dir_parent=C:\Users\edwar\OneDrive\Documents\Programming\Visual Studio 2022\PARTS_Web\app\static\MySQL
:: set dir_parent=C:\Users\edwar\OneDrive\Documents\Programming\Visual Studio 2022\PARTS_Web\app\static\PostgreSQL
set "f_list=file_list.txt"
set dir_current=%cd%
set "f_tmp=temp.txt"
set "f_combine=0000_combine.sql"
set verbose=0
set "strs_delete_0=920_edit_permissions.sql"
set "strs_delete_1=910_anal.sql"
set "strs_delete_2=deprecated"
set "strs_delete_3=%f_list%"
set "strs_delete_4=%f_tmp%"
set "strs_delete_5=701_p_shop_get_many_role_permission.sql"
set "strs_delete_6=600_p_shop_save_product.sql"
set "strs_delete_7=170_ish_tbl_ERP_Order.sql"
set "strs_delete_7=dump.sql"
set strs_n_max=8
set strs_list =%strs_delete_0% %strs_delete_1% %strs_delete_2% %strs_delete_3% %strs_delete_4% 
set "str_true=true"
set "str_replace="

set "str_list="


:: report constants
echo temp = %f_tmp%
echo dir_parent = !%dir_parent%!
echo dir_current = !%dir_current%!
echo file_list = %f_list%
echo file = %f_combine%
echo n strings = !strs_n_max!

:: begin
cd %dir_parent%
::echo current directory: %cd%
del %f_tmp%
del %f_list%
del %f_combine%

:: colate dir files
dir /b > %f_list%

::type %f_list%

echo loopy
:: Remove blacklist files
:: grep -v '920_edit_permissions.sql' %f_list% > %f_list%
:: grep -v '910_anal.sql' %f_list% > %f_list%


(for /f "delims=" %%a in (%f_list%) do (
	::if %verbose% gtr 0 ( echo new line )
    set "line=%%a"
	::if %verbose% gtr 0 ( echo new line = !line! )
	::if !line! neq %strs_delete_0% if !line! neq %strs_delete_1% if !line! neq %strs_delete_2% if !line! neq %strs_delete_3% if !line! neq %strs_delete_4% if !line! neq %strs_delete_5% if !line! neq %strs_delete_6% (
	::	echo !line!
	::	set "str_list=!str_list! !line!"
	::)
	set include_line=1
	for /L %%i in (0, 1, %strs_n_max%) do (
		::set "str_delete=!strs_delete_%%i!"
		if !line! equ !strs_delete_%%i! (
			set include_line=0
		)
		::set "include_line=!include_line!"
		set "line=!line!"
	)
	if !include_line! gtr 0 (
		echo !line!
		set "str_list=!str_list! !line!"
	)
	set "line=!line!"
)) > %f_tmp%

:: Combine files
echo output list:
type %f_tmp%

del %f_list%
echo file_tmp: %f_tmp%
echo file_list: %f_list%
echo combining files
::type %f_tmp% | type > %f_list%
::
::type %f_list%
echo cmd:
echo "type !str_list! > %f_combine%"
type !str_list! > %f_combine%

cd %dir_current%

echo Current Time: %TIME%

endlocal