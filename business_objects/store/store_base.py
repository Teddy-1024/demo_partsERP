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
# from helpers.DEPRECATED.helper_abc import Interface_ABC
from business_objects.base import Base
from extensions import db
import lib.argument_validation as av
# external
from typing import ClassVar

"""
class I_Store_Base():
    @abstractmethod
    def __repr__(self):
        pass
    @classmethod
    @abstractmethod
    def from_json(cls, json):
        pass
    @abstractmethod
    def to_json(self):
        pass
    @abstractmethod
    def to_json_option(self):
        pass
    @abstractmethod
    def test_69 (self):
        pass
    ""
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
    ""
"""

class Store_Base(Base):
    # ATTR_ID_CURRENCY_COST: ClassVar[str] = 'id_currency_cost'
    ATTR_ID_DISCOUNT: ClassVar[str] = 'id_discount'
    ATTR_ID_IMAGE: ClassVar[str] = 'id_image'
    ATTR_ID_LOCATION_STORAGE: ClassVar[str] = 'id_location_storage'
    ATTR_ID_PLANT: ClassVar[str] = 'id_plant'
    ATTR_ID_PRODUCT: ClassVar[str] = 'id_product'
    ATTR_ID_PRODUCT_CATEGORY: ClassVar[str] = 'id_category'
    ATTR_ID_PRODUCT_IMAGE: ClassVar[str] = 'id_image'
    ATTR_ID_PRODUCT_PERMUTATION: ClassVar[str] = 'id_permutation'
    ATTR_ID_PRODUCT_PRICE: ClassVar[str] = 'id_price'
    ATTR_ID_PRODUCT_VARIATION: ClassVar[str] = 'id_variation'
    ATTR_ID_PRODUCT_VARIATION_TYPE: ClassVar[str] = 'id_type'
    ATTR_ID_STOCK_ITEM: ClassVar[str] = 'id_stock_item'
    FLAG_CURRENCY: ClassVar[str] = 'currency'
    FLAG_DELIVERY_OPTION: ClassVar[str] = 'delivery_option'
    FLAG_HAS_VARIATIONS: ClassVar[str] = 'has_variations'
    FLAG_IS_OUT_OF_STOCK: ClassVar[str] = 'is_out_of_stock'
    FLAG_PRODUCT: ClassVar[str] = 'product'
    FLAG_PRODUCT_CATEGORY: ClassVar[str] = 'product_category'
    FLAG_PRODUCT_IMAGE: ClassVar[str] = 'product_image'
    FLAG_PRODUCT_PERMUTATION: ClassVar[str] = 'product_permutation'
    FLAG_PRODUCT_PRICE: ClassVar[str] = 'product_price'
    FLAG_PRODUCT_VARIATION: ClassVar[str] = 'product_variation'
    FLAG_PRODUCT_VARIATIONS: ClassVar[str] = f'{FLAG_PRODUCT_VARIATION}s'
    FLAG_PRODUCT_VARIATION_TYPE: ClassVar[str] = 'product_variation_type'
    FLAG_QUANTITY_MIN: ClassVar[str] = 'quantity_min'
    FLAG_QUANTITY_MAX: ClassVar[str] = 'quantity_max'
    FLAG_STOCK_ITEM: ClassVar[str] = 'stock_item'
    FLAG_TEXT: ClassVar[str] = 'text'
    FLAG_VALUE_TEXT: ClassVar[str] = 'value_text'
    