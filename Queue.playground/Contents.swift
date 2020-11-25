import UIKit

struct Queue<T> {
    
    var array: [T] = []
    init(){}
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
    
    mutating func enqueue(_ element: T) -> Bool {    // 반환형은 True/False, mutating을 사용해줘야 하는 이유는 구조체에서 생성한 array 배열을 수정해줘야하기 때문이다.
        array.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()  // if it is not empty, return nil
    }
}

extension Queue: CustomStringConvertible{
    var description: String {
        return String(describing: array)
    }
}

var queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(2)
queue.enqueue(34)
queue.enqueue(55)

print(queue)

queue.dequeue()

print(queue)
