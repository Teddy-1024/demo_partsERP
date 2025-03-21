

def get_enum_member_by_text(enum_class, text):
    for member in enum_class.__members__.values():
        if member.name == text:
            return member
    raise ValueError(f'{text} is not in {enum_class}')