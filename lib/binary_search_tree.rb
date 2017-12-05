class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(score, title)
    @root = Node.new(score, title)
    current = nil
    if @root.nil?
      current = @root
    else
      post_insert(current, root)
    # elsif current.score > root.score
    #   current.right_insert(score, title)
    # elsif current.score < root.score
    #   current.left_insert(score, title)
    end
  end

  def post_insert(current, root)
    if current.score > root.score
       right_insert(score, title)


    else
      current.score < root.score
      left_insert(score, title)
  end
  #
  def right_insert(score, title#, current = @root)
    depth = 0
  #     if root.score < current.score
        current = root.right_next_node
        depth += 1
  #     else
  #       depth = 0
  #     end
  # end
  #
  # def left_insert(score, title, current = @root)
  #   depth = 0
  #     if root.score < current.score
  #       current = root.right_next_node
  #       depth += 1
  #     else
  #       depth = 0
  #     end
  # end
end
