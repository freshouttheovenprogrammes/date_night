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

  def test_that_nodes_can_be_inserted_one_level_deep
    tree = BinarySearchTree.new
    pulp_fiction = tree.insert(78, "Pulp Fiction")
    green_mile = tree.insert(68, "The Green Mile")
    brave_toaster = tree.insert(88, "The Brave Little Toaster")

    assert_equal 0, pulp_fiction
    assert_equal 1, brave_toaster
    assert_equal 1, green_mile
  end

  def test_that_nodes_can_be_inserted_multiple_levels_deep
    tree = BinarySearchTree.new
    tree.insert(78, "Pulp Fiction")
    tree.insert(68, "The Green Mile")
    tree.insert(88, "The Brave Little Toaster")
    brave_toaster2 = tree.insert(89, "The Brave Little Toaster2")
    brave_toaster3 = tree.insert(67, "The Brave Little Toaster3")

    assert_equal 2, brave_toaster2
    assert_equal 2, brave_toaster3
  end

  def test_include_method_finds_node_score
    tree = BinarySearchTree.new
    tree.insert(78, "Pulp Fiction")
    tree.insert(22, "Sick Nasty")
    tree.insert(99, "Chic: The Movie")

    assert tree.include?(78)
    refute tree.include?(44)
    assert tree.include?(22)
    assert tree.include?(99)
  end

  def test_depth_of_returns_depth
    tree = BinarySearchTree.new
    tree.insert(78, "Pulp Fiction")
    tree.insert(99, "Cool As Ice: The Vanilla Ice Movie")
    tree.insert(44, "Bulb Friction")

    assert_equal 0, tree.depth_of(78)
    assert_equal 1, tree.depth_of(44)
    assert_equal 1, tree.depth_of(99)
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

  def test_load_method
    tree = BinarySearchTree.new
    tree.load("movies.txt")

    assert_equal "Hannibal Buress: Animal Furnace", tree.root.title
    assert_equal 71, tree.root.score
    assert_equal "Hannibal Buress: Comedy Camisado", tree.root.right_node.title
    assert_equal 80, tree.root.right_node.score
  end

  def test_sort_method_works
    tree = BinarySearchTree.new
    tree.insert(50, "Pulp Fiction")
    tree.insert(45, "Pulpish Fiction")
    tree.insert(47, "Pulpish DOJ")
    tree.insert(33, "Pulpish OJ")
    tree.insert(99, "Gran Kilo")
    tree.insert(68, "Blow Up")
    tree.insert(1, "Johnny Deepend")

    assert_equal [{"Johnny Deepend"=>1},
                  {"Pulpish OJ"=>33},
                  {"Pulpish Fiction"=>45},
                  {"Pulpish DOJ"=>47},
                  {"Pulp Fiction"=>50},
                  {"Blow Up"=>68},
                  {"Gran Kilo"=>99}], tree.sort
  end

  def test_sort_method_works_after_load
    tree = BinarySearchTree.new
    tree.load("movies_fixture.txt")

    assert_equal [{"Meet My Valentine"=>17},
                  {"Experimenter"=>55},
                  {"Hannibal Buress: Animal Furnace"=>71},
                  {"French Dirty"=>75},
                  {"Hannibal Buress: Comedy Camisado"=>80}], tree.sort
  end
end
