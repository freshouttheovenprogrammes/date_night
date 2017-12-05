require_relative 'test_helper'
require './lib/binary_search_tree'
require './lib/node'

class BinarySearchTreeTest < Minitest::Test

  def test_that_it_exists
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end

  def test_that_tree_has_an_empty_root
    tree = BinarySearchTree.new

    assert_nil tree.root
  end

  def test_that_insert_includes_node_updated_attributes_and_left_right_nodes_nil
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal "Bill & Ted's Excellent Adventure", tree.root.title
    assert_nil tree.root.left_node
    assert_nil tree.root.right_node
    assert_equal 61, tree.root.score
    assert_equal 0, tree.root.depth
  end

  def test_that_include_returns_the_depth_of_node_inserted
    tree = BinarySearchTree.new
    result = tree.insert(61, "Bill & Ted's Excellent Adventure")
    result2 = tree.insert(99, "Surfer Nazis Must Die")
    result3 = tree.insert(55, "Bill & Ted's Excellent Adventure")

    assert_equal 0, result
    assert_equal 0, result
    assert_equal 0, result
  end

  def test_that_nodes_can_be_inserted_one_level_deep
    skip
    tree = BinarySearchTree.new
    pulp_fiction = tree.insert(78, "Pulp Fiction")
    green_mile = tree.insert(68, "The Green Mile")
    brave_toaster = tree.insert(88, "The Brave Little Toaster")
    root = tree.root

    assert_equal pulp_fiction, root
    assert_equal brave_toaster, root.right_node
    assert_equal green_mile, root.left_node
  end

  def test_that_nodes_can_be_inserted_multiple_levels_deep
    skip
    tree = BinarySearchTree.new
    tree.insert(78, "Pulp Fiction")
    first_left_node = tree.insert(68, "The Green Mile")
    first_right_node = tree.insert(88, "The Brave Little Toaster")
    toaster_2 = tree.insert(89, "The Brave Little Toaster2")
    toaster_3 = tree.insert(67, "The Brave Little Toaster3")

    assert_equal toaster_2, first_right_node.right_node
    assert_equal toaster_3, first_left_node.left_node
  end

  def test_that_insert_updates_depth
    skip
    tree = BinarySearchTree.new
    root = tree.insert(78, "Pulp Fiction")
    first_left_node = tree.insert(68, "The Green Mile")
    first_right_node = tree.insert(88, "The Brave Little Toaster")
    toaster_2 = tree.insert(89, "The Brave Little Toaster2")
    toaster_3 = tree.insert(67, "The Brave Little Toaster3")

    assert_equal 0, root.depth
    assert_equal 1, first_left_node.depth
    assert_equal 1, first_right_node.depth
    assert_equal 2, toaster_2.depth
    assert_equal 2, toaster_3.depth
  end

  def test_include_method_finds_root_score
    skip
    tree = BinarySearchTree.new
    tree.insert(78, "Pulp Fiction")

    assert tree.include?(78)
    refute tree.include?(44)
  end
end
