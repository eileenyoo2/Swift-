//
//  main.swift
//  BinarySearchTrees
//
//  Created by sapere4ude on 2020/11/27.
//

import Foundation

public class BinaryNode<Element> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}

extension BinaryNode: CustomStringConvertible {
    
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

extension BinaryNode {
    
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}


public struct BinarySearchTree<Element: Comparable> {
    public private(set) var root: BinaryNode<Element>?
    
    public init() {}
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        return root?.description ?? "empty tree"
    }
}

extension BinarySearchTree {
    /** 해당 함수는 사용자 인터페이스로 공개되는 함수이고, 내부적으로는 다른 함수의 재귀적인 실행에 의해서 값이 추가 됩니다. */
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
        
    }
    private mutating func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        // root에 값이 없는 경우에 값을 추가한 경우에는 root의 값을 추가한다.
        // 혹은 아래의 if, else 구문에서 left,right 자식 노드에 추가될때 호출됨.
        guard let node = node else { return BinaryNode<Element>(value: value)}
        
        // 추가한 값이, 해당 node의 값보다 작으면 해당 노드의 왼쪽 자식 노드에
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
}

// 2
  var bst = BinarySearchTree<Int>()
  for i in 0..<5 {
    bst.insert(i)
  }
print(bst)
