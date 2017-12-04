require_relative 'test_helper'
require './lib/node'

class NodeTest < Minitest::Test

  def test_it_exists
    node = Node.new(50, "string")

    assert_instance_of Node, node
  end

  def test_it_can_retrieve_title
    node = Node.new(22, "titlestuff")

    assert_equal "titlestuff", node.title
    assert_equal 22, node.score
  end

  def test_it_can_retrieve_other_title
    node1 = Node.new(66, "wow")
    node2 = Node.new(77, "wowie")
    node3 = Node.new(88, "wowiejeezum")

    assert_equal "wow", node1.title
    assert_equal 66, node1.score
    assert_equal "wowie", node2.title
    assert_equal 77, node2.score
    assert_equal "wowiejeezum", node3.title
    assert_equal 88, node3.score
  end

  def test_it_has_link_to_left_and_right
    node1 = Node.new(66, "Cheeseburger")
    node2 = Node.new(100_000, "Cheeseburger_In_Paradise")
    node3 = Node.new(999_999_999, "Cheeseburger_In_My_Mouth")

    assert_equal "Cheeseburger", node1.title
    assert_equal 66, node1.score
    assert_nil node1.left_next_node
    assert_nil node1.right_next_node

    assert_equal "Cheeseburger_In_Paradise", node2.title
    assert_equal 100_000, node2.score
    assert_nil node2.left_next_node
    assert_nil node2.right_next_node

    assert_equal "Cheeseburger_In_My_Mouth", node3.title
    assert_equal 999_999_999, node3.score
    assert_nil node3.left_next_node
    assert_nil node3.right_next_node
  end
end
