class Node
  attr_reader   :score,
                :title
  attr_accessor :left_node,
                :right_node

  def initialize(score, title)
    @title      = title
    @score      = score
    @left_node  = nil
    @right_node = nil
    @depth      = 0
  end

end
