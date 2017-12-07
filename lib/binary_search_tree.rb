class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
    @movies = []
  end

  def insert(score, title)
    depth = 0
    Node.new(score, title)
    if @root.nil?
       @root = Node.new(score, title)
       return depth
    else
      current_node = @root
      post_insert(Node.new(score, title), current_node)
    end
  end

  def post_insert(new_node, current_node, depth = 0)
    if new_node.score > current_node.score
      depth += 1
      right_node_check(new_node, current_node, depth)
    else
      depth += 1
      left_node_check(new_node, current_node, depth)
    end
  end

  def left_node_check(new_node, current_node, depth)
    if current_node.left_node.nil?
       left_insert(new_node, current_node, depth)
    else
      updated_node = left_movement(new_node, current_node)
      post_insert(new_node, updated_node, depth)
    end
  end

  def right_node_check(new_node, current_node, depth)
    if current_node.right_node.nil?
       right_insert(new_node, current_node, depth)
    else
       updated_node = right_movement(new_node, current_node)
       post_insert(new_node, updated_node, depth)
    end
  end

  def right_movement(new_node, current_node)
    current_node.right_node
  end

  def right_insert(new_node, current_node, depth)
    current_node.right_node = new_node
    return depth
  end

  def left_movement(new_node, current_node)
    current_node.left_node
  end

  def left_insert(new_node, current_node, depth)
    current_node.left_node = new_node
    return depth
  end

  def include?(score, current_node = @root)
    if current_node.nil?
      false
    elsif current_node.score == score
      true
    elsif current_node.score > score
      current_node = current_node.left_node
      include?(score, current_node)
    elsif current_node.score < score
      current_node = current_node.right_node
      include?(score, current_node)
    end
  end

  def depth_of?(score, current_node = @root, depth = 0)
    if current_node.nil?
      false
    elsif current_node.score == score
      return depth
    elsif current_node.score > score
      current_node = current_node.left_node
      depth += 1
      depth_of?(score, current_node, depth)
    elsif current_node.score < score
      current_node = current_node.right_node
      depth += 1
      depth_of?(score, current_node, depth)
    end
  end

  def max(current_node = @root)
    if current_node.right_node.nil?
      {current_node.title => current_node.score}
    else
      current_node = current_node.right_node
      max(current_node)
    end
  end

  def min(current_node = @root)
    if current_node.left_node.nil?
      {current_node.title => current_node.score}
    else
      current_node = current_node.left_node
      min(current_node)
    end
  end

  def sort(current_node = @root)
    if current_node.left_node != nil
      sort(current_node.left_node)
    end
    @movies << {current_node.title => current_node.score}
    if current_node.right_node != nil
      sort(current_node.right_node)
    end
    return @movies
  end

  def load(file)
    File.readlines(file).each do |line|
      insert(line.split(", ")[0], line.split(", ")[1].chomp)
    end
    File.readlines(file).count
  end

end
