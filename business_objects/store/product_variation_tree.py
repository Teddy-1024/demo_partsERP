"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Product Business Object

Description:
Business object for product
"""

# internal
from business_objects.store.product_variation_type import Product_Variation_Type
from extensions import db
from helpers.helper_app import Helper_App
# external


class Product_Variation_Tree_Node():
    variation_type: Product_Variation_Type
    node_parent: None
    nodes_child: list
    def __init__(self):
        self.nodes_child = []
    def from_variation_type_and_node_parent(variation_type, node_parent):
        node = Product_Variation_Tree_Node()
        node.variation_type = variation_type
        node.node_parent = node_parent
        return node
    def from_node_parent(node_parent):
        node = Product_Variation_Tree_Node()
        node.node_parent = node_parent
        return node
    def add_child(self, node_child):
        self.nodes_child.append(node_child)
    def is_leaf(self):
        return (len(self.nodes_child) == 0)

class Product_Variation_Tree():
    node_root: Product_Variation_Tree_Node
    @classmethod
    def from_node_root(cls, node_root):
        tree = cls()
        tree.node_root = node_root
        return tree
    @classmethod
    def from_variation_type_root(cls, variation_type_root):
        node_root = Product_Variation_Tree_Node.from_variation_type_and_node_parent(variation_type_root, None)
        return cls.from_node_root(node_root)
    def is_equal(self, tree):
        my_type_list = self.get_product_variations()
        sz_me = len(my_type_list)
        other_type_list = tree.get_product_variations()
        sz_other = len(other_type_list)
        is_equal = (sz_me == sz_other)
        if is_equal:
            for index_type in range(sz_me):
                my_variation_type = my_type_list[index_type]
                other_variation_type = other_type_list[index_type]
                if my_variation_type.id_type != other_variation_type.id_type:
                    is_equal = False
                    break
                my_variation = my_variation_type.variations[0]
                other_variation = other_variation_type.variations[0]
                if my_variation.id_variation != other_variation.id_variation:
                    is_equal = False
                    break
        return is_equal
    @classmethod
    def from_product_permutation(cls, product_permutation):
        depth_max = len(product_permutation.variation_types)
        node_root = Product_Variation_Tree_Node.from_variation_type_and_node_parent(product_permutation.variation_types[0], None)
        node = node_root
        for depth in range(depth_max - 1):
            node = Product_Variation_Tree_Node.from_variation_type_and_node_parent(product_permutation.variation_types[depth + 1], node)
        return cls.from_node_root(node_root)
    @classmethod
    def from_product_variation_type(cls, product_variation_type):
        node_root = Product_Variation_Tree_Node.from_variation_type_and_node_parent(product_variation_type, None)
        return cls.from_node_root(node_root)
    @classmethod
    def from_product_variation_types(cls, product_variation_types):
        node_root = Product_Variation_Tree_Node.from_variation_type_and_node_parent(product_variation_types[0], None)
        tree = cls.from_node_root(node_root)
        if len(product_variation_types) > 1:
            for variation_type in product_variation_types[1:]:
                tree.add_product_variation_type(variation_type)
        return tree
    @classmethod
    def from_json_str(cls, json_str):
        variation_types = []
        if json_str is None or json_str == '': return None
        for json_variation_type in json_str.split(','):
            parts = json_variation_type.split(':')
            if len(parts) != 2: continue
            variation_type = Product_Variation_Type()
            variation_type.id_type = parts[0]
            variation = Product_Variation()
            variation_type.id_variation = parts[1]
            variation_type.variations = [variation]
            variation_types.append(variation_type)
        return cls.from_product_variation_types(variation_types)
    def get_node_leaf(self):
        node = self.node_root
        at_leaf_node = node.is_leaf()
        while not at_leaf_node:
            node = node.nodes_child[0]
            at_leaf_node = node.is_leaf()
        return node
    def add_product_variation_type(self, variation_type):
        node_leaf = self.get_node_leaf()
        node_new = Product_Variation_Tree_Node.from_variation_type_and_node_parent(variation_type, node_leaf)
        node_leaf.add_child(node_new)
    def get_product_variation_types(self):
        types = []
        node = self.node_root
        at_leaf_node = node.is_leaf()
        while not at_leaf_node:
            types.append(node.variation_type)
            node = node.nodes_child[0]
            at_leaf_node = node.is_leaf()
        return types
    """
    def get_product_variations(self):
        variations = []
        node = self.node_root
        at_leaf_node = node.is_leaf()
        variations.append(node.variation)
        while not at_leaf_node:
            node = node.nodes_child[0]
            at_leaf_node = node.is_leaf()
            variations.append(node.variation)
        return variations
    """
    def to_preview_str(self):
        Helper_App.console_log(f'Product_Variation_Tree.to_preview_str')
        variation_types = self.get_product_variation_types()
        Helper_App.console_log(f'variation_types: {variation_types}')
        preview_str = ''
        for variation_type in variation_types:
            is_first = (preview_str == '')
            preview_str += f'{variation_type.name}: {variation_type.variations[0].name}'
            if is_first:
                preview_str += '\n'
        Helper_App.console_log(f'preview_str: {preview_str}')
        return preview_str
    def to_json(self):
        variation_types = self.get_product_variation_types()
        json_variation_types = []
        for variation_type in variation_types:
            json_variation_types.append(variation_type.to_json())
        return json_variation_types
    def to_variation_id_pairs_str(self):
        variation_types = self.get_product_variation_types()
        pairs_str = ''
        for variation_type in variation_types:
            pairs_str += f'{variation_type.id_type}:{variation_type.variations[0].id_variation},'
        return pairs_str