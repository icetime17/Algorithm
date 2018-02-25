#!/usr/bin/swift


let desc = ">>>>>>>>>> 插入排序: 每次从数组中取出一个元素, 放到(插入)结果数组中的正确位置即可."


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
 i是分界线, 左侧为已排好序的元素, 右侧为未排序的元素. 所以i从1开始.

 [| 8, 3, 5, 4, 6 ]
 [ 8 | 3, 5, 4, 6 ]
 [ 3, 8 | 5, 4, 6 ]
 [ 3, 5, 8 | 4, 6 ]
 [ 3, 4, 5, 8 | 6 ]
 [ 3, 4, 5, 6, 8 |]

 空间复杂度: 需要额外的数组, 不是in-place sort.
 时间复杂度: 最坏为O(n^2),
 类似有两个loop的排序算法, 一般情况下的最坏都为O(n^2).
 */
func insertion_sort<T: Comparable>(array: [T]) -> [T] {
    var result = array

    // outer loop只需要从1到最后一个元素, 因第一个不需要考虑(inner的while会对其进行比较)
    for i in 1 ..< result.count {
        var j = i
        // inner loop比较 j 与其左侧的元素, 找出最小的, 将其swap至最左侧
        while j > 0 && result[j] < result[j - 1] {
            swap_T(array: &result, i: j, j: j - 1)
            j = j - 1
        }
    }
    return result
}


//////////////////////////////////////////////////

print(desc)


var numbers = [Int]()

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
let results = insertion_sort(array: numbers)
print(results)
