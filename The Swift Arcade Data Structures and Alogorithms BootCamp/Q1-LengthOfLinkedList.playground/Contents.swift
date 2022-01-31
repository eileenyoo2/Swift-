import UIKit

/*
 Write a function that determines the length of any linked list.
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: Node?) -> Int {
    if head == nil {
        return 0
    }
    var len = 0
    var currnet = head      // 기존의 Linked List가 정의되어 있는 head는 건들지 않고 새로운 변수를 생성하여 이곳에서 값을 체크한다
    
    while currnet != nil {
        len += 1
        currnet = currnet?.next // current의 다음 값을 바라볼 수 있도록 셋팅해주는 것이 포인트
    }
    return len
}

// 1 2 3 4 5 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

length(nil) // 0
length(node1) // 6
