require_relative 'node'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
    @movies = []
  end

  def insert(score, title)
    if @root.nil?
       @root = Node.new(score, title)
       return @root.depth
    else
      current_node = @root
      post_insert(Node.new(score, title), current_node)
    end
  end

  def depth_add(new_node)
    new_node.depth += 1
  end

  def post_insert(new_node, current_node, depth = 0)
    if new_node.score > current_node.score
      depth_add(new_node)
      right_node_check(new_node, current_node, depth)
    else
      depth_add(new_node)
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
    return new_node.depth
  end

  def left_movement(new_node, current_node)
    current_node.left_node
  end

  def left_insert(new_node, current_node, depth)
    current_node.left_node = new_node
    return new_node.depth
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

  def depth_of(score, current_node = @root, depth = 0)
    if current_node.nil?
      false
    elsif current_node.score == score
      return depth
    elsif current_node.score > score
      current_node = current_node.left_node
      depth += 1
      depth_of(score, current_node, depth)
    elsif current_node.score < score
      current_node = current_node.right_node
      depth += 1
      depth_of(score, current_node, depth)
    end
  end

  def max(current_node = @root)
    if current_node.right_node.nil?
      hashify(current_node)
    else
      current_node = current_node.right_node
      max(current_node)
    end
  end

  def min(current_node = @root)
    if current_node.left_node.nil?
      hashify(current_node)
    else
      current_node = current_node.left_node
      min(current_node)
    end
  end

  def sort(current_node = @root)
    if current_node.left_node != nil
      sort(current_node.left_node)
    end
    @movies << hashify(current_node)
    if current_node.right_node != nil
      sort(current_node.right_node)
    end
    return @movies
  end

  def load(file)
    file = "./data/" + file
    File.readlines(file).each do |line|
      insert(line.split(", ")[0].to_i, line.split(", ")[1].chomp)
    end
    File.readlines(file).count
  end

  def hashify(current_node)
    "#{current_node.score} => #{current_node.title}"
  end

end
