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

  def test_that_when_insert_method_called_that_first_node_is_root
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal "Bill & Ted's Excellent Adventure", tree.root.title
    assert_equal 61, tree.root.score
    assert Node, tree.root
  end

  def test_that_when_insert_method_called_nodes_go_left_and_right
    tree = BinarySearchTree.new
    tree.insert(78, "Pulp Fiction")
    tree.insert(68, "The Green Mile")
    tree.insert(88, "The Brave Little Toaster")

    assert_equal "Pulp Fiction", tree.root.title
    assert_equal 78, tree.root.score
    assert Node, tree.root

    assert_equal "The Green Mile", tree.root.left_next_node.title
    assert_equal 68, tree.root.left_next_node.score

    assert_equal "The Brave Little Toaster", tree.root.right_next_node.title
    assert_equal 88, tree.root.right_next_node.score
  end

end
