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
    ATTR_ID_MSG_ERROR_TYPE: ClassVar[str] = 'id_type'
    ATTR_ID_REGION: ClassVar[str] = 'id_region'
    ATTR_ID_USER: ClassVar[str] = 'id_user'
    ATTR_ID_USER_MANAGER: ClassVar[str] = 'id_user_manager'
    FLAG_ACCESS_LEVEL_REQUIRED: ClassVar[str] = 'access_level_required'
    FLAG_ACTIVE: ClassVar[str] = 'active'
    FLAG_ADDRESS: ClassVar[str] = 'address'
    FLAG_ADDRESS_LINE_1: ClassVar[str] = 'address_line_1'
    FLAG_ADDRESS_LINE_2: ClassVar[str] = 'address_line_2'
    FLAG_CAN_ADMIN: ClassVar[str] = 'can_admin'
    FLAG_CAN_EDIT: ClassVar[str] = 'can_edit'
    FLAG_CAN_VIEW: ClassVar[str] = 'can_view'
    FLAG_CITY: ClassVar[str] = 'city'
    FLAG_CODE: ClassVar[str] = 'code'
    FLAG_COUNTY: ClassVar[str] = 'county'
    FLAG_CREATED_BY: ClassVar[str] = 'created_by'
    FLAG_CREATED_ON: ClassVar[str] = 'created_on'
    FLAG_CURRENCY: ClassVar[str] = 'currency'
    FLAG_CURRENCY_COST: ClassVar[str] = 'currency_cost'
    FLAG_DATE_FROM: ClassVar[str] = 'date_from'
    FLAG_DATE_TO: ClassVar[str] = 'date_to'
    FLAG_DESCRIPTION: ClassVar[str] = 'description'
    FLAG_DISPLAY_ORDER: ClassVar[str] = 'display_order'
    FLAG_EDIT: ClassVar[str] = 'edit'
    FLAG_EMAIL: ClassVar[str] = 'email'
    FLAG_FAX: ClassVar[str] = 'fax'
    FLAG_GUID: ClassVar[str] = 'guid'
    FLAG_IS_NOT_EMPTY: ClassVar[str] = 'is_not_empty'
    # FLAG_KEY_PRIMARY: ClassVar[str] = 'key_primary'
    FLAG_MESSAGE: ClassVar[str] = 'message'
    FLAG_NAME: ClassVar[str] = 'name'
    FLAG_NAME_ATTR_OPTION_TEXT: ClassVar[str] = 'NAME_ATTR_OPTION_TEXT'
    FLAG_NAME_ATTR_OPTION_VALUE: ClassVar[str] = 'NAME_ATTR_OPTION_VALUE'
    FLAG_NAME_SINGULAR: ClassVar[str] = 'name_singular'
    FLAG_NAME_PLURAL: ClassVar[str] = 'name_plural'
    FLAG_PHONE_NUMBER: ClassVar[str] = 'phone_number'
    FLAG_POSTCODE: ClassVar[str] = 'postcode'
    FLAG_PRIORITY: ClassVar[str] = 'priority'
    FLAG_REGION: ClassVar[str] = 'region'
    FLAG_ROWS: ClassVar[str] = 'rows'
    FLAG_SYMBOL: ClassVar[str] = 'symbol'
    FLAG_URL: ClassVar[str] = 'url'
    FLAG_USER: ClassVar[str] = 'authorisedUser' # 'user' already used
    FLAG_VALUE_LOCAL_VAT_EXCL: ClassVar[str] = 'value_local_vat_excl'
    FLAG_VALUE_LOCAL_VAT_INCL: ClassVar[str] = 'value_local_vat_incl'
    FLAG_WEBSITE: ClassVar[str] = 'website'
    def __repr__(self):
        attrs = '\n'.join(f'{k}={v!r}' for k, v in self.__dict__.items())
        return f'<{self.__class__.__name__}(\n{attrs}\n)>'
    
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