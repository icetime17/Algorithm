#!/usr/bin/swift


let desc = ">>>>>>>>>> 无序数组只能是linear search, 遍历操作, 时间复杂度最好O(1), 最差O(n). \n 而有序数组可采用binary search, 时间复杂度: O(log n)."


/**
 Linear Search
 时间复杂度:最好O(1), 最差O(n).
 */


/**
 Binary Search
 数组必须先排好序.
 时间复杂度: O(log n)
 每次操作过滤掉当前剩余元素的一半, 如log_2(1,000,000) = 19.9
 */
 // 迭代
func binary_search_iterative<T: Comparable>(array: [T], element: T) -> Int? {
    var beginIndex = 0
    var endIndex = array.count
    while beginIndex < endIndex {
        let middleIndex = (beginIndex + endIndex) / 2
        if array[middleIndex] == element {
            return middleIndex
        } else if array[middleIndex] < element {
            beginIndex = middleIndex + 1
        } else if array[middleIndex] > element {
            endIndex = middleIndex
        }
    }
    return nil
}

// 递归, 什么情况下不能使用递归?
func binary_search_recursive<T: Comparable>(array: [T], element: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
    }

    let middleIndex = (range.lowerBound + range.upperBound) / 2
    if array[middleIndex] < element {
        return binary_search_recursive(array: array, element: element, range: middleIndex + 1 ..< range.upperBound)
    } else if array [middleIndex] > element {
        return binary_search_recursive(array: array, element: element, range: range.lowerBound ..< middleIndex)
    } else {
        return middleIndex
    }
}


//////////////////////////////////////////////////

print(desc)


let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
let index_iterative = binary_search_iterative(array: numbers, element: 43)   // gives 13
print(index_iterative as Any)

let index_recursive = binary_search_recursive(array: numbers, element: 43, range: 0 ..< numbers.count)  // gives 13
print(index_recursive as Any)
