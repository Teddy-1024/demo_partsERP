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

class Store_Base():
    ATTR_ID_ACCESS_LEVEL: ClassVar[str] = 'id_access_level'
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
    FLAG_ACCESS_LEVEL_REQUIRED: ClassVar[str] = 'access_level_required'
    FLAG_ACTIVE: ClassVar[str] = 'active'
    FLAG_CAN_ADMIN: ClassVar[str] = 'can_admin'
    FLAG_CAN_EDIT: ClassVar[str] = 'can_edit'
    FLAG_CAN_VIEW: ClassVar[str] = 'can_view'
    FLAG_CODE: ClassVar[str] = 'code'
    FLAG_DESCRIPTION: ClassVar[str] = 'description'
    FLAG_DISPLAY_ORDER: ClassVar[str] = 'display_order'
    FLAG_HAS_VARIATIONS: ClassVar[str] = 'has_variations'
    FLAG_IS_NOT_EMPTY: ClassVar[str] = 'is_not_empty'
    FLAG_KEY_PRIMARY: ClassVar[str] = 'key_primary'
    FLAG_NAME: ClassVar[str] = 'name'
    FLAG_PERMUTATIONS: ClassVar[str] = 'permutations'
    FLAG_PRIORITY: ClassVar[str] = 'priority'
    FLAG_ROWS: ClassVar[str] = 'rows'
    FLAG_VARIATION_TREES: ClassVar[str] = 'variation_trees'
    @classmethod
    def output_bool(cls, value):
        return av.input_bool(value, f'{cls.__name__} bool attribute', f'{cls.__name__}.output_bool')
    @staticmethod
    def convert_list_objects_to_list_options(objects):
        return [object.to_json_option() for object in objects]
