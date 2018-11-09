#!/usr/bin/swift

let desc = """
>>>>>>>>>> bubble sort
时间复杂度 O(n^2)
  Best O(n); Average O(n^2); Worst O(n^2).
空间复杂度 O(1)
稳定排序
"""

func swap_T<T>(array: inout [T], i: Int, j: Int) {
    if i < 0 || j < 0 {
        return
    }

    if array.count <= i ||
       array.count <= j {
        return
    }

    let tmp = array[i]
    array[i] = array[j]
    array[j] = tmp
}


func bubbleSort_1(_ array: [Int]) -> [Int] {
    if array.count <= 1 {
        return array
    }

    var results = array
    for i in 0 ..< results.count - 1 {
        for j in 0 ..< results.count - 1 - i {
            if results[j] > results[j+1] {
                swap_T(array: &results, i: j, j: j+1)

                print(results)
            }
        }
    }
    return results
}


// use inout
func bubbleSort_2(_ array: inout [Int]) {
    if array.count <= 1 {
        return
    }

    for i in 0 ..< array.count {
        for j in 0 ..< array.count - 1 - i {
            if array[j] > array[j+1] {
                swap_T(array: &array, i: j, j: j+1)

                print(array)
            }
        }
    }
}


// 优化：没有数据交换时，即已完成排序。
func bubbleSort_3(_ array: inout [Int]) {
    if array.count <= 1 {
        return
    }

    for i in 0..<array.count-1 {
        // 没有数据交换时，即已完成排序。break即可。
        var isSwapped = false

        for j in 0..<array.count-1-i {
          if array[j] > array[j+1] {
              (array[j], array[j+1]) = (array[j+1], array[j])

              isSwapped = true
          }
          print(array)
        }
        if !isSwapped {
            break
        }
    }
}


//////////////////////////////////////////////////

print(desc)


var numbers = [Int]()

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
let results_1 = bubbleSort_1(numbers)
print(results_1)

print("")

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
bubbleSort_2(&numbers)
print(numbers)

print("")

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
bubbleSort_3(&numbers)
print(numbers)

print("")

numbers = [1,2,3,4,5,6,7,8,9,10]
print(numbers)
bubbleSort_3(&numbers)
print(numbers)
