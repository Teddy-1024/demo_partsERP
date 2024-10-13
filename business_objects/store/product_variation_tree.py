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
                if my_type_list[index_type] != other_type_list[index_type]:
                    is_equal = False
                    break
        return is_equal
    @classmethod
    def from_product_permutation(cls, product_permutation):
        depth_max = len(product_permutation.variations)
        node_root = Product_Variation_Tree_Node.from_variation_and_node_parent(product_permutation.variations[0], None)
        node = node_root
        for depth in range(depth_max - 1):
            node = Product_Variation_Tree_Node.from_variation_and_node_parent(product_permutation.variations[depth + 1], node)
        return cls.from_node_root(node_root)
    @classmethod
    def from_product_variation(cls, product_variation):
        node_root = Product_Variation_Tree_Node.from_variation_and_node_parent(product_variation, None)
        return cls.from_node_root(node_root)
    @classmethod
    def from_product_variations(cls, product_variations):
        node_root = Product_Variation_Tree_Node.from_variation_and_node_parent(product_variations[0], None)
        tree = cls.from_node_root(node_root)
        if len(product_variations) > 1:
            for variation in product_variations[1:]:
                tree.add_product_variation(variation)
        return tree
    @classmethod
    def from_json_str(cls, json_str):
        variations = []
        if json_str is None or json_str == '': return None
        for json_variation in json_str.split(','):
            parts = json_variation.split(':')
            if len(parts) != 2: continue
            variation = Product_Variation()
            variation.id_type = parts[0]
            variation.id_variation = parts[1]
            variations.append(variation)
        return cls.from_product_variations(variations)
    """
    def get_name_variations(self):
        node = self.node_root
        name = node.variation.name_variation_type
        at_leaf_node = node.is_leaf()
        while not at_leaf_node:
            node = node.nodes_child[0]
            name += f', {node.variation.name_variation_type}'
            at_leaf_node = node.is_leaf()
        return name
    """
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
        variations.append(node.variation)
        while not at_leaf_node:
            node = node.nodes_child[0]
            at_leaf_node = node.is_leaf()
            variations.append(node.variation)
        return variations
    def to_preview_str(self):
        print(f'Product_Variation_Tree.to_preview_str')
        variations = self.get_product_variations()
        print(f'variations: {variations}')
        preview_str = ''
        for variation in variations:
            is_first = (preview_str == '')
            preview_str += f'{variation.variation_type.name_singular}: {variation.name}'
            if is_first:
                preview_str += '\n'
        print(f'preview_str: {preview_str}')
        return preview_str
    def to_json(self):
        variations = self.get_product_variations()
        json_variations = []
        for variation in variations:
            json_variations.append(variation.to_json())
        return json_variations
    def to_variation_id_pairs_str(self):
        variations = self.get_product_variations()
        pairs_str = ''
        for variation in variations:
            pairs_str += f'{variation.id_type}:{variation.id_variation},'
        return pairs_str
"""
class Product_Variation_Container(BaseModel):
    variation_types: list = []
    variations: list = []

    def add_product_variation_type(self, variation_type):
        av.val_instance(variation_type, 'variation_type', 'Product_Variation_Container.add_product_variation_type', Product_Variation_Type)
        self.variations.append(variation_type)
    def add_product_variation(self, variation):
        av.val_instance(variation, 'variation', 'Product_Variation_Container.add_product_variation', Product_Variation)
        if variation.variation_type is None:
            variation_type = next(filterfalse(lambda x: x.id_type != variation.id_type, self.variation_types), None)
            if variation_type is not None:
                variation.variation_type = variation_type
        self.variations.append(variation)

    def __repr__(self):
        return f'Product_Variation_Container:\nvariations_types: {self.variation_types}\nvariations: {self.variations}'
    
    def to_list_variation_options(self):
        list_variations = []
        for variation in self.variations:
            list_variations.append(variation.to_json_option())
        print(f'list_variations: {list_variations}')
        return list_variations
    def to_list_variation_type_options(self):
        list_variation_types = []
        for variation_type in self.variation_types:
            list_variation_types.append(variation_type.to_json_option())
        return list_variation_types
"""