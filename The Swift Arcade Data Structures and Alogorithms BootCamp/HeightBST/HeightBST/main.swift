//
//  main.swift
//  HeightBST
//
//  Created by Kant on 2022/02/07.
//

import Foundation

class Node {
    var key: Int = 0
    var left: Node?
    var right: Node?
    var c: Int = 0
    
    init(_ key: Int) {
        self.key = key
    }
    
    func height() -> Int {
        if isLeaf {
            return 0
        } else {
            print("left: \(left?.height() ?? 0), right: \(right?.height() ?? 0), c: \(c)")
            c = c + 1
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
}

let root = Node(20)
root.left = Node(8)
root.right = Node(22)
root.left?.left = Node(4)
root.left?.right = Node(12)
root.left?.right?.left = Node(10)
root.left?.right?.right = Node(14)

root.height()
