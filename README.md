# Swift-Algorithm

1. 키보드 입력 받기 & 값 공백으로 구분하기

```
    // 방법 1
    let nums = readLine()!.split(separator: " ")
    print(nums)

    // 방법 2
    // components(separatedBy: " ")

    var str = "Hello jun!"

    var arr = str.components(separatedBy: " ")   // components 함수는 결과를 배열로 리턴해줌

    print(arr)  // ["Hello", "jun!"]
    print(str)  // Hello jun! <- str 값엔 변화 없는 것을 확인할 수 있다

    var str2 = "1+2-3*4/5"
    var arr2 = str2.components(separatedBy: ["+","-","*","/",]) // components 함수는 [String] 형을 리턴하기 때문에 배열의 원소는 Int 형이 아니다. 그래서 arr[0]+arr[1]의 결과값이 3이 나올 수 없다.

    print(arr2) // ["1", "2", "3", "4", "5"]
    print(str2) // 1+2-3*4/5

    var arr3 = str2.components(separatedBy: ["+","-","*","/",]).map{(value: String) -> Int
        in
        return Int(value)!
    }
    print(arr3[0]+arr3[1])  // 3

```
  
<br>

2. 배열 다루기

```
    var array = [Int](1...5) // [1, 2, 3, 4, 5]

    print(type(of: array)) // Array<Int>

    let matrix = [[Int]]()  
    let matrix_v2 = [[Int]](repeating: [], count: 3) // [[], [], []]

    print(type(of: matrix)) // Array<Array<Int>>

    array.reverse() // [5, 4, 3, 2, 1]

    array.sorted()  // default는 오름차순이다. 1,2,3 ...

    array.sorted(by: >) // 내림차순 
```

3. map

```
    // 축약형
    var string1 = ["1","2","3","4"]
    let c1 = string1.map{ Int($0)! }

    // 원본
    var string2 = ["1","2","3","4"]
    let c2 = string2.map({(string2: String) -> Int in
        return Int(string2)!
        })

    print(c1)   // [1, 2, 3, 4]
    print(c2)   // [1, 2, 3, 4]

```

4. filter
   
``` 
    // 축약형 
    var array1 = [1,2,3,4]
    let a1 = array1.filter{ $0 % 2 == 0}
    print(a1)

    // 원본
    var array2 = [1,2,3,4]
    let a2 = array2.filter({(array2: Int)-> Bool
        in
        return array2 % 2 == 0
    })
    print(a2)

```

5. reduce

```
    var array = [1,2,3,4]
    var array2 = [1,2,3,4]

    // 축약형
    let c = array.reduce(0,+)
    print(c)

    // 규칙 적용 과정
    array2.reduce(0,{(s1: Int, s2: Int) -> Int in
            return s1 + s2
    })

    array2.reduce(0){(s1: Int, s2: Int) -> Int in
        return s1 + s2
    }

    array.reduce(0){(s1, s2) in s1 + s2}

    array.reduce(0){ $0 + $1 }

    array.reduce(0, +) // 초기항목은 {0 + 1}이고 값이 1이라면 {1 + 1} 이다.
                    // 클로저는 이전 결과와 다음 항목을 계속 호출하여 다음과 같은 과정을 거쳐
                    // 하나의 값을 얻는다. {0+1},{1+2},{3+3},{6+4} 이며, 결과는 10
```

6. 문자열 쪼개기
   
```


```
