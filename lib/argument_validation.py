# -*- coding: utf-8 -*-
"""
Created on Thu Apr 27 12:33:59 2023

@author: Edward Middleton-Smith

Argument Validation
"""

from helpers.helper_app import Helper_App
from typing import Optional

def error_msg_str(v, v_name, method, v_type, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # return error message string for output of invalid argument / attribute to user
# ARGUMENTS
    # str method - name of parent method which calls this function
    # str arg_name - name of argument throwing error
    # ? v - erroneous variable
    # str v_type - desired / expected variable type
    # str arg_type - e.g. argument, attribute
    # bool suppress_errors - should outputs not be raised as errors?
    # bool suppress_console_outputs
# ARGUMENT VALIDATION
    my_f = 'error_msg_str'
    # suppress_errors
    if not val_bool(suppress_errors, 'suppress_errors', my_f):
        error_msg = error_msg_str(suppress_errors, 'suppress_errors', my_f, "<class 'bool'>")
        raise ValueError(error_msg)
    # suppress_console_outputs
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        error_msg = error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors)
        if suppress_errors:
            print(error_msg)
            return error_msg
        else:
            raise ValueError(error_msg)
    # method
    if not val_str(method, 'method', my_f, suppress_errors=suppress_errors, suppress_console_outputs=suppress_console_outputs):
        error_msg = error_msg_str(method, 'method', my_f, "<class 'str'>", suppress_errors, suppress_console_outputs)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return error_msg
        else:
            raise ValueError(error_msg)
    my_f = method + '.' + my_f
    # v_name
    if not val_str(v_name, 'v_name', my_f, -1, -1, suppress_errors, suppress_console_outputs):
        error_msg = error_msg_str(v_name, 'v_name', my_f, "<class 'str'>", suppress_errors, suppress_console_outputs)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return error_msg
        else:
            raise ValueError(error_msg)
    # v_type
    if isinstance(v_type, type):
        v_type = str(v_type)
    if not val_str(v_type, 'v_type', my_f, -1, -1, suppress_errors, suppress_console_outputs):
        error_msg = error_msg_str(v_type, 'v_type', my_f, "<class 'str'>", suppress_errors, suppress_console_outputs)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return error_msg
        else:
            raise ValueError(error_msg)
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, -1, -1, suppress_errors, suppress_console_outputs):
        error_msg = error_msg_str(v_arg_type, 'v_arg_type', my_f, "<class 'str'>", suppress_errors, suppress_console_outputs)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return error_msg
        else:
            raise ValueError(error_msg)
# RETURNS
    return f"Invalid {method} {v_type} {v_arg_type} {v_name}. Type = {str(type(v))}. Value = {v}"

def val_bool(v_input, v_name, method, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that myinput is of type bool
# ARGUMENTS
    # bool (hopefully) myinput
    # str v_name
    # str method
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # optional str v_arg_type
# ARGUMENT VALIDATION
    # validate bool inputs first
    v_type = "<class 'bool'>"
    my_f = 'val_bool'
    if str(type(suppress_errors)) != v_type:
        raise ValueError(error_msg_str(suppress_errors, 'suppress_errors', my_f, v_type))
    if str(type(suppress_console_outputs)) != v_type:
        error_msg = error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, v_type, suppress_errors)
        if suppress_errors:
            print(error_msg)
            return False
        raise ValueError(error_msg)
    v_type = "<class 'str'>"
    # method
    valid = True
    if str(type(method)) != v_type:
        valid = False
    else:
        if len(method) < 1:
            valid = False
    if not valid:
        error_msg = error_msg_str(method, 'method', my_f, v_type, suppress_errors, suppress_console_outputs)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return False
        raise ValueError(error_msg)
    my_f = method + '.' + my_f
    # v_name
    valid = True
    if str(type(v_name)) != v_type:
        valid = False
    else:
        if len(v_name) < 1:
            valid = False
    if not valid:
        error_msg = error_msg_str(v_name, 'v_name', my_f, v_type, suppress_errors, suppress_console_outputs)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return False
        raise ValueError(error_msg)
    # v_arg_type
    valid = True
    if str(type(v_arg_type)) != v_type:
        valid = False
    else:
        if len(v_arg_type) < 1:
            valid = False
    if not valid:
        error_msg = error_msg_str(v_arg_type, 'v_arg_type', my_f, v_type, suppress_errors, suppress_console_outputs)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return False
        else:
            raise ValueError(error_msg)
    # v_input
    v_type = "<class 'bool'>"
    if (str(type(v_input)) != v_type):
        error_msg = error_msg_str(v_input, v_name, method, v_type, suppress_errors, suppress_console_outputs)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return False
        raise ValueError(error_msg)
# RETURNS
    return True


def val_str(v_input, v_name, method, min_len = -1, max_len = -1, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that v_input is of type str
# ARGUMENTS
    # str (hopefully) v_input
    # str v_name
    # str method
    # optional int min_len
    # optional int max_len
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # optional str v_arg_type
# ARGUMENT VALIDATION
    my_f = 'val_str'
    v_type = "<class 'str'>"
    # suppress_errors
    val_bool(suppress_errors, 'suppress_errors', my_f)
    # suppress_console_outputs
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        print(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors))
        return False
    # method
    valid = True
    if str(type(method)) != v_type:
        valid = False
    else:
        if len(method) < 1:
            valid = False
    if not valid:
        error_msg = error_msg_str(method, 'method', my_f, v_type)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return False
        raise ValueError(error_msg)
    my_f = method + '.' + my_f
    # v_name
    valid = True
    if str(type(v_name)) != v_type:
        valid = False
    else:
        if len(v_name) < 1:
            valid = False
    if not valid:
        error_msg = error_msg_str(v_name, 'v_name', my_f, v_type)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return False
        raise ValueError(error_msg)
    # v_arg_type
    valid = True
    if str(type(v_arg_type)) != v_type:
        valid = False
    else:
        if len(v_arg_type) < 1:
            valid = False
    if not valid:
        error_msg = error_msg_str(v_arg_type, 'v_arg_type', my_f, v_type)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return False
        raise ValueError(error_msg)
    # min_len
    v_type = "<class 'int'>"
    if str(type(min_len)) != v_type:
        error_msg = error_msg_str(min_len, 'min_len', my_f, v_type)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return False
        raise ValueError(error_msg)
    # max_len
    v_type = "<class 'int'>"
    valid = True
    if str(type(max_len)) != v_type:
        valid = False
    else:
        if max_len != -1 and max_len < min_len:
            valid = False
    if not valid:
        error_msg = error_msg_str(max_len, 'max_len', my_f, v_type)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return False
        raise ValueError(error_msg)
    # v_input
# VARIABLE INSTANTIATION
    v_type = "<class 'str'>"
    valid = True
# METHODS
    if str(type(v_input)) != v_type:
        valid = False
    else:
        L = len(v_input)
        if min_len != -1 and L < min_len:
            valid = False
            print(f"Minimum str length {min_len} not met.")
        if max_len != -1 and L > max_len:
            print(f"Maximum str length {max_len} not met.")
            valid = False
    if not valid:
        error_msg = error_msg_str(v_input, v_name, method, v_type, suppress_errors, suppress_console_outputs, v_arg_type)
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return False
        raise ValueError(error_msg)
# RETURNS
    return True

# def val_none(v_input, v_name, method, v_arg_type = 'argument', suppress_errors = False, suppress_console_outputs = False):
# # FUNCTION
#     # evaluate if v_input is None
# # ARGUMENTS
# # ARGUMENT VALIDATION
# # VARIABLE INSTANTIATION
# # METHODS
# # RETURNS

def val_int(v_input, v_name, method, v_min: Optional[int] = None, v_max: Optional[int] = None, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that myinput is of type int, and if not None, limited by v_min and v_max
# ARGUMENTS
    # int (hopefully) myinput
    # str v_name
    # str method
    # optional int v_min
    # optional int v_max
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # optional str v_arg_type
# ARGUMENT VALIDATION
    my_f = 'val_int'
    # suppress_errors
    val_bool(suppress_errors, 'suppress_errors', my_f)
    # suppress_console_outputs
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        print(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors))
        return False
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    my_f = method + '.' + my_f
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_min
    if (v_min != None):
        if not val_int(v_min, 'v_min', my_f, None, None, suppress_errors, suppress_console_outputs):
            return False
    # v_max
    if (v_max != None):
        if not val_int(v_max, 'v_max', my_f, None, None, suppress_errors, suppress_console_outputs):
            return False
    # v_input
# VARIABLE INSTANTIATION
    mytype = "<class 'int'>" # str(type(myinput))
    error_msg = error_msg_str(v_input, v_name, method, mytype, suppress_errors, suppress_console_outputs, v_arg_type)
# METHODS
    if not mytype == str(type(v_input)):
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return False
        raise ValueError(error_msg)
    if (v_min != None and v_max != None):
        if (v_min > v_max):
            if suppress_errors:
                if not suppress_console_outputs:
                    print(error_msg + f"\nInverted minimum and maximum values {v_min} and {v_max}.")
                return False
            raise ValueError(error_msg + f"\nInverted minimum and maximum values {v_min} and {v_max}.")
    if (v_min != None):
        if (v_input < v_min):
            if suppress_errors:
                if not suppress_console_outputs:
                    print(error_msg + f"\nValue less than minimum {v_min}.")
                return False
            raise ValueError(error_msg + f"\nValue less than minimum {v_min}.")
    if (v_max != None):
        if (v_input > v_max):
            if suppress_errors:
                if not suppress_console_outputs:
                    print(error_msg + f"\nValue greater than maximum {v_max}.")
                return False
            raise ValueError(error_msg + f"\nValue greater than maximum {v_max}.")
# RETURNS
    return True


def val_float(v_input, v_name, method, v_min = None, v_max = None, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that v_input is of type float, and if not None, limited by v_min and v_max
# ARGUMENTS
    # float (hopefully) v_input
    # str v_name
    # str method
    # optional float v_min
    # optional float v_max
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # optional str v_arg_type
# ARGUMENT VALIDATION
    my_f = 'val_float'
    # suppress_errors
    val_bool(suppress_errors, 'suppress_errors', my_f)
    # suppress_console_outputs
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        print(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors))
        return False
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    my_f = method + '.' + my_f
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_min
    if (v_min != None):
        if not val_float(v_min, 'v_min', my_f, None, None, suppress_errors, suppress_console_outputs):
            return False
    # v_max
    if (v_max != None):
        if not val_float(v_max, 'v_max', my_f, None, None, suppress_errors, suppress_console_outputs):
            return False
    # v_input
# VARIABLE INSTANTIATION
    mytype = "<class 'float'>" # str(type(myinput))
    error_msg = error_msg_str(v_input, v_name, method, mytype, suppress_errors, suppress_console_outputs, v_arg_type)
# METHODS
    if not mytype == str(type(v_input)):
        if suppress_errors:
            if not suppress_console_outputs:
                print(error_msg)
            return False
        raise ValueError(error_msg)
    if (v_min != None and v_max != None):
        if (v_min > v_max):
            if suppress_errors:
                if not suppress_console_outputs:
                    print(error_msg + f"\nInverted minimum and maximum values {v_min} and {v_max}.")
                return False
            raise ValueError(error_msg + f"\nInverted minimum and maximum values {v_min} and {v_max}.")
    if (v_min != None):
        if (v_input < v_min):
            if suppress_errors:
                if not suppress_console_outputs:
                    print(error_msg + f"\nValue less than minimum {v_min}.")
                return False
            raise ValueError(error_msg + f"\nValue less than minimum {v_min}.")
    if (v_max != None):
        if (v_input > v_max):
            if suppress_errors:
                if not suppress_console_outputs:
                    print(error_msg + f"\nValue greater than maximum {v_max}.")
                return False
            raise ValueError(error_msg + f"\nValue greater than maximum {v_max}.")
# RETURNS
    return True

def input_bool(v_input, v_name, method, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # input valid str, int, or bool representation of bool, or else None
# ARGUMENTS
    # bool (hopefully) v_input
    # str v_name
    # str method
    # optional str v_arg_type
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
# ARGUMENT VALIDATION
    my_f = 'input_bool'
    if v_input is None: return False
    # suppress_errors
    val_bool(suppress_errors, 'suppress_errors', my_f)
    # suppress_console_outputs
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors))
        return None
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return None
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return None
    my_f = method + '.' + my_f
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return None
# METHODS
    if not val_bool(v_input, v_name, my_f, True, suppress_console_outputs):
        if not val_int(v_input, v_name, my_f, 0, 1, True, suppress_console_outputs):
            # if str(type(v_input)) == "<class 'bytes'>":
                # return bool(v_input)
            v_input = str(v_input)
            error_msg = error_msg_str(v_input, v_name, method, "<class 'bool'>", suppress_errors, suppress_console_outputs, v_arg_type)
            if not val_str(v_input, v_name, my_f, suppress_errors=True, suppress_console_outputs=suppress_console_outputs):
                if suppress_errors:
                    if not suppress_console_outputs:
                        print(error_msg)
                    return None
                raise ValueError(error_msg)
            else:
                my_truths = ['1', 'Y', 'YE', 'YES', 'YS', 'YESH', 'YEA', 'YEAH', 'TRUE', 'TRU', 'TRUTH', 'TURE', 'T', "B'\X01'"]
                my_falths = ['0', 'N', 'NO', 'FALSE', 'F', 'FAIL', 'FALS', "B'\X00'"]
                v_input = v_input.upper()
                for i in range(len(my_truths)):
                    if my_truths[i] == v_input:
                        return True
                for i in range(len(my_falths)):
                    if my_falths[i] == v_input:
                        return False
                if suppress_errors:
                    if not suppress_console_outputs:
                        print(error_msg)
                    return None
                raise ValueError(error_msg)
        else:
            return False if v_input == 0 else True
# RETURNS
    return bool(v_input)

def full_val_bool(v_input, v_name, method, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that bool input is bool or valid equivalent
# ARGUMENTS
    # bool (hopefully) my_input
    # str v_name
    # str method
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # optional str v_arg_type
# ARGUMENT VALIDATION
    my_f = 'full_val_bool'
    val_bool(suppress_errors, 'suppress_errors', my_f)
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors))
        return False
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    my_f = method + '.' + my_f
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
# RETURNS
    return not (str(type(input_bool(v_input, v_name, method, suppress_errors, suppress_console_outputs, v_arg_type))) == "<class 'NoneType'>")


def input_int(v_input, v_name, method, v_min = None, v_max = None, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # input int or valid equivalent, or else None
# ARGUMENTS
    # int or str v_input
    # str v_name
    # str method
    # v_min
    # v_min
    # bool suppress_errors
    # bool suppress_console_outputs
    # optional str v_arg_type
# ARGUMENT VALIDATION
    my_f = 'input_int'
    val_bool(suppress_errors, 'suppress_errors', my_f)
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors))
        return None
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return None
    my_f = method + '.' + my_f
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return None
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return None
    # v_min
    if not str(type(v_min)) == "<class 'NoneType'>":
        v_min = input_int(v_min, 'v_min', my_f, None, v_max, suppress_errors, suppress_console_outputs)
        if str(type(v_min)) == "<class 'NoneType'>": return None
    # v_max
    if not str(type(v_max)) == "<class 'NoneType'>":
        v_max = input_int(v_max, 'v_min', my_f, v_min, None, suppress_errors, suppress_console_outputs)
        if str(type(v_max)) == "<class 'NoneType'>": return None
# METHODS
    error_msg = error_msg_str(v_input, v_name, method, "<class 'int'>", suppress_errors, suppress_console_outputs, v_arg_type)
    # v_input
    try:
        my_int = int(v_input)
    except:
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_msg)
            return None
        int(v_input)
    if not str(type(v_min)) == "<class 'NoneType'>":
        if my_int < v_min:
            if suppress_errors:
                if not suppress_console_outputs:
                    Helper_App.console_log(f"{error_msg}\nInt input less than minimum value. Value = {v_input}, minimum = {v_min}.")
                return None
    if not str(type(v_max)) == "<class 'NoneType'>":
        if my_int > v_max:
            if suppress_errors:
                if not suppress_console_outputs:
                    Helper_App.console_log(f"{error_msg}\nInt input greater than maximum value. Value = {v_input}, maximum = {v_max}.")
                return None
# RETURNS
    return my_int


def full_val_int(v_input, v_name, method, v_min = None, v_max = None, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that v_input is int or equivalent, else False, limited by v_min and v_max
# ARGUMENTS
    # int (hopefully) v_input
    # str v_name
    # str method
    # optional float v_min
    # optional float v_max
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # optional str v_arg_type
# ARGUMENT VALIDATION
    my_f = 'full_val_int'
    val_bool(suppress_errors, 'suppress_errors', my_f)
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors))
        return False
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_min
    if not str(type(v_min)) == "<class 'NoneType'>":
        v_min = input_int(v_min, 'v_min', method, None, v_max, suppress_errors, suppress_console_outputs)
        if str(type(v_min)) == "<class 'NoneType'>": return False
    # v_max
    if not str(type(v_max)) == "<class 'NoneType'>":
        v_max = input_int(v_max, 'v_min', method, v_min, None, suppress_errors, suppress_console_outputs)
        if str(type(v_max)) == "<class 'NoneType'>": return False
# RETURNS
    return not (str(type(input_int(v_input, v_name, method, v_min, v_max, suppress_errors, suppress_console_outputs))) == "<class 'NoneType'>")


def input_float(v_input, v_name, method, v_min = None, v_max = None, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # input float, else return None
# ARGUMENTS
    # float/int/str(numeric) v_input
    # str v_name
    # str method
    # optional float v_min
    # optional float v_min
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # optional str v_arg_type
# ARGUMENT VALIDATION
    my_f = 'input_float'
    val_bool(suppress_errors, 'suppress_errors', my_f)
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors))
        return None
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return None
    my_f = method + '.' + my_f
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return None
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return None
    # v_min
    if not str(type(v_min)) == "<class 'NoneType'>":
        v_min = input_float(v_min, 'v_min', my_f, None, v_max, suppress_errors, suppress_console_outputs)
        if str(type(v_min)) == "<class 'NoneType'>": return None
    # v_max
    if not str(type(v_max)) == "<class 'NoneType'>":
        v_max = input_float(v_max, 'v_min', my_f, v_min, None, suppress_errors, suppress_console_outputs)
        if str(type(v_max)) == "<class 'NoneType'>": return None
# METHODS
    error_msg = error_msg_str(v_input, v_name, method, "<class 'float'>", suppress_errors, suppress_console_outputs, v_arg_type)
    # v_input
    try:
        my_float = float(v_input)
    except:
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_msg)
            return None
        float(v_input)
    if not str(type(v_min)) == "<class 'NoneType'>":
        if v_input < v_min:
            if suppress_errors:
                if not suppress_console_outputs:
                    Helper_App.console_log(f"{error_msg}\nInt input less than minimum value. Value = {v_input}, minimum = {v_min}.")
                return None
    if not str(type(v_max)) == "<class 'NoneType'>":
        if v_input > v_max:
            if suppress_errors:
                if not suppress_console_outputs:
                    Helper_App.console_log(f"{error_msg}\nInt input greater than maximum value. Value = {v_input}, maximum = {v_max}.")
                return None
# RETURNS
    return my_float


def full_val_float(v_input, v_name, method, v_min = None, v_max = None, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that v_input is numeric, and if not False, limited by v_min and v_max
# ARGUMENTS
    # float (hopefully) v_input
    # str v_name
    # str method
    # optional float v_min
    # optional float v_max
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
# ARGUMENT VALIDATION
    my_f = 'full_val_float'
    val_bool(suppress_errors, 'suppress_errors', my_f)
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors))
        return False
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    my_f = method + '.' + my_f
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_min
    if not str(type(v_min)) == "<class 'NoneType'>":
        v_min = input_float(v_min, 'v_min', method, None, v_max, suppress_errors, suppress_console_outputs)
        if str(type(v_min)) == "<class 'NoneType'>": return False
    # v_max
    if not str(type(v_max)) == "<class 'NoneType'>":
        v_max = input_float(v_max, 'v_min', method, v_min, None, suppress_errors, suppress_console_outputs)
        if str(type(v_max)) == "<class 'NoneType'>": return False
# RETURNS
    return not (str(type(input_float(v_input, v_name, method, v_min, v_max, suppress_errors, suppress_console_outputs))) == "<class 'NoneType'>")


def make_ordinal(n):
# FUNCTION
    # Get ordinal representation of number
# ARGUMENTS
    # int n
# ARGUMENT VALIDATION
    full_val_int(n, 'n', 'make_ordinal', 0)
# VARIABLE INSTANTIATION
    n = int(n)
# METHODS
    if 11 <= (n % 100):
        suffix= 'th'
    else:
        suffix = ['th', 'st', 'nd', 'rd', 'th'][min(n % 10, 4)]
# RETURNS
    return str(n) + suffix


def val_type(v_input, v_name, method, v_type, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that v_input is of type v_type
# ARGUMENTS
    # v_type (hopefully) v_input
    # str v_name
    # str method
    # str v_type
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # str v_arg_type
# ARGUMENT VALIDATION
    my_f = 'val_type'
    val_bool(suppress_errors, 'suppress_errors', my_f)
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors))
        return False
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    my_f = method + '.' + my_f
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_type
    # error_message = error_msg_str(v_type, 'v_type', my_f, v_arg_type)
    if not val_str(v_type, 'v_type', my_f, 6, -1, suppress_errors, suppress_console_outputs): return False
    # v_input
    error_message = error_msg_str(v_input, v_name, method, v_arg_type)
    mytype = str(type(v_input))
    # if not (v_type == 'int' or v_type == 'bool' or v_type == 'float' or v_type == 'complex' or v_type == 'str' or v_type == 'NoneType'):
    if not mytype == v_type: # f"<class '{v_type}'>":
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_message)
            return False
        raise ValueError(error_message)
# RETURNS
    return True


def val_instance(v_input, v_name, method, v_type, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that v_input is of type v_type
# ARGUMENTS
    # v_type (hopefully) v_input
    # str v_name
    # str method
    # type v_type
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # str v_arg_type
# ARGUMENT VALIDATION
    my_f = 'val_type'
    val_bool(suppress_errors, 'suppress_errors', my_f)
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors))
        return False
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    my_f = method + '.' + my_f
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_type
    error_message = error_msg_str(v_type, 'v_type', my_f, v_arg_type)
    if not isinstance(v_type, type): # mytype == v_type: # f"<class '{v_type}'>":
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_message)
            return False
        raise ValueError(error_message) # val_str(v_type, 'v_type', my_f, 6, -1, suppress_errors, suppress_console_outputs): return False
    # v_input
    error_message = error_msg_str(v_input, v_name, method, v_arg_type)
    # mytype = str(type(v_input))
    # if not (v_type == 'int' or v_type == 'bool' or v_type == 'float' or v_type == 'complex' or v_type == 'str' or v_type == 'NoneType'):
    if not isinstance(v_input, v_type): # mytype == v_type: # f"<class '{v_type}'>":
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_message)
            return False
        raise ValueError(error_message)
# RETURNS
    return True


def val_list(v_input, v_name, method, v_type = '', min_len = -1, max_len = -1, suppress_errors = False, suppress_console_outputs: bool = False, allow_nuns = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that v_input is of type list, and if defined: has v_len elements of type v_type
# ARGUMENTS
    # list[v_type] (hopefully) v_input
    # str v_name - variable name
    # str method - parent method
    # str v_type - type of list items
    # int min_len - minimum length of list
    # int max_len - maximum length of list
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # optional bool allow_nuns
    # optional str v_arg_type
# ARGUMENT VALIDATION
    my_f =  'val_list'
    val_bool(suppress_errors, 'suppress_errors', my_f)
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors))
        return False
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    my_f = method + '.' + my_f
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_type
    # if not val_type(v_type, 'v_type', my_f, type, suppress_errors, suppress_console_outputs): return False
    if not val_str(v_type, 'v_type', my_f, -1, -1, suppress_errors, suppress_console_outputs): return False
    # min_len
    if not full_val_int(min_len, 'min_len', my_f, None, None if max_len == -1 else max_len, suppress_errors, suppress_console_outputs): return False
        # min_len = input_int(min_len, 'min_len', method, None, max_len, suppress_errors, suppress_console_outputs)
        # if str(type(min_len)) == "<class 'NoneType'>": return False
    # max_len
    if not full_val_int(max_len, 'max_len', my_f, None if max_len == -1 else (None if min_len == -1 else min_len), None, suppress_errors, suppress_console_outputs): return False
    # if not str(type(max_len)) == "<class 'NoneType'>":
    #     max_len = input_int(max_len, 'max_len', method, min_len, None, suppress_errors, suppress_console_outputs)
    #     if str(type(max_len)) == "<class 'NoneType'>": return False
    # allow_nuns
    if not val_bool(allow_nuns, 'allow_nuns', my_f, suppress_errors, suppress_console_outputs): return False
    # v_input
    # mytype = str(type(v_input))
    error_msg = error_msg_str(v_input, v_name, method, "<class 'list'>")
    if not str(type(v_input)) == "<class 'list'>":
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_msg)
            return False
        raise ValueError(error_msg)
    L = len(v_input)
    if max_len > -1 and L > max_len:
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_msg + f'\nInvalid list length. Maximum = {max_len}, length = {L}')
            return False
        raise ValueError(error_msg + f'\nInvalid list length. Maximum = {max_len}, length = {L}')
    if L < min_len:
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_msg + f"Invalid list length. Minimum = {min_len}, length = {L}")
            return False
        raise ValueError(error_msg + f'\nInvalid list length. Minimum = {min_len}, length = {L}')
    if v_type != '' and L > 0:
        for i in range(L):
            # mytype = str(type(v_input[i]))
            if not (val_type(v_input[i], f'{v_name}[{i}]', my_f, v_type, True) or allow_nuns and val_type(v_input[i], f'{v_name}[{i}]', my_f, "<class 'NoneType'>", True)): # mytype == v_type:
                error_msg = error_msg + '\n' + error_msg_str(v_input[i], f'{v_name}[{i}]', my_f, v_type, False, False, 'list element')
                if suppress_errors:
                    if not suppress_console_outputs:
                        Helper_App.console_log(error_msg)
                    return False
                raise ValueError(error_msg)
# RETURNS
    return True


def val_list_instances(v_input, v_name, method, v_type = None, min_len = -1, max_len = -1, suppress_errors = False, suppress_console_outputs: bool = False, allow_nuns = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that v_input is of type list, and if defined: has v_len elements of type v_type
# ARGUMENTS
    # list[v_type] (hopefully) v_input
    # str v_name - variable name
    # str method - parent method
    # type v_type - type of list items
    # int min_len - minimum length of list
    # int max_len - maximum length of list
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # optional bool allow_nuns
    # optional str v_arg_type
# ARGUMENT VALIDATION
    my_f =  'val_list_instances'
    val_bool(suppress_errors, 'suppress_errors', my_f)
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>", suppress_errors))
        return False
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    my_f = method + '.' + my_f
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_type
    if not val_type(v_type, 'v_type', my_f, type, suppress_errors, suppress_console_outputs): return False
    # if not val_str(v_type, 'v_type', my_f, 6, -1, suppress_errors, suppress_console_outputs): return False
    # min_len
    if not full_val_int(min_len, 'min_len', my_f, None, None if max_len == -1 else max_len, suppress_errors, suppress_console_outputs): return False
        # min_len = input_int(min_len, 'min_len', method, None, max_len, suppress_errors, suppress_console_outputs)
        # if str(type(min_len)) == "<class 'NoneType'>": return False
    # max_len
    if not full_val_int(max_len, 'max_len', my_f, None if max_len == -1 else (None if min_len == -1 else min_len), None, suppress_errors, suppress_console_outputs): return False
    # if not str(type(max_len)) == "<class 'NoneType'>":
    #     max_len = input_int(max_len, 'max_len', method, min_len, None, suppress_errors, suppress_console_outputs)
    #     if str(type(max_len)) == "<class 'NoneType'>": return False
    # allow_nuns
    if not val_bool(allow_nuns, 'allow_nuns', my_f, suppress_errors, suppress_console_outputs): return False
    # v_input
    # mytype = str(type(v_input))
    error_msg = error_msg_str(v_input, v_name, method, "<class 'list'>")
    if not str(type(v_input)) == "<class 'list'>":
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_msg)
            return False
        raise ValueError(error_msg)
    L = len(v_input)
    if max_len > -1 and L > max_len:
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_msg + f'\nInvalid list length. Maximum = {max_len}, length = {L}')
            return False
        raise ValueError(error_msg + f'\nInvalid list length. Maximum = {max_len}, length = {L}')
    if L < min_len:
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_msg + f"Invalid list length. Minimum = {min_len}, length = {L}")
            return False
        raise ValueError(error_msg + f'\nInvalid list length. Minimum = {min_len}, length = {L}')
    if v_type != '' and L > 0:
        for i in range(L):
            # mytype = str(type(v_input[i]))
            if not (val_instance(v_input[i], f'{v_name}[{i}]', my_f, v_type, True) or allow_nuns and val_instance(v_input[i], f'{v_name}[{i}]', my_f, type(None), True)): # mytype == v_type:
                error_msg = error_msg + '\n' + error_msg_str(v_input[i], f'{v_name}[{i}]', my_f, v_type, False, False, 'list element')
                if suppress_errors:
                    if not suppress_console_outputs:
                        Helper_App.console_log(error_msg)
                    return False
                raise ValueError(error_msg)
# RETURNS
    return True


def val_nested_list(v_input, v_name, method, depth_i, depth_max, v_type = '', v_min = -1, v_mins = [], v_max = -1, v_maxs = [], suppress_errors = False, suppress_console_outputs = False, allow_nuns = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that v_input is of type list, and if defined: has v_len elements of type v_type
    # for nested list of nested-index i
# ARGUMENTS
    # list[v_type] (hopefully) v_input
    # str v_name
    # str method
    # int depth_i - current depth of nesting of lists
    # int depth_max - maximum depth of nesting of lists - base 0
    # Optional[str] v_type - type of list items
    # Optional[int] v_min - minimum sublist size
    # Optional[list[int]] v_mins - minimum list sizes
    # Optional[int] v_max - maximum sublist size
    # Optional[list[int]] v_maxs - maximum list sizes
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # optional bool allow_nuns
    # optional str v_arg_type
# ARGUMENT VALIDATION
    my_f = 'val_nested_list'
    val_bool(suppress_errors, 'suppress_errors', my_f)
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>"))
        return False
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    my_f = method + '.' + my_f
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_type
    if not val_str(v_type, 'v_type', my_f, -1, -1, suppress_errors, suppress_console_outputs): return False
    # if not val_type(v_type, 'v_type', my_f, type, suppress_errors, suppress_console_outputs): return False
    # v_min
    if not val_int(v_min, 'v_min', my_f, -1, None, suppress_errors, suppress_console_outputs): return False
    # v_max
    if not val_int(v_max, 'v_max', my_f, -1, None, suppress_errors, suppress_console_outputs): return False
    # v_mins
    if not (val_list(v_mins, 'v_mins', my_f, "<class 'int'>", depth_max + 1, depth_max + 1, True, True) or v_mins == []):
        error_msg = error_msg_str(v_mins, 'v_mins', my_f, "<class 'int'>")
        if not suppress_console_outputs:
            Helper_App.console_log(error_msg)
            return False
        raise ValueError(error_msg)
    # v_maxs
    if not (val_list(v_maxs, 'v_maxs', my_f, "<class 'int'>", depth_max + 1, depth_max + 1, True, True) or v_maxs == []):
        error_msg = error_msg_str(v_maxs, 'v_maxs', my_f, "<class 'int'>")
        if not suppress_console_outputs:
            Helper_App.console_log(error_msg)
            return False
        raise ValueError(error_msg)
    # allow_nuns
    if not val_bool(allow_nuns, 'allow_nuns', my_f, suppress_errors, suppress_console_outputs): return False
    # v_input
    mytype = v_type if depth_i == depth_max else "<class 'list'>"
    error_msg = error_msg_str(v_input, v_name, method, mytype, suppress_errors, suppress_console_outputs, v_arg_type)
    if not val_list(v_input, v_name, method, mytype, v_min, v_max, suppress_errors, suppress_console_outputs, allow_nuns, v_arg_type):
        if not suppress_console_outputs:
            Helper_App.console_log(error_msg)
        return False
# METHODS
    L = len(v_input)
    if L == 0:
        if v_min > -1:
            if suppress_errors:
                if not suppress_console_outputs:
                    Helper_App.console_log(error_msg + f'\nMinimum length {v_min} not met.')
                return False
            raise ValueError(error_msg + f'\nMinimum length {v_min} not met.')
    elif depth_i < depth_max:
        for i in range(L):
            if not (v_mins == [] or v_maxs == []):
                if not val_nested_list(v_input[i], v_name, method, depth_i + 1, depth_max, v_type, v_mins[depth_i + 1], v_mins, v_maxs[depth_i + 1], v_maxs, suppress_errors, suppress_console_outputs, v_arg_type):
                    if not suppress_console_outputs:
                        Helper_App.console_log(error_msg)
                    return False
            elif not v_mins == []:
                if not val_nested_list(v_input[i], v_name, method, depth_i + 1, depth_max, v_type, v_mins[depth_i + 1], v_mins, -1, v_maxs, suppress_errors, suppress_console_outputs, v_arg_type):
                    if not suppress_console_outputs:
                        Helper_App.console_log(error_msg)
                    return False
            elif not v_maxs == []:
                if not val_nested_list(v_input[i], v_name, method, depth_i + 1, depth_max, v_type, -1, v_mins, v_maxs[depth_i + 1], v_maxs, suppress_errors, suppress_console_outputs, v_arg_type):
                    if not suppress_console_outputs:
                        Helper_App.console_log(error_msg)
                    return False
            else:
                if not val_nested_list(v_input[i], v_name, method, depth_i + 1, depth_max, v_type, -1, v_mins, -1, v_maxs, suppress_errors, suppress_console_outputs, v_arg_type):
                    if not suppress_console_outputs:
                        Helper_App.console_log(error_msg)
                    return False
# RETURNS
    return True


def val_nested_list_instances(v_input, v_name, method, depth_i, depth_max, v_type = '', v_min = -1, v_mins = [], v_max = -1, v_maxs = [], suppress_errors = False, suppress_console_outputs = False, allow_nuns = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that v_input is of type list, and if defined: has v_len elements of type v_type
    # for nested list of nested-index i
# ARGUMENTS
    # list[v_type] (hopefully) v_input
    # str v_name
    # str method
    # int depth_i - current depth of nesting of lists
    # int depth_max - maximum depth of nesting of lists - base 0
    # Optional[str] v_type - type of list items
    # Optional[int] v_min - minimum sublist size
    # Optional[list[int]] v_mins - minimum list sizes
    # Optional[int] v_max - maximum sublist size
    # Optional[list[int]] v_maxs - maximum list sizes
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # optional bool allow_nuns
    # optional str v_arg_type
# ARGUMENT VALIDATION
    my_f = 'val_nested_list'
    val_bool(suppress_errors, 'suppress_errors', my_f)
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>"))
        return False
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    my_f = method + '.' + my_f
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_type
    # if not val_str(v_type, 'v_type', my_f, -1, -1, suppress_errors, suppress_console_outputs): return False
    if not val_type(v_type, 'v_type', my_f, type, suppress_errors, suppress_console_outputs): return False
    # v_min
    if not val_int(v_min, 'v_min', my_f, -1, None, suppress_errors, suppress_console_outputs): return False
    # v_max
    if not val_int(v_max, 'v_max', my_f, -1, None, suppress_errors, suppress_console_outputs): return False
    # v_mins
    if not (val_list(v_mins, 'v_mins', my_f, "<class 'int'>", depth_max + 1, depth_max + 1, True, True) or v_mins == []):
        error_msg = error_msg_str(v_mins, 'v_mins', my_f, "<class 'int'>")
        if not suppress_console_outputs:
            Helper_App.console_log(error_msg)
            return False
        raise ValueError(error_msg)
    # v_maxs
    if not (val_list(v_maxs, 'v_maxs', my_f, "<class 'int'>", depth_max + 1, depth_max + 1, True, True) or v_maxs == []):
        error_msg = error_msg_str(v_maxs, 'v_maxs', my_f, "<class 'int'>")
        if not suppress_console_outputs:
            Helper_App.console_log(error_msg)
            return False
        raise ValueError(error_msg)
    # allow_nuns
    if not val_bool(allow_nuns, 'allow_nuns', my_f, suppress_errors, suppress_console_outputs): return False
    # v_input
    mytype = v_type if depth_i == depth_max else list # "<class 'list'>"
    error_msg = error_msg_str(v_input, v_name, method, mytype, suppress_errors, suppress_console_outputs, v_arg_type)
    if not val_list_instances(v_input, v_name, method, mytype, v_min, v_max, suppress_errors, suppress_console_outputs, allow_nuns, v_arg_type):
        if not suppress_console_outputs:
            Helper_App.console_log(error_msg)
        return False
# METHODS
    L = len(v_input)
    if L == 0:
        if v_min > -1:
            if suppress_errors:
                if not suppress_console_outputs:
                    Helper_App.console_log(error_msg + f'\nMinimum length {v_min} not met.')
                return False
            raise ValueError(error_msg + f'\nMinimum length {v_min} not met.')
    elif depth_i < depth_max:
        for i in range(L):
            if not (v_mins == [] or v_maxs == []):
                if not val_nested_list(v_input[i], v_name, method, depth_i + 1, depth_max, v_type, v_mins[depth_i + 1], v_mins, v_maxs[depth_i + 1], v_maxs, suppress_errors, suppress_console_outputs, allow_nuns, v_arg_type):
                    if not suppress_console_outputs:
                        Helper_App.console_log(error_msg)
                    return False
            elif not v_mins == []:
                if not val_nested_list(v_input[i], v_name, method, depth_i + 1, depth_max, v_type, v_mins[depth_i + 1], v_mins, -1, v_maxs, suppress_errors, suppress_console_outputs, allow_nuns, v_arg_type):
                    if not suppress_console_outputs:
                        Helper_App.console_log(error_msg)
                    return False
            elif not v_maxs == []:
                if not val_nested_list(v_input[i], v_name, method, depth_i + 1, depth_max, v_type, -1, v_mins, v_maxs[depth_i + 1], v_maxs, suppress_errors, suppress_console_outputs, allow_nuns, v_arg_type):
                    if not suppress_console_outputs:
                        Helper_App.console_log(error_msg)
                    return False
            else:
                if not val_nested_list(v_input[i], v_name, method, depth_i + 1, depth_max, v_type, -1, v_mins, -1, v_maxs, suppress_errors, suppress_console_outputs, allow_nuns, v_arg_type):
                    if not suppress_console_outputs:
                        Helper_App.console_log(error_msg)
                    return False
# RETURNS
    return True


def val_url(v_input, v_name, method, min_len = 12, max_len = -1, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# FUNCTION
    # validate that v_input is of type str
# ARGUMENTS
    # str (hopefully) v_input
    # str v_name
    # str method
    # optional int min_len
    # optional int max_len
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # optional str v_arg_type
# ARGUMENT VALIDATION
    _m = 'val_url'
    v_type = "<class 'str'>"
    val_bool(suppress_errors, 'suppress_errors', _m)
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', _m, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', _m, "<class 'bool'>"))
        return False
    # method
    if not val_str(method, 'method', _m, -1, -1, suppress_errors, suppress_console_outputs): return False
    _m = method + '.' + _m
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', _m, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_name
    if not val_str(v_name, 'v_name', _m, -1, -1, suppress_errors, suppress_console_outputs): return False
    # min_len
    if not val_int(min_len, 'min_len', _m, 10, None, suppress_errors, suppress_console_outputs): return False
    # max_len
    if not val_int(max_len, 'max_len', _m, -1, None, suppress_errors, suppress_console_outputs): return False
    # v_input
    if not val_str(v_input, v_name, method, min_len, -1, suppress_errors, suppress_console_outputs): return False
# METHODS
    error_msg = error_msg_str(v_input, 'v_input', _m, "<class 'str'>")
    if not (v_input[:8] == r'https://' or v_input[:7] == r'http://'):
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_msg)
            return False
        raise ValueError(error_msg)
# RETURNS
    return True

# def val_nparray(v_input, v_name, method, v_min = None, v_max = None, suppress_errors = False, suppress_console_outputs = False, v_arg_type = 'argument'):
# # FUNCTION
#     # validate v_input is numpy ndarray
# # ARGUMENTS
#     # numpy.ndarray v_input
#     # str v_name
#     # str method
#     # 
# # ARGUMENT VALIDATION
# # METHODS
# # RETURNS


def val_DataFrame(v_input, v_name, method, v_types=[], min_col=-1, max_col=-1, cols=[], min_sz=-1, max_sz=-1, suppress_errors=False, suppress_console_outputs=False, v_arg_type='argument'):
# FUNCTION
    # validate that v_input is of type list, and if defined: has v_len elements of type v_type
    # for nested list of nested-index i
# ARGUMENTS
    # pandas.DataFrame (hopefully) v_input
    # str v_name
    # str method
    # optional list[str] v_type - column datatypes
    # optional int min_col - minimum number of columns
    # optional int max_col - maximum number of columns
    # optional list[str] cols - column names
    # optional int min_sz - minimum length of columns
    # optional int max_sz - maximum length of columns
    # optional bool suppress_errors
    # optional bool suppress_console_outputs
    # optional str v_arg_type
# ARGUMENT VALIDATION
    my_f = 'val_DataFrame'
    val_bool(suppress_errors, 'suppress_errors', my_f)
    if not val_bool(suppress_console_outputs, 'suppress_console_outputs', my_f, suppress_errors):
        Helper_App.console_log(error_msg_str(suppress_console_outputs, 'suppress_console_outputs', my_f, "<class 'bool'>"))
        return False
    # method
    if not val_str(method, 'method', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    my_f = method + '.' + my_f
    # v_name
    if not val_str(v_name, 'v_name', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # v_arg_type
    if not val_str(v_arg_type, 'v_arg_type', my_f, 1, -1, suppress_errors, suppress_console_outputs): return False
    # min_col
    if not val_int(min_col, 'min_col', my_f, -1, None, suppress_errors, suppress_console_outputs): return False
    # max_col
    if not val_int(max_col, 'max_col', my_f, -1, None, suppress_errors, suppress_console_outputs): return False
    # min_sz
    if not val_int(min_sz, 'min_sz', my_f, -1, None, suppress_errors, suppress_console_outputs): return False
    # max_sz
    if not val_int(max_sz, 'max_sz', my_f, -1, None, suppress_errors, suppress_console_outputs): return False
    # v_types
    if not (val_list(v_types, 'v_types', my_f, "<class 'str'>", min_col, max_col, True, True, True) or v_types == []):
        error_msg = error_msg_str(v_types, 'v_types', my_f, str)
        if not suppress_console_outputs:
            Helper_App.console_log(error_msg)
            return False
        raise ValueError(error_msg)
    # cols
    if not (val_list(cols, 'cols', my_f, "<class 'str'>", min_col, max_col, True, True) or cols == []):
        error_msg = error_msg_str(cols, 'cols', my_f, "<class 'str'>")
        if not suppress_console_outputs:
            Helper_App.console_log(error_msg)
            return False
        raise ValueError(error_msg)
    # v_input
    if not val_type(v_input, v_name, my_f, "<class 'pandas.core.frame.DataFrame'>", suppress_errors, suppress_console_outputs, v_arg_type): return False
# METHODS
    error_msg = error_msg_str(v_input, v_name, my_f, "<class 'pandas.core.frame.DataFrame'>", v_arg_type=v_arg_type)
    n_c = len(v_input.columns)
    if (min_col > 0 and n_c < min_col) or (max_col > 0 and n_c > max_col):
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_msg)
            return False
        raise ValueError(error_msg)
    my_sz = len(v_input.index)
    if (min_sz > 0 and my_sz < min_sz) or (max_sz > 0 and my_sz > max_sz):
        if suppress_errors:
            if not suppress_console_outputs:
                Helper_App.console_log(error_msg)
            return False
        raise ValueError(error_msg)
    if not v_types == []:
        for col_i in range(n_c):
            if not (v_types[col_i] == None or str(type(v_types[col_i])) == "<class 'str'>" and val_type(v_input.at[0, v_input.columns[col_i]], 'v_input.at[0, v_input.columns[col_i]]', my_f, v_types[col_i], True, False) or val_instance(v_input.at[0, v_input.columns[col_i]], 'v_input.at[0, v_input.columns[col_i]]', my_f, v_types[col_i], True, False)): # str(type(v_input[v_input.columns[col_i]][0])) == v_types[col_i] or v_types[col_i] == '':
                if suppress_errors:
                    if not suppress_console_outputs:
                        Helper_App.console_log(error_msg + f'\nInvalid data type {str(type(v_input.at[0, v_input.columns[col_i]]))} in column {v_input.columns[col_i]}')
                    return False
                raise ValueError(error_msg + f'\nInvalid data type {str(type(v_input.at[0, v_input.columns[col_i]]))} in column {v_input.columns[col_i]}')    
    if not cols == []:
        for col_i in range(n_c):
            if not v_input.columns[col_i] == cols[col_i] or cols[col_i] == '':
                if suppress_errors:
                    if not suppress_console_outputs:
                        Helper_App.console_log(error_msg + f'\nInvalid column heading for column {v_input.columns[col_i]}')
                    return False
                raise ValueError(error_msg + f'\nInvalid column heading for column {v_input.columns[col_i]}')
# RETURNS
    return True



if __name__ == '__main__':
    Helper_App.console_log(input_bool('true', 'input_bool', 'test'))
    Helper_App.console_log(input_bool(None, 'input_bool', 'test'))