class Node
  attr_reader   :score,
                :title
  attr_accessor :left_next_node,
                :right_next_node,
                :depth

  def initialize(score, title)
    @title           = title
    @score           = score
    @left_next_node  = nil
    @right_next_node = nil
    @depth           = 0
  end

end

# Was getting 2 given 0 expected on Node.class when depth was reader not
# accessor but it works fine when it is accessor????! what gives?
