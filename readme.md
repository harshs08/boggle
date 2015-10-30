1. What external resources would help?
Trie gem and more comprhensive word list

2. What factors impact performance? What would you do to improve them?
Word's list load time, transversal along the nodes in the trie.
Can use mutlithreaded program to load word list.

3. What are the key data structures in use here? What makes them more appropriate than alternatives?
Trie and Sets
Tries insertion and search is order of O(L) where L is length of string.
Sets provide a way to store only unique values

4. Can your solution handle words that occur within other words? i.e. 'catcher' -> ['cat', 'catch', 'her']
No