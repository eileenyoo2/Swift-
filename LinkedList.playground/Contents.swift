import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkList {
    private var head: Node?
        
    func addFront(_ data: Int) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }
    // O(1) > 원하는 데이터의 양이 적던 많던 간에 항상 일정한 속도를 보장받는다
    func getFirst() -> Int? {
        if head == nil {
            return nil
        }
        return head!.data
    }

    func addBack(_ data: Int) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head!
        while(node.next != nil) {
            node = node.next!
        }
        node.next = newNode
    }
    // O(n) > 처음부터 끝까지 돌아야해서 Linear 하다. 느리다
    func getLast() -> Int? {
        if head == nil {
            return nil
        }
        var node = head!
        while(node.next != nil) {
            node = node.next!
        }
        return node.data
    }

    func insert(position: Int, data: Int) {
        let newNode = Node(data) // 새롭게 만드는 데이터를 Node 형식으로 만들어줌
        var currentNode = head   // 기존 Node의 구성 (data, next) 을 currentNode 로 정의해준다.
        
        for _ in 0 ..< position - 1 {   // 반복문을 돌고 난 뒤, currentNode 의 Linked List 를 얻게된다.
            currentNode = currentNode?.next!
        }
        
        newNode.next = currentNode?.next    // 기존의 currentNode 가 바라보던 next 값을 newNode의 next가 바라볼 수 있도록 셋팅
        currentNode?.next = newNode         // newNode가 바라보던 next 값을 currentNode 의 next 도 동일하게 볼 수 있도록 한다
    }
    // O(1)
    func deleteFirst() {
        head = head?.next
    }
    // O(n)
    func deleteLast() {
        var nextNode = head             // 기존의 LinkedList
        var previousNode: Node?         // 새롭게 알고자 하는 Node
        while nextNode?.next != nil {   // 기존의 LinkedList 의 next 값이 nil이 아닐때까지 돌기
            previousNode = nextNode     // previousNode의 값은 계속해서 갱신되는 것
            nextNode = nextNode?.next
        }
        previousNode?.next = nil;       // nextNode의 값은 필요 없으므로 previousNode 의 next 값을 nil로 변경해준다.
    }
    
    func delete(at position: Int) {
        if position == 0 {
            self.deleteFirst()
            return
        }
        
        var nextNode = head
        var previousNode: Node?
        
        for _ in 0 ..< position {
            previousNode = nextNode     // updating previosNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nextNode?.next
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func clear() {
        head = nil
    }
    
    func printLinkedList() {
        if head == nil { return }
        
        var result = [Int]()
        var node = head
        result.append(node!.data)
        
        while node?.next != nil {
            result.append(node!.next!.data)
            node = node?.next
        }
        print(result)
    }
}

let linkedList = LinkList()
linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)
linkedList.printLinkedList()

linkedList.addFront(4)
linkedList.printLinkedList()

linkedList.addBack(5)
linkedList.printLinkedList()

linkedList.getFirst()   // O(1)
linkedList.getLast()    // O(n)

linkedList.insert(position: 2, data: 6)
linkedList.printLinkedList()

linkedList.deleteFirst()
linkedList.printLinkedList()

linkedList.deleteLast()
linkedList.printLinkedList()

linkedList.delete(at: 1)
linkedList.printLinkedList()

linkedList.isEmpty
linkedList.clear()
linkedList.printLinkedList()

linkedList.addFront(1)
linkedList.printLinkedList()
