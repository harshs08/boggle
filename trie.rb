require_relative 'trie_node'

class Trie
  attr_accessor :root

  def initialize
    @root = {}
  end

  def add_word(word, node = @root)
    if word.length == 0
      node[:terminal] = true
    else
      root = word[0]
      branch = word[1..-1]
      node[root] ||= {}
      add_word(branch, node[root])
    end
  end
end