class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(score, title)
    new_node = Node.new(score, title)
    if @root.nil?
       @root = new_node
    else
      new_node.depth = 1
      current_node = @root
      post_insert(new_node, current_node)
    end
  end

  def post_insert(new_node, current_node)
    if new_node.score > current_node.score
      right_node_check(new_node, current_node)
    else
      left_node_check(new_node, current_node)
    end
  end

  def left_node_check(new_node, current_node)
    if current_node.left_next_node.nil?
       left_insert(new_node, current_node)
    else
      updated_node = left_movement(new_node, current_node)
      post_insert(new_node, updated_node)
    end
  end

  def right_node_check(new_node, current_node)
    if current_node.right_next_node.nil?
      right_insert(new_node, current_node)
    else
       updated_node = right_movement(new_node, current_node)
       post_insert(new_node, updated_node)
    end
  end

  def right_movement(new_node, current_node)
   new_node.depth += 1
   return current_node.right_next_node
  end

  def right_insert(new_node, current_node)
    current_node.right_next_node = new_node
  end

  def left_movement(new_node, current_node)
    new_node.depth += 1
    return current_node.left_next_node
  end

  def left_insert(new_node, current_node)
    current_node.left_next_node = new_node
  end
end
  # TODO make hash converter so like Hash.new(score, title)
