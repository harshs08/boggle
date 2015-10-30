require_relative 'trie'
require_relative 'trie_node'
require 'set'

class BoggleSolver

  def build_trie
    trie = Trie.new
    file = File.open("/Users/harshsingh/Desktop/boggle/words.txt", "r")
    file.each_line do |word|
      trie.add_word(word.strip.downcase)
    end
    file.close
    trie
  end
  
  def solver(board, dictionary)
    queue = Array.new
    words = Set.new
    neighbors = [[1,0],  [-1,0], [0,1],
                 [0,-1],         [1,1],
                 [-1,-1],[-1,1],[1,-1]]
  
    (0..3).each do |x|
      (0..3).each do |y|
        position        = board[x][y]
        dictionary_node = dictionary[position]
        parent          = nil
        node            = TrieNode.new(x, y, position, dictionary_node, parent)
        queue.push(node)
      end
    end
  
    while queue.any?
      current_node = queue.pop
      neighbors.each do |x,y|
        x2 = current_node.x + x
        y2 = current_node.y + y
  
        if [x2,y2].all?
          if x2.between?(0,3) && y2.between?(0,3)
            next_position = board[x2][y2]
            next_dict_val = current_node.dictionary[next_position]
            parent        = current_node

            if next_dict_val
              new_node = TrieNode.new(x2, y2, next_position, next_dict_val, parent)
              if next_dict_val[:terminal] && unique_path?(new_node)
                  words.add(recreate_word(new_node))
              end
              queue.push new_node
            end
          end
        end
      end
    end
    words
  end
  
  def recreate_word(node, word = [])
    word.unshift(node.position)
    return word.join if !node.parent
    recreate_word(node.parent, word)
  end
  
  def unique_path?(node, word = [])
    word.push([node.x, node.y])
    if !node.parent
      return word.detect { |pos| word.count(pos) > 1 } ? false : true
    end
    unique_path?(node.parent, word)
  end

end

begin
  boggler = Array.new(4)
  boggler[0] = ['a','b','v','a']
  boggler[1] = ['c','k','d','q']
  boggler[2] = ['i','p','i','a']
  boggler[3] = ['y','a','k','t']
  
  bgs = BoggleSolver.new
  t = bgs.build_trie
  p bgs.solver(boggler, t.root)
end

