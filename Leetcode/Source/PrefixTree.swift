
class Trie {
      class Node {
    var isEnd = false
    var data: [Node?] = Array(repeating: nil, count: 26)

    func has(char: Character) -> Bool {
      guard let index = char.asciiValue?.intValue.asciiOrderNumber else { return false }

      return data[index - Character("a").asciiValue!.intValue] != nil
    }

    func getNode(by char: Character) -> Node? {
      guard let index = char.asciiValue?.intValue.asciiOrderNumber else { return nil }

      return data[index]
    }

    func insert(char: Character, node: Node) -> Bool {
      guard let index = char.asciiValue?.intValue.asciiOrderNumber else { return false }

      data[index] = node
      return true
    }
  }

    var root: Node

    /** Initialize your data structure here. */
    init() {
        self.root = Node()
    }

    /** Inserts a word into the trie. */
    func insert(_ word: String) {// print("insert: \(word)")
      var node: Node? = root

      for char in word {
        if node?.getNode(by: char) == nil {
          node?.insert(char: char, node: Node())
        }
          node = node?.getNode(by: char)
      }

      node?.isEnd = true
    }

    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool { //print("search \(word)")
      guard let node = search(word: word) else { return false }

      return node.isEnd
    }

    private func search(word: String) -> Node? {
      var node = root

      for char in word {
        if let charNode = node.getNode(by: char) {
          node = charNode
        } else {
          return nil
        }
      }

      return node
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {// print("startWith: \(prefix)")
        return search(word: prefix) != nil
    }

   class func test() {
      let tree = Trie()
      let input = [
        "app",
        "apple",
        "beer",
        "add",
        "jam",
        "rental"
      ]

      input.forEach(tree.insert(_:))

      print(tree.search("app"))
    }
}

extension Int {
  var asciiOrderNumber: Int { return  self - Character("a").asciiValue!.intValue }
}

extension UInt8 {
  var intValue: Int { return Int(self) }
}
/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
