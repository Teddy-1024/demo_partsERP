"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Base Store Business Object

Description:
Abstract business object for store objects
"""

# internal
# external
from typing import ClassVar

class Store_Base():
    ATTR_ID_CURRENCY: ClassVar[str] = 'id-currency'
    # ATTR_ID_CURRENCY_COST: ClassVar[str] = 'id-currency-cost'
    ATTR_ID_DELIVERY_REGION: ClassVar[str] = 'id-delivery-region'
    ATTR_ID_DISCOUNT: ClassVar[str] = 'id-discount'
    ATTR_ID_IMAGE: ClassVar[str] = 'id-image'
    ATTR_ID_LOCATION_STORAGE: ClassVar[str] = 'id-location-storage'
    ATTR_ID_PRODUCT: ClassVar[str] = 'id-product'
    ATTR_ID_PRODUCT_CATEGORY: ClassVar[str] = 'id-category'
    ATTR_ID_PRODUCT_PERMUTATION: ClassVar[str] = 'id-permutation'
    ATTR_ID_PRODUCT_PRICE: ClassVar[str] = 'id-price'
    ATTR_ID_PRODUCT_VARIATION: ClassVar[str] = 'id-variation'
    ATTR_ID_PRODUCT_VARIATION_TYPE: ClassVar[str] = 'id_variation_type'
    ATTR_ID_STOCK_ITEM: ClassVar[str] = 'id-stock-item'
    FLAG_ACTIVE: ClassVar[str] = 'active'

    def __init_subclass__(cls, **kwargs):
        super().__init_subclass__(**kwargs)
        for name, value in vars(Store_Base).items():
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
        if cls is Store_Base:
            raise TypeError("Can't instantiate abstract class Store_Base directly")
        return super().__new__(cls)
    
    def __repr__(self):
        pass
    @classmethod
    def from_json(cls, json):
        pass
    def to_json(self):
        pass