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
    ATTR_ID_CURRENCY: ClassVar[str] = 'id_currency'
    # ATTR_ID_CURRENCY_COST: ClassVar[str] = 'id_currency_cost'
    ATTR_ID_DELIVERY_REGION: ClassVar[str] = 'id_delivery_region'
    ATTR_ID_DISCOUNT: ClassVar[str] = 'id_discount'
    ATTR_ID_IMAGE: ClassVar[str] = 'id_image'
    ATTR_ID_LOCATION_STORAGE: ClassVar[str] = 'id_location_storage'
    ATTR_ID_PRODUCT: ClassVar[str] = 'id_product'
    ATTR_ID_PRODUCT_CATEGORY: ClassVar[str] = 'id_category'
    ATTR_ID_PRODUCT_PERMUTATION: ClassVar[str] = 'id_permutation'
    ATTR_ID_PRODUCT_PRICE: ClassVar[str] = 'id_price'
    ATTR_ID_PRODUCT_VARIATION: ClassVar[str] = 'id_variation'
    ATTR_ID_PRODUCT_VARIATION_TYPE: ClassVar[str] = 'id_variation_type'
    ATTR_ID_STOCK_ITEM: ClassVar[str] = 'id_stock_item'
    FLAG_ACTIVE: ClassVar[str] = 'active'
    FLAG_CAN_ADMIN: ClassVar[str] = 'can_admin'
    FLAG_CAN_EDIT: ClassVar[str] = 'can_edit'
    FLAG_CAN_VIEW: ClassVar[str] = 'can_view'
    FLAG_CODE: ClassVar[str] = 'code'
    FLAG_DESCRIPTION: ClassVar[str] = 'description'
    FLAG_DISPLAY_ORDER: ClassVar[str] = 'display_order'
    FLAG_NAME: ClassVar[str] = 'name'

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

