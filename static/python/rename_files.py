import os

dir_parent = os.path.abspath(__file__ + '/../..')
dir_sql = os.path.abspath(dir_parent + '/sql')


# METHODS
for entry in os.scandir(dir_sql):
    if entry.is_file():
        if '_tbl_' in entry.name:
            
            new_name = entry.name
            i_underscore = 6
            while i_underscore > 0:
                i_underscore = new_name.find('_', i_underscore + 1)
                new_name = new_name[:i_underscore + 1] + new_name[i_underscore + 1].upper() + new_name[i_underscore + 2:]
            os.rename(entry.path, dir_sql + '/' + new_name)
    if entry.is_dir():
        pass

# SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Msg_Error_Type';