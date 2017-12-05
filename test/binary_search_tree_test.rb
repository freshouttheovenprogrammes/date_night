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
    assert_nil tree.root.left_next_node
    assert_nil tree.root.right_next_node
    assert_equal 61, tree.root.score
    assert_equal 0, tree.root.depth
  end

  def test_that_insert_method_returns_depth_of_a_movie
    skip
    tree = BinarySearchTree.new
    bill_and_ted = tree.insert(61, "Bill and Ted's Excellent Adventure")

    assert_equal 0, bill_and_ted
  end

  def test_that_nodes_can_be_inserted_one_level_deep
    tree = BinarySearchTree.new
    pulp_fiction = tree.insert(78, "Pulp Fiction")
    green_mile = tree.insert(68, "The Green Mile")
    brave_toaster = tree.insert(88, "The Brave Little Toaster")
    root = tree.root

    assert_equal pulp_fiction, root
    assert_equal brave_toaster, root.right_next_node
    assert_equal green_mile, root.left_next_node
  end

  def test_that_nodes_can_be_inserted_multiple_levels_deep
    tree = BinarySearchTree.new
    tree.insert(78, "Pulp Fiction")
    first_left_node = tree.insert(68, "The Green Mile")
    first_right_node = tree.insert(88, "The Brave Little Toaster")
    toaster_2 = tree.insert(89, "The Brave Little Toaster2")
    toaster_3 = tree.insert(67, "The Brave Little Toaster3")

    assert_equal toaster_2, first_right_node.right_next_node
    assert_equal toaster_3, first_left_node.left_next_node
  end

  def test_that_insert_updates_depth
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
    tree = BinarySearchTree.new
    tree.insert(78, "Pulp Fiction")

    assert tree.include?(78)
    refute tree.include?(44)
  end

  def test_include_method_finds_depth_of_one_movies_score
    tree = BinarySearchTree.new
    tree.insert(78, "Pulp Fiction")
    tree.insert(44, "Where The Wild Things Are")
    tree.insert(99, "Surfer Nazis Must Die")

    assert tree.include?(78)
    assert tree.include?(44)
    assert tree.include?(99)
  end

end
