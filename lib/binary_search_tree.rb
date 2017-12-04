class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(score, title)
    # current = root
    if root.nil?
      @root = Node.new(score, title)
    # else
    #   current = @root
    end
  end

end
