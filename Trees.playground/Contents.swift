// Trees

import Foundation

public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    public init(_ value: T) {   // init에 파라미터를 넣어 초기화해주는 방법. 넘겨주는 T에 따라 value 프로퍼티에 담기는 값이 달라진다.
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

let beverages = TreeNode("Beverages")
let hot = TreeNode("Hot")
let cold = TreeNode("Cold")

beverages.add(hot)
beverages.add(cold)


// MARK: DFS(깊이우선탐색). recursion process(재귀과정)를 사용
extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self) // self <- TreeNode<T>
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
}

func makeBeverageTree() -> TreeNode<String> {
    let tree = TreeNode("Beverages")
    
    let hot = TreeNode("hot")
    let cold = TreeNode("cold")
    
    let tea = TreeNode("tea")
    let coffee = TreeNode("coffee")
    let chocolate = TreeNode("chocolate")
    
    let blackTea = TreeNode("blackTea")
    let greenTea = TreeNode("greenTea")
    let chaiTea = TreeNode("chaiTea")
    
    let soda = TreeNode("soda")
    let milk = TreeNode("milk")
    
    let gingerAle = TreeNode("gingerAle")
    let bitterLemon = TreeNode("bitterLemon")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    
    cold.add(soda)
    cold.add(milk)
    
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    
    soda.add(gingerAle)
    soda.add(bitterLemon)
    
    return tree
}

// result
let tree = makeBeverageTree()
tree.forEachDepthFirst { print($0.value) }

// MARK: BFS(너비우선탐색)
public protocol Queue {
    associatedtype Element  // associatedtype : 프로토콜을 정의할 때 제네릭 타입 처럼 일반화 시킨 타입을 지정할 때 사용함.
    mutating func enqueue(_ element: Element) -> Bool   // 큐 끝에 새로운 큐를 추가
    mutating func dequeue() -> Element? // 가장 먼저 들어온 앞의 큐를 제거. 제거한 큐를 반환함.
    var isEmpty: Bool { get }   // 큐가 비어있는 것을 알려주는 읽기 전용 프로퍼티 (get: 읽기전용)
    var peek: Element? { get }  // 가정 먼저 들어온 큐를 알려주는 역할
}

public struct QueueArray<T>: Queue {
    private var array: [T] = []
    public init() { }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var peek: T? {
        return array.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}

extension TreeNode {
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self) // self <- TreeNode<T>
        var queue = QueueArray<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach {queue.enqueue($0)}
            }
        }
}

//result
print("BFS Test")
let BFS = makeBeverageTree()
BFS.forEachLevelOrder{ print($0.value)}
