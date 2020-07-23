# Swift-Algorithm

1. 키보드 입력 받기 & 값 공백으로 구분하기

***
```
    let nums = readLine()!.split(separator: " ")
    print(nums)
```
***
  
<br>
<br>

2. 배열 다루기

***
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
***
