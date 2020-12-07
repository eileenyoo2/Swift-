//
//  main.swift
//  Heap
//
//  Created by sapere4ude on 2020/12/07.
//

import Foundation

/* 참고 : https://github.com/applebuddy/SwiftDocStudy/blob/9a3cb48cda698bca3b27e871a5cdc6864d095750/SwiftDocStudy.playground/Pages/HeapExample.xcplaygroundpage/Contents.swift
*/

public struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T, T) -> Bool

    var isEmpty: Bool {
        return nodes.isEmpty
    }

    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }

    func peek() -> T? {
        return nodes.first
    }

    mutating func insert(_ element: T) {
        var index = nodes.count

        nodes.append(element)

        while index > 0, !comparer(nodes[index], nodes[(index - 1) / 2]) {
            nodes.swapAt(index, (index - 1) / 2)
            index = (index - 1) / 2
        }
    }

    mutating func delete() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }

        if nodes.count == 1 {
            return nodes.removeFirst()
        }

        let result = nodes.first
        nodes.swapAt(0, nodes.count - 1)
        _ = nodes.popLast()

        var index = 0

        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1

            if right < nodes.count {
                if comparer(nodes[left], nodes[right]),
                    !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else {
                break
            }
        }

        return result
    }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: <)
    }
}

var heap = Heap<Double>(comparer: <)
heap.insert(1.28)
print(heap.peek())
//heap.insert(1.12)
//print(heap.peek())
//heap.insert(1.1)
//print(heap.peek())
//heap.delete()
//print(heap.peek())
//heap.delete()
//print(heap.peek())
