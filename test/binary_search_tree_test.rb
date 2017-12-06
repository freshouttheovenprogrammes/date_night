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
  end

  def test_that_include_returns_the_depth_of_node_inserted
    tree = BinarySearchTree.new
    result = tree.insert(61, "Bill & Ted's Excellent Adventure")
    result2 = tree.insert(99, "Surfer Nazis Must Die")
    result3 = tree.insert(55, "Bill & Ted's Excellent Adventure 2")
    result4 = tree.insert(60, "Buffy The Vampire Slayer")
    result5 = tree.insert(54, "Heathers")

    assert_equal 0, result
    assert_equal 1, result2
    assert_equal 1, result3
    assert_equal 2, result4
    assert_equal 2, result5
  end

  # def test_that_nodes_can_be_inserted_one_level_deep
  #   tree = BinarySearchTree.new
  #   pulp_fiction = tree.insert(78, "Pulp Fiction")
  #   green_mile = tree.insert(68, "The Green Mile")
  #   brave_toaster = tree.insert(88, "The Brave Little Toaster")
  #   root = tree.root
  #
  #   assert_equal pulp_fiction, root
  #   assert_equal brave_toaster, root.right_node
  #   assert_equal green_mile, root.left_node
  # end
  #
  # def test_that_nodes_can_be_inserted_multiple_levels_deep
  #   tree = BinarySearchTree.new
  #   tree.insert(78, "Pulp Fiction")
  #   first_left_node = tree.insert(68, "The Green Mile")
  #   first_right_node = tree.insert(88, "The Brave Little Toaster")
  #   tree.insert(89, "The Brave Little Toaster2")
  #   tree.insert(67, "The Brave Little Toaster3")
  #
  #   assert_equal "The Brave Little Toaster2", first_right_node.right_node.name
  #   assert_equal "The Brave Little Toaster3", first_left_node.left_node.name
  # end

  def test_include_method_finds_node_score
    tree = BinarySearchTree.new
    tree.insert(78, "Pulp Fiction")

    assert tree.include?(78)
    refute tree.include?(44)
  end

  def test_depth_of_returns_depth
    tree = BinarySearchTree.new
    tree.insert(78, "Pulp Fiction")
    tree.insert(99, "Cool As Ice: The Vanilla Ice Movie")
    tree.insert(44, "Bulb Friction")

    assert_equal 0, tree.depth_of?(78)
    assert_equal 1, tree.depth_of?(44)
    assert_equal 1, tree.depth_of?(99)
  end

  def test_max_score_found
    tree = BinarySearchTree.new
    tree.insert(78, "Pulp Fiction")
    tree.insert(79, "Pulpy Fiction")
    tree.insert(76, "Pulpish Fiction")
    tree.insert(99, "Pulpous Fiction")
    expected = {"Pulpous Fiction" => 99}

    assert_equal expected, tree.max
  end

  def test_min_score_found
    tree = BinarySearchTree.new
    tree.insert(78, "Pulp Fiction")
    tree.insert(1, "Pulpous Fiction")
    tree.insert(79, "Pulpy Fiction")
    tree.insert(76, "Pulpish Fiction")
    expected = {"Pulpous Fiction" => 1}

    assert_equal expected, tree.min
  end
end
