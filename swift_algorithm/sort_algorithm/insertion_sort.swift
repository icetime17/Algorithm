#!/usr/bin/swift


let desc = ">>>>>>>>>> 插入排序: 每次从数组中取出一个元素, 放到(插入)结果数组中的正确位置即可. 类似扑克牌的理牌过程."


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
    guard array.count > 1 else { return array }

    var result = array

    // outer loop只需要从1到最后一个元素, 因第一个不需要考虑(inner的while会对其进行比较)
    for i in 1 ..< result.count {
        // 取出一个元素result[i], 将result[i]放到它的正确位置, (而该元素的原始位置是在要比较的数组的最右侧)
        var j = i
        // inner loop比较 j 与其左侧的元素, 找出最小的, 将其swap至最左侧
        // while j > 0 说明最后一次比较的是result[1]与result[0]
        // result[j] < result[j - 1] 说明插入排序可能提前结束, 因此比选择排序效率高一些
        while j > 0 && result[j] < result[j - 1] {
            swap_T(array: &result, i: j, j: j - 1)
            print(result)
            j = j - 1
        }
        // 取出一个元素result[i], 将result[i]放到它的正确位置
    }

    return result
}

// 优化: 对内层循环进行改进, 将result[i]暂存到target中,
// 每次将target与左侧元素进行比较, 若比左侧元素小, 则target应放在左侧元素的左侧
// 采用赋值的方式, 避免了swap的多余操作, 最终找到正确的位置j之后, target放入即可
func insertion_sort_1<T: Comparable>(array: [T]) -> [T] {
    guard array.count > 1 else { return array }

    var result = array

    // outer loop只需要从1到最后一个元素, 因第一个不需要考虑(inner的while会对其进行比较)
    for i in 1 ..< result.count {

        // 取出一个元素result[i], 将result[i]放到它的正确位置, (而该元素的原始位置是在要比较的数组的最右侧)
        let target = result[i]
        var j = i
        while j > 0 && target < result[j - 1] {
            result[j] = result[j - 1]
            print(result)
            j = j - 1
        }
        result[j] = target
        print(result)
    }

    return result
}

//////////////////////////////////////////////////

print(desc)


var numbers = [Int]()
var results = [Int]()

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
results = insertion_sort(array: numbers)
print(results)

print("")

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
results = insertion_sort_1(array: numbers)
print(results)
