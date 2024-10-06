from abc import abstractmethod
from functools import wraps
import inspect

def Interface_ABC(cls):
    abstract_methods = {}
    for name, value in vars(cls).items():
        if getattr(value, '__isabstractmethod__', False):
            if isinstance(value, classmethod):
                abstract_methods[name] = 'classmethod'
            elif isinstance(value, staticmethod):
                abstract_methods[name] = 'staticmethod'
            else:
                abstract_methods[name] = 'method'
    
    def decorator(subclass):
        for method, method_type in abstract_methods.items():
            if not hasattr(subclass, method):
                raise NotImplementedError(
                    f"'{subclass.__name__}' must implement abstract {method_type} '{method}' from interface '{cls.__name__}'"
                )
            
            subclass_value = getattr(subclass, method)
            
            if method_type == 'classmethod' and not isinstance(subclass_value, classmethod):
                raise TypeError(f"'{method}' must be a classmethod in '{subclass.__name__}'")
            elif method_type == 'staticmethod' and not isinstance(subclass_value, staticmethod):
                raise TypeError(f"'{method}' must be a staticmethod in '{subclass.__name__}'")
            elif method_type == 'method' and (isinstance(subclass_value, (classmethod, staticmethod)) or inspect.isfunction(subclass_value)):
                # For normal methods, we accept either functions or methods, as unbound methods are functions in Python 3
                pass
            else:
                raise TypeError(f"'{method}' has incorrect type in '{subclass.__name__}'")
        
        return subclass
    
    return decorator

