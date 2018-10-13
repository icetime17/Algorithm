#!/usr/bin/swift


let desc = ">>>>>>>>>> merge sort: \n 1, split: 每次从数组中取出midIndex, 分别对左右的子数组递归调用merge sort. \n 2, merge: 对左右子数组分别遍历取元素进行比较, 存入ordered结果数组中."
// 稳定排序


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


/**
 split first and merge after
 递归执行: 每次得到的left和right均为排好序的.
 时间复杂度均为O(nlgn).
 空间复杂度: 需要额外的数组, 不是in-place sort.
 稳定算法.
 */
func merge_sort<T: Comparable>(array: [T]) -> [T] {
    guard array.count > 1 else { return array }

    func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0

        var ordered = [T]()

        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]

            if leftElement < rightElement {
                ordered.append(leftElement)
                leftIndex = leftIndex + 1
            } else if leftElement > rightElement {
                ordered.append(rightElement)
                rightIndex = rightIndex + 1
            } else {
                ordered.append(leftElement)
                leftIndex = leftIndex + 1
                ordered.append(rightElement)
                rightIndex = rightIndex + 1
            }
        }

        while leftIndex < left.count {
            ordered.append(left[leftIndex])
            leftIndex = leftIndex + 1
        }

        while rightIndex < right.count {
            ordered.append(right[rightIndex])
            rightIndex = rightIndex + 1
        }

        return ordered
    }

    // 先做split
    let midIndex = array.count / 2
    let left = merge_sort(array: Array(array[0 ..< midIndex]))
    let right = merge_sort(array: Array(array[midIndex ..< array.count]))

    // 再做merge, 每次递归传递的left和right分别都是已经排好序的
    return merge(left: left, right: right)
}


//////////////////////////////////////////////////

print(desc)


var numbers = [Int]()

numbers = [1,3,10,6,4,5,9,2,8,7]
// numbers = [7,2,6,3,9]
print(numbers)
let results = merge_sort(array: numbers)
print(results)
