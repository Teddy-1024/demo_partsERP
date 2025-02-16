"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Form Base and Meta Classes - data input

Description:
Defines Flask-WTF base forms for handling user input.
"""

# internal
# external
from flask_wtf import FlaskForm
from abc import ABCMeta, abstractmethod


class Form_Base_Meta(type(FlaskForm), ABCMeta):
    pass


class Form_Base(FlaskForm, metaclass=Form_Base_Meta):
    """
    @classmethod
    @abstractmethod
    def from_filters(cls, filters):
        pass
    @abstractmethod
    def __repr__(self):
        pass
    """
    def __repr__(self):
        fields = ', '.join(
            f"{name}={field.data}" for name, field in self._fields.items()
        )
        return f"{self.__class__.__name__}({fields})"
    @classmethod
    @abstractmethod
    def from_json(cls, json):
        pass
    @classmethod
    def get_default(cls):
        return cls()
    """
    @abstractmethod
    def test_69(self):
        pass
        
    def get_Filters_Product_Category(data_request):
        data_form = data_request[Model_View_Store_Product_Category.FLAG_FORM]
        form_filters = Filters_Product_Category(**data_form)
        form_filters.is_not_empty.data = av.input_bool(data_form['is_not_empty'], 'is_not_empty', 'filter_category')
        form_filters.active.data = av.input_bool(data_form['active'], 'active', 'filter_category')
        return form_filters
    """
    @classmethod
    def get_choices_blank(cls):
        return [('', 'Select')]
    @classmethod
    def get_choice_all(cls):
        return ('', 'All')

'''
class Filters_Stored_Procedure_Base(Form_Base):
    """
    @abstractmethod
    def __repr__(self):
        pass
    @classmethod
    @abstractmethod
    def from_json(cls, json):
        pass
    """
    @abstractmethod
    def to_json(self):
        pass
'''