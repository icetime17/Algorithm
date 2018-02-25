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
    func p_beginIndex(array: [T], element: T) -> Int {
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

    func p_endIndex(array: [T], element: T) -> Int {
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

    let beginIndex = p_beginIndex(array: array, element: element)
    let endIndex = p_endIndex(array: array, element: element)

    return endIndex - beginIndex
}


//////////////////////////////////////////////////

print(desc)


var numbers = [Int]()

numbers = [ 0, 1, 1, 3, 3, 3, 3, 6, 8, 10, 11, 11 ]
print(count_of_element_in_array(array: numbers, element: 3))  // returns 4

print(count_of_element_in_ordered_array(array: numbers, element: 3)) // returns 4

numbers = [5, 7, 7, 8, 8, 10]
print(count_of_element_in_ordered_array(array: numbers, element: 8)) // returns 2

numbers = []
print(count_of_element_in_ordered_array(array: numbers, element: 8)) // returns 0

numbers = [1, 2]
print(count_of_element_in_ordered_array(array: numbers, element: 8)) // returns 0

numbers = [8]
print(count_of_element_in_ordered_array(array: numbers, element: 8)) // returns 1

numbers = [1]
print(count_of_element_in_ordered_array(array: numbers, element: 8)) // returns 0
