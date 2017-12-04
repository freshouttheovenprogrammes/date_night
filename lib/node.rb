class Node
  attr_reader :data
  attr_accessor :left_next_node,
                :right_next_node

  def initialize(data)
    @data            = data
    @left_next_node  = nil
    @right_next_node = nil
  end

end
