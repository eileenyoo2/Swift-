import UIKit

struct Stack<Element> { // Generic Function, <Element> <- 파라미터 형식이나 리턴형으로 사용됨
    private var storage : [Element] = []    // storage 라는 배열이 초기화되어 생성
    
    init() {}
    
    mutating func push(_ element: Element){ // struct에서(값 형식에서) 속성을 바꾸는 메소드를 구현할 경우앤 mutating 키워드가 꼭 필요하다.
        storage.append(element)
    }
    
    mutating func pop() -> Element? {   // pop()의 리턴 형식은 Element? 이다
        return storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n--------"
        
        let stackElements = storage.map {"\($0)"}.reversed().joined(separator: "\n")
        // {"\($0)"} <- 원소 각각을 맵핑해주는 것을 의미하고 .reversed() <- 말 그대로 맵핑된 원소들을 역순으로 출력할 수 있게 도와주는 것 .joined(separator:"") <- 배열의 출력 결과를 String 형식으로 전환
        return topDivider + stackElements + bottomDivider
    }
}

var stack = Stack<Int>()
stack.push(20)
stack.push(10)
stack.push(3)

print("before popping")
print(stack)

print("after popping")
stack.pop()
print(stack)
