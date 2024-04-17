# -*- coding: utf-8 -*-
"""
Created on Thu Apr 27 12:33:59 2023

@author: Edward Middleton-Smith

Argument Validation
"""

# CLASSES
# ATTRIBUTE DECLARATION
# METHODS
    # FUNCTION
    # ARGUMENTS
    # ARGUMENT VALIDATION
    # ATTRIBUTE + VARIABLE INSTANTIATION
    # METHODS
    # RETURNS
    
# NORMAL METHODS
# FUNCTION
# ARGUMENTS
# ARGUMENT VALIDATION
# VARIABLE INSTANTIATION
# METHODS
# RETURNS

# IMPORTS

# CLASSES

# METHODS
def get_enum_member_by_text(enum_class, text):
    for member in enum_class.__members__.values():
        if member.name == text:
            return member
    raise ValueError(f'{text} is not in {enum_class}')