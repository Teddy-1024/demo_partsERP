"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Base Business Object

Description:
Abstract business object
"""

# internal
from extensions import db
import lib.argument_validation as av
# external
from typing import ClassVar


class Base():
    ATTR_ID_ACCESS_LEVEL: ClassVar[str] = 'id_access_level'
    ATTR_ID_ADDRESS: ClassVar[str] = 'id_address'
    ATTR_ID_CURRENCY: ClassVar[str] = 'id_currency'
    ATTR_ID_REGION: ClassVar[str] = 'id_region'
    ATTR_ID_USER: ClassVar[str] = 'id_user'
    ATTR_ID_USER_MANAGER: ClassVar[str] = 'id_user_manager'
    FLAG_ACCESS_LEVEL_REQUIRED: ClassVar[str] = 'access_level_required'
    FLAG_ACTIVE: ClassVar[str] = 'active'
    FLAG_ADDRESS: ClassVar[str] = 'address'
    FLAG_CAN_ADMIN: ClassVar[str] = 'can_admin'
    FLAG_CAN_EDIT: ClassVar[str] = 'can_edit'
    FLAG_CAN_VIEW: ClassVar[str] = 'can_view'
    FLAG_CODE: ClassVar[str] = 'code'
    FLAG_CURRENCY: ClassVar[str] = 'currency'
    FLAG_CURRENCY_COST: ClassVar[str] = 'currency_cost'
    FLAG_DESCRIPTION: ClassVar[str] = 'description'
    FLAG_DISPLAY_ORDER: ClassVar[str] = 'display_order'
    FLAG_GUID: ClassVar[str] = 'guid'
    FLAG_IS_NOT_EMPTY: ClassVar[str] = 'is_not_empty'
    # FLAG_KEY_PRIMARY: ClassVar[str] = 'key_primary'
    FLAG_NAME: ClassVar[str] = 'name'
    FLAG_NAME_ATTR_OPTION_TEXT: ClassVar[str] = 'NAME_ATTR_OPTION_TEXT'
    FLAG_NAME_ATTR_OPTION_VALUE: ClassVar[str] = 'NAME_ATTR_OPTION_VALUE'
    FLAG_NAME_SINGULAR: ClassVar[str] = 'name_singular'
    FLAG_NAME_PLURAL: ClassVar[str] = 'name_plural'
    FLAG_POSTCODE: ClassVar[str] = 'postcode'
    FLAG_PRIORITY: ClassVar[str] = 'priority'
    FLAG_REGION: ClassVar[str] = 'region'
    FLAG_ROWS: ClassVar[str] = 'rows'
    FLAG_SYMBOL: ClassVar[str] = 'symbol'
    FLAG_URL: ClassVar[str] = 'url'
    FLAG_VALUE_LOCAL_VAT_EXCL: ClassVar[str] = 'value_local_vat_excl'
    FLAG_VALUE_LOCAL_VAT_INCL: ClassVar[str] = 'value_local_vat_incl'
    """
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = 'name-attribute-option-text'
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = 'name-attribute-option-value'
    """
    
    @classmethod
    def output_bool(cls, value):
        return av.input_bool(value, f'{cls.__name__} bool attribute', f'{cls.__name__}.output_bool')
    @staticmethod
    def convert_list_objects_to_list_options(objects):
        return [object.to_json_option() for object in objects]
    @classmethod
    def get_shared_json_attributes(cls, object):
        return {
            cls.FLAG_NAME_ATTR_OPTION_TEXT: object.NAME_ATTR_OPTION_TEXT,
            cls.FLAG_NAME_ATTR_OPTION_VALUE: object.NAME_ATTR_OPTION_VALUE
        }