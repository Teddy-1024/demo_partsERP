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
from business_objects.store.product_variation import Product_Variation
from extensions import db
# external


class Product_Variation_Tree_Node():
    variation: Product_Variation
    node_parent: None
    nodes_child: list
    def __init__(self):
        self.nodes_child = []
    def from_variation_and_node_parent(variation, node_parent):
        node = Product_Variation_Tree_Node()
        node.variation = variation
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
    def from_variation_root(cls, variation_root):
        node_root = Product_Variation_Tree_Node.from_variation_and_node_parent(variation_root, None)
        return cls.from_node_root(node_root)
    def is_equal(self, tree):
        my_type_list = self.get_product_variations()
        sz_me = len(my_type_list)
        other_type_list = tree.get_product_variations()
        sz_other = len(other_type_list)
        is_equal = (sz_me == sz_other)
        if is_equal:
            for index_type in range(sz_me):
                if sz_me[index_type] != sz_other[index_type]:
                    is_equal = False
                    break
        return is_equal
    def from_product_permutation(product_permutation):
        depth_max = len(product_permutation.variations)
        node_root = Product_Variation_Tree_Node.from_variation_and_node_parent(product_permutation.variations[0], None)
        node = node_root
        for depth in range(depth_max - 1):
            node = Product_Variation_Tree_Node.from_variation_and_node_parent(product_permutation.variations[depth + 1], node)
        return Product_Variation_Tree.from_node_root(node_root)
    def from_product_variation(product_variation):
        node_root = Product_Variation_Tree_Node.from_variation_and_node_parent(product_variation, None)
        return Product_Variation_Tree.from_node_root(node_root)
    def get_name_variations(self):
        node = self.node_root
        name = node.variation.name_variation_type
        at_leaf_node = node.is_leaf()
        while not at_leaf_node:
            node = node.nodes_child[0]
            name += f', {node.variation.name_variation_type}'
            at_leaf_node = node.is_leaf()
        return name
    def get_node_leaf(self):
        node = self.node_root
        at_leaf_node = node.is_leaf()
        while not at_leaf_node:
            node = node.nodes_child[0]
            at_leaf_node = node.is_leaf()
        return node
    def add_product_variation(self, variation):
        node_leaf = self.get_node_leaf()
        node_new = Product_Variation_Tree_Node.from_variation_and_node_parent(variation, node_leaf)
        node_leaf.add_child(node_new)
    def get_product_variation_types(self):
        types = []
        node = self.node_root
        at_leaf_node = node.is_leaf()
        while not at_leaf_node:
            types.append(node.variation.name_variation_type)
            node = node.nodes_child[0]
            at_leaf_node = node.is_leaf()
        return types
    def get_product_variations(self):
        variations = []
        node = self.node_root
        at_leaf_node = node.is_leaf()
        while not at_leaf_node:
            variations.append(node.variation)
            node = node.nodes_child[0]
            at_leaf_node = node.is_leaf()
        return variations