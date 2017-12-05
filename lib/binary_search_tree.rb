class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(score, title)
    current = @root
    if @root.nil?
      @root = Node.new(score, title)
    elsif current.score > root.score
      current.right_insert(score, title)
    elsif current.score < root.score
      current.left_insert(score, title)
    end
  end

  def right_insert(score, title, current = @root)
    depth = 0
      if root.score < current.score
        current = root.right_next_node
        depth += 1
      else
        depth = 0
      end
  end
end
