#!/usr/bin/swift


let desc = ">>>>>>>>>> 无序数组只能是遍历, O(n)操作. \n 而有序数组可采用binary search来分别查找right和left的边界, 相减即可."

// linear search
func count_of_element_in_array<T: Comparable>(array: [T], element: T) -> Int {
    var count = 0

    for ele in array {
        if ele == element {
            count = count + 1
        }
    }

    return count
}


// binary search
func count_of_element_in_ordered_array<T: Comparable>(array: [T], element: T) -> Int {
    func beginIndex(array: [T], element: T) -> Int {
        var beginIndex = 0
        var endIndex = array.count
        while beginIndex < endIndex {
            let middleIndex = (beginIndex + endIndex) / 2
            if array[middleIndex] < element {
                beginIndex = middleIndex + 1
            } else {
                endIndex = middleIndex
            }
        }
        return beginIndex
    }

    func endIndex(array: [T], element: T) -> Int {
        var beginIndex = 0
        var endIndex = array.count
        while beginIndex < endIndex {
            let middleIndex = (beginIndex + endIndex) / 2
            if array[middleIndex] > element {
                endIndex = middleIndex
            } else {
                beginIndex = middleIndex + 1
            }
        }
        return beginIndex
    }

    return endIndex(array: array, element: element) - beginIndex(array: array, element: element)
}


//////////////////////////////////////////////////

print(desc)


let numbers = [ 0, 1, 1, 3, 3, 3, 3, 6, 8, 10, 11, 11 ]

print(count_of_element_in_array(array: numbers, element: 3))  // returns 4

print(count_of_element_in_ordered_array(array: numbers, element: 3)) // returns 4
