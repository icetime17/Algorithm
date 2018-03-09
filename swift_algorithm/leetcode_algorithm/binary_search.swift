#!/usr/bin/swift

/**
一个有序数组可能在某个位置被旋转。给定一个目标值，查找并返回这个元素在数组中的位置，如果不存在，返回-1。假设数组中没有重复值。
举个例子：[0, 1, 2, 4, 5, 6, 7]在4这个数字位置上被旋转后变为[4, 5, 6, 7, 0, 1, 2]。搜索4返回0。搜索8则返回-1。

作者：故胤道长
链接：https://www.jianshu.com/p/b4036e6d3f13
來源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
*/

// 二分查找法的时间复杂度为O(logn), 只能用于有序数组中
func binarySearch<T: Comparable>(_ array: [T], target: T) -> Int {
    var begin = 0
    var end = array.count - 1
    while begin < end {
        let middle = (begin + end) / 2
        if array[middle] == target {
            return middle
        } else if array[middle] < target {
            begin = middle + 1
        } else {
            end = middle - 1
        }
    }

    if array[begin] == target {
        return begin
    } else {
        return -1
    }
}

// 使用递归
func binarySearch_recursion<T: Comparable>(_ array: [T], target: T) -> Int {
    return binarySearch_recursion(array, target: target, left: 0, right: array.count - 1)
}

func binarySearch_recursion<T: Comparable>(_ array: [T], target: T, left: Int, right: Int) -> Int {
    guard left <= right else {
        return -1
    }

    let middle = (left + right) / 2
    if array[middle] == target {
        return middle
    } else if array[middle] < target {
        return binarySearch_recursion(array, target: target, left: middle + 1, right: right)
    } else {
        return binarySearch_recursion(array, target: target, left: left, right: middle - 1)
    }
}


var numbers = [Int]()

numbers = [0,1,2,3,4,5,6,7,8,9]

print(binarySearch(numbers, target: -1))
print(binarySearch(numbers, target: 15))

for idx in 0..<10 {
    print(binarySearch(numbers, target: idx))
}

print("")

print(binarySearch_recursion(numbers, target: -1))
print(binarySearch_recursion(numbers, target: 15))

for idx in 0..<10 {
    print(binarySearch_recursion(numbers, target: idx))
}
