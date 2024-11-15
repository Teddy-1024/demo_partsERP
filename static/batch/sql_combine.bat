@echo off
setlocal enabledelayedexpansion

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

set "str_list="

set max_length=8191
set threshold=1000

echo temp = %f_tmp%
echo dir_parent = !%dir_parent%!
echo dir_current = !%dir_current%!
echo file_list = %f_list%
echo file = %f_combine%
echo n strings = !strs_n_max!

cd %dir_parent%
del %f_tmp%
del %f_list%
del %f_combine%

dir /b *.sql > %f_list%


echo loopy

(for /f "delims=" %%a in (%f_list%) do (
    set "line=%%a"
	set include_line=1
	for /L %%i in (0, 1, %strs_n_max%) do (
		if !line! equ !strs_delete_%%i! (
			set include_line=0
		)
		set "line=!line!"
	)
	if !include_line! gtr 0 (
		echo !line!
		::set "str_list=!str_list! !line!"
        ::set length=0
        ::for %%i in (!str_list!) do (
        ::    set /a length+=1
        ::)
		::if !length! geq !threshold! (
		::	echo !str_list!
		::	echo !str_list! > %f_combine%
		::	set "str_list="
		::)
		type !line! >> %f_combine%
	)
	set "line=!line!"
)) > %f_tmp%


echo output list:
type %f_tmp%

del %f_list%
echo file_tmp: %f_tmp%
echo file_list: %f_list%
echo combining files
echo !str_list!

echo cmd:
::echo "type !str_list! > %f_combine%"
::type !str_list! > %f_combine%
::(for %%f in (!str_list!) do (
::	echo %%f
::    type "%%f" >> %f_combine%
::)) 

cd %dir_current%

echo Current Time: %TIME%

endlocal