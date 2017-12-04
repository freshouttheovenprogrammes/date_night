require_relative 'test_helper'
require './lib/node'

class NodeTest < Minitest::Test

  def test_it_exists
    node = Node.new("string")

    assert_instance_of Node, node
  end

  def test_it_can_retrieve_data
    node = Node.new("datastuff")

    assert_equal "datastuff", node.data
  end

  def test_it_can_retrieve_other_data
    node1 = Node.new("wow")
    node2 = Node.new("wowie")
    node3 = Node.new("wowiejeezum")

    assert_equal "wow", node1.data
    assert_equal "wowie", node2.data
    assert_equal "wowiejeezum", node3.data
  end

  def test_it_has_link_to_left_and_right
    node1 = Node.new("Cheeseburger")
    node2 = Node.new("Cheeseburger_In_Paradise")
    node3 = Node.new("Cheeseburger_In_My_Mouth")

    assert_equal "Cheeseburger", node1.data
    assert_nil node1.left_next_node
    assert_nil node1.right_next_node

    assert_equal "Cheeseburger_In_Paradise", node2.data
    assert_nil node2.left_next_node
    assert_nil node2.right_next_node

    assert_equal "Cheeseburger_In_My_Mouth", node3.data
    assert_nil node3.left_next_node
    assert_nil node3.right_next_node
  end
end
