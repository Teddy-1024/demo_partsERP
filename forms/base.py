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
    @classmethod
    def get_choices_blank(cls):
        return [('', 'Select')]
    @classmethod
    def get_choice_all(cls):
        return ('', 'All')
