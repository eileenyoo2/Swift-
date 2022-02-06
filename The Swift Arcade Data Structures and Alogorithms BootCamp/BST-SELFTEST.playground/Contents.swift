import UIKit

class Node {
    var key = 0
    var left: Node?
    var right: Node?
    
    init(_ key: Int) {
        self.key = key
    }
}

class SAMPLETEST {
    var root: Node?
    
    func insert(key: Int) {
        root = insertItem(root, key)
    }
    
    private func insertItem(_ node: Node?, _ key: Int) -> Node {
        guard let node = node else {
            let node = Node(key)
            return node
        }
        
        if key < node.key {
            node.left = insertItem(node.left, key)
        }
        if key > node.key {
            node.right = insertItem(node.right, key)
        }
        return node
    }
}

SAMPLETEST().insert(key: 5)
SAMPLETEST().insert(key: 3)
SAMPLETEST().insert(key: 2)
SAMPLETEST().insert(key: 4)
SAMPLETEST().insert(key: 7)
SAMPLETEST().insert(key: 6)
SAMPLETEST().insert(key: 8)

print(SAMPLETEST())
