//
//  main.swift
//  BinarySearchTreePractice
//
//  Created by Kant on 2022/02/04.
//

import Foundation

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
    
    // CASE: INSERT
    func insert(key: Int) {
        root = insertItem(root, key)
    }
    
    private func insertItem(_ node: Node?, _ key: Int) -> Node {
        // The 'node' is nil
        guard let node = node else {
            let node = Node(key)
            return node
        }
        // The 'node' is not nil
        // key: 현재 입력된 값, node.key: 기존에 갖고있던 값
        if key < node.key {
            node.left = insertItem(node.left, key)
        }
        if key > node.key {
            node.right = insertItem(node.right, key)
        }
        return node
    }
    
    func find(key: Int) -> Int? {
        guard let root = root else { return nil }
        guard let node = find(root, key) else { return nil }
        
        return node.key
    }

    // CASE: FIND
    private func find(_ node: Node?, _ key: Int) -> Node? {
        guard let node = node else { return nil }
        // key: 현재 입력된 값, node.key: 기존에 갖고있던 값
        if node.key == key {
            return node
        } else if key < node.key {
            return find(node.left, key)
        } else if key > node.key {
            return find(node.right, key)
        }
        return nil
        // Note: duplicate keys not allowed so don't need to check
    }
    
    func findMin() -> Int {
        return 0
    }

    private func findMin(_ node: Node) -> Node {
        return Node(0)
    }
    
    func delete(key: Int) {
        // 'root' 가 nil 이라면 return. 그렇지 않으면 delete(&root, key)
        guard let _ = root else { return }
        root = delete(&root, key)
    }
    
    // inout 변수는 함수 내에서 값을 변화시키고 전달할때 사용하는 것
    private func delete(_  node: inout Node?, _ key: Int) -> Node? {
        guard let nd = node else { return nil }
        
        // nd는 기존의 node를 의미함
        if key < nd.key {
            nd.left = delete(&nd.left, key)
        } else if key > nd.key {
            nd.right = delete(&nd.right, key)
        } else {
            // This is the node we want to delete.
            
            // Case 1: No child
            if nd.left == nil && nd.right == nil {
                node = nil
            }
            
            // Case 2: One child
            else if nd.left == nil {
                node = nd.right
            }
            else if nd.right == nil {
                node = nd.left
            }
            
            // Case 3: Two Children
            else {
                // Find the minimum node on the right (could also find max on the left)
                let minRight = findMin(nd.right!) // nd.right의 key를 0으로 만들어줌
                
                // Duplicate it by copying its value here
                node!.key = minRight.key
                
                // Now go ahead and delete the node we just duplicated (same key)
                node!.right = delete(&node!.right, node!.key)
            }
        }
        return nil
    }
}

let test = SAMPLETEST()

test.insert(key: 5)
test.insert(key: 3)
test.insert(key: 2)
test.insert(key: 4)
test.insert(key: 7)
test.insert(key: 6)
test.insert(key: 8)

print(test.find(key: 9))

test.delete(key: 7)
