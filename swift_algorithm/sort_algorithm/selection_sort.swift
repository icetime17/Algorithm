#!/usr/bin/swift


let desc = ">>>>>>>>>> 插入排序: 每次从数组中取出一个元素, 放到(选择)结果数组中的正确位置即可."

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
 每次遍历剩下未排序的元素, 选择最小的, 排在已排序部分.
 类似插入排序
 每次从未排序的部分中, 选择最小的, 排在已排序的部分.
 [ ...sorted numbers... | ...unsorted numbers... ]
 选择排序需要遍历两遍, 时间复杂度为O(n^2)
 */
func selection_sort<T: Comparable>(array: [T]) -> [T] {
    guard array.count > 0 else { return array }

    var result = array
    // outer loop只需要从0到倒数第二个元素即可(最后一个元素不用排了)
    for i in 0 ..< result.count - 1 {
        var lowest = i
        // inner loop遍历lowest之后的所有元素, 得到最小元素的index
        for j in i+1 ..< result.count {
            if result[j] < result[lowest] {
                lowest = j
            }
        }

        if i != lowest {
            swap_T(array: &result, i: i, j: lowest)
        }
    }

    return result;
}


//////////////////////////////////////////////////

print(desc)


var numbers = [Int]()

numbers = [ 5, 8, 3, 4, 6 ]
print(numbers)
let results_1 = selection_sort(array: numbers)
print(results_1)

print("")

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
let results_2 = selection_sort(array: numbers)
print(results_2)
