class TrieNode
  attr_accessor :x, :y, :position, :dictionary, :parent
  def initialize(x, y, position, dictionary, parent)
    @x = x
    @y = y
    @position = position
    @dictionary = dictionary
    @parent = parent
  end
end