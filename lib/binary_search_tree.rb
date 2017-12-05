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
        if current_node.right_next_node != nil  # new method ]
          #until right_next_node.nil?
            # right_movement(current_node)
           current_node = current_node.right_next_node
           new_node.depth += 1
          post_insert(new_node, current_node)
        else
          right_insert(new_node, current_node)
        end                                     # end new method
      else
        if current_node.left_next_node.nil?     # another new method
           left_insert(new_node, current_node)
        else
          current_node = current_node.left_next_node
          new_node.depth += 1
          post_insert(new_node, current_node)   # end that new method
        end
    end
  end
  # until


    def right_movement(current_node)
      current_node.right_next_node = current_node
    end

    def right_insert(new_node, current_node)
      current_node.right_next_node = new_node
    end

    def left_movement(current_node)
      current_node.left_next_node = current_node
      new_node.depth += 1
    end

    def left_insert(new_node, current_node)
      current_node.left_next_node = new_node
    end
    #
    # def left_insert(score, title, current = @root)
    #   if root.score < current.score
    #       current = root.right_next_node
    #       depth += 1
    #   end
    # end
end
  # TODO make hash converter so like Hash.new(score, title)

  #       ≈
  #       78
  #      /  \
  #    68    88
  #   /        \
  # 66         98
  #   \
  #    67
