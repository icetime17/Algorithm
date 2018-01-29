#!/usr/bin/swift


let desc = ">>>>>>>>>> 一次遍历比较, 同时找出min和max, 时间复杂度均为O(n). \n 如何提升效率?"


func minElement<T: Comparable>(array: [T]) -> T? {
    if array.count == 0 {
        return nil
    }

    var min = array[0]
    for ele in array {
        min = ele < min ? ele : min;
    }
    return min
}

func maxElement<T: Comparable>(array: [T]) -> T? {
    if array.count == 0 {
        return nil
    }

    var max = array[0]
    for ele in array {
        max = ele > max ? ele : max;
    }
    return max
}

// O(n)
func min_max_elements<T: Comparable>(array: [T]) -> (min: T, max: T)? {
    if array.count == 0 {
        return nil
    }

    var min_max: (min: T, max: T) = (array[0], array[0])
    for ele in array {
        min_max.min = ele < min_max.min ? ele : min_max.min;
        min_max.max = ele > min_max.max ? ele : min_max.max;
    }

    return min_max
}

// optimized: 提升数组遍历的性能
func min_max_elements_optimized<T: Comparable>(array: [T]) -> (min: T, max: T)? {
    if array.count == 0 {
        return nil
    }

    var min_max: (min: T, max: T)!
    if array.count == 1 {
        min_max = (array[0], array[0])
    } else if array.count == 2 {
        min_max = array[0] <= array[1] ? (array[0], array[1]) : (array[1], array[0])
    } else {
        min_max = array[0] <= array[1] ? (array[0], array[1]) : (array[1], array[0])

        if (array.count - 2) % 2 == 0 {
            for idx in 2 ..< array.count where idx % 2 == 0 {
                let tmp: (min: T, max: T) = array[idx] <= array[idx + 1] ? (array[idx], array[idx + 1]) : (array[idx + 1], array[idx])
                min_max.min = tmp.min < min_max.min ? tmp.min : min_max.min;
                min_max.max = tmp.max > min_max.max ? tmp.max : min_max.max;
            }
        } else {
            for idx in 2 ..< array.count - 1 where idx % 2 == 0 {
                let tmp: (min: T, max: T) = array[idx] <= array[idx + 1] ? (array[idx], array[idx + 1]) : (array[idx + 1], array[idx])
                min_max.min = tmp.min < min_max.min ? tmp.min : min_max.min;
                min_max.max = tmp.max > min_max.max ? tmp.max : min_max.max;
            }
            if let last = array.last {
                min_max.min = last < min_max.min ? last : min_max.min;
                min_max.max = last > min_max.max ? last : min_max.max;
            }
        }
    }

    return min_max
}


//////////////////////////////////////////////////

print(desc)


var numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
print(numbers.min() as Any)
print(numbers.max() as Any)
print(minElement(array: numbers) as Any)
print(maxElement(array: numbers) as Any)

print(min_max_elements(array: numbers) as Any)
print(min_max_elements_optimized(array: numbers) as Any)

print("")

numbers = [1,3,10,6,4,5,9,2,8,7,15]
print(numbers)
print(numbers.min() as Any)
print(numbers.max() as Any)
print(minElement(array: numbers) as Any)
print(maxElement(array: numbers) as Any)

print(min_max_elements(array: numbers) as Any)
print(min_max_elements_optimized(array: numbers) as Any)
