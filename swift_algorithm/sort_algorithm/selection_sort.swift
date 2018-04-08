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
 类似插入排序, 区别在于新元素放到已排序部分的方式不同.
 插入排序: 每次从未排序部分中取出一个元素, 插入 在已排序部分的正确位置. 所以第一个元素不需要处理.
 选择排序: 每次从未排序部分中取出一个元素, 先 选择 出其中最小的, 排在已排序的部分(直接将该最小值与未排序部分的首元素互换即可)即可.
          因为每次选择出来的都是最小的, 所以直接放到对应的位置就是正确的. 所以最后一个元素不需要处理.
 而插入排序的inner loop
 [ ...sorted numbers... | ...unsorted numbers... ]
 选择排序需要遍历两遍, 时间复杂度为O(n^2)
 */

 /*
 [| 8, 3, 5, 4, 6 ]
 [3 | 8, 5, 4, 6]
 [3 4 | 5, 8, 6]
 [3, 4, 5 | 6, 8]
 [3, 4, 5, 6 | 8]
 */
func selection_sort<T: Comparable>(array: [T]) -> [T] {
    guard array.count > 1 else { return array }

    var result = array
    // outer loop只需要从0到倒数第二个元素即可(最后一个元素不用排了)
    for i in 0 ..< result.count - 1 {
        // 寻找[i,n]区间内的最小值
        var lowest = i
        // inner loop遍历lowest之后的所有元素, 得到最小元素的index
        for j in i+1 ..< result.count {
            if result[j] < result[lowest] {
                lowest = j
            }
        }
        // 寻找[i,n]区间内的最小值

        if i != lowest {
            swap_T(array: &result, i: i, j: lowest)
            print(result)
        }
    }

    return result;
}


//////////////////////////////////////////////////

print(desc)


var numbers = [Int]()
var results = [Int]()

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
results = selection_sort(array: numbers)
print(results)

print("")

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
results = selection_sort(array: numbers)
print(results)
