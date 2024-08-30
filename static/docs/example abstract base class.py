from abc import abstractmethod
import types

class AbstractBaseClass:
    def __init_subclass__(cls, **kwargs):
        super().__init_subclass__(**kwargs)
        for name, value in vars(AbstractBaseClass).items():
            if getattr(value, "__isabstractmethod__", False):
                if name not in cls.__dict__:
                    raise TypeError(f"Can't instantiate class {cls.__name__} "
                                    f"without implementation of abstract method {name}")
                subclass_value = cls.__dict__[name]
                if (isinstance(value, (staticmethod, classmethod)) and 
                    not isinstance(subclass_value, type(value))):
                    raise TypeError(f"Abstract {type(value).__name__} {name} in {cls.__name__} "
                                    f"must be implemented as a {type(value).__name__}")

    def __new__(cls, *args, **kwargs):
        if cls is AbstractBaseClass:
            raise TypeError("Can't instantiate abstract class AbstractBaseClass directly")
        return super().__new__(cls)

    @abstractmethod
    def instance_method(self):
        pass

    @classmethod
    @abstractmethod
    def class_method(cls):
        pass

    @staticmethod
    @abstractmethod
    def static_method():
        pass

class ConcreteClass(AbstractBaseClass):
    def instance_method(self):
        return "Implemented instance method"

    @classmethod
    def class_method(cls):
        return "Implemented class method"

    @staticmethod
    def static_method():
        return "Implemented static method"

class IncompleteClass(AbstractBaseClass):
    def instance_method(self):
        return "Only implemented instance method"
    # class_method and static_method are not implemented

class IncorrectImplementationClass(AbstractBaseClass):
    def instance_method(self):
        return "Implemented instance method"

    @classmethod
    def class_method(cls):
        return "Implemented class method"

    def static_method(self):  # This should be a static method, not an instance method
        return "Incorrectly implemented static method"

# Usage
if __name__ == "__main__":
    try:
        concrete = ConcreteClass()
        print(concrete.instance_method())
        print(ConcreteClass.class_method())
        print(ConcreteClass.static_method())
    except TypeError as e:
        print(f"Error with ConcreteClass: {e}")

    try:
        IncompleteClass()
    except TypeError as e:
        print(f"Error with IncompleteClass: {e}")

    try:
        IncorrectImplementationClass()
    except TypeError as e:
        print(f"Error with IncorrectImplementationClass: {e}")

    try:
        AbstractBaseClass()
    except TypeError as e:
        print(f"Error with AbstractBaseClass: {e}")
