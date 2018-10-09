#!/usr/bin/swift


/*
quick sort

每次选取一个pivot，对数组进行遍历，小于pivot的元素放左边，大于pivot的元素放右边。
然后分别对左边的新数组和右边的新数组进行递归即可。

不稳定算法：
排序之后，相等元素的位置可能会变化。
(而merge sort是稳定算法)

时间复杂度：
最小为O(N*lg(N+1))，最大为O(N*N)。平均为O(nlgn)
遍历一次的时间复杂度是O(N)，所以关键是看遍历几次（即递归的深度）。
因为快速排序采用分治法进行遍历，所以类似二叉树，需遍历的次数就是二叉树的深度。
二叉树的深度最小为lg(N+1)，最大为N。

空间复杂度：
lg(N)
采用分治法, 则不需要额外的数组, 是in-place sort.
不采用分治法(quick_sort_1), 则需要额外的数组.

partition:
分治法的关键在于每次得出一个pivot的时候, 该pivot一定位于数组中的正确位置.

关键点:
影响效率的点在于pivot的选取. 从low/high两端都可以(算法实现不同导致效率不同).

参考:
https://github.com/raywenderlich/swift-algorithm-club/raw/master/Quicksort/Images/Example.png
*/


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


func quick_sort_1(array: [Int]) -> [Int] {
    if array.count <= 1 {
        return array
    }

    print(array)

    var low = [Int]()
    var equal = [Int]()
    var high = [Int]()

    let pivot = array[array.count / 2]
    print("pivot index : \(array.count / 2)")
    print("pivot value : \(pivot)")

    for i in array {
        if i < pivot {
            low.append(i)
        } else if i == pivot {
            equal.append(i)
        } else if i > pivot {
            high.append(i)
        }
    }

    return quick_sort_1(array: low) + equal + quick_sort_1(array: high)
}


// using partition
func quick_sort_2(array: inout [Int], low: Int, high: Int) {
    if low >= high {
        return
    }

    func partition(array: inout [Int], low: Int, high: Int) -> Int {
        let pivot = array[low]
        print("pivot index : \(low)")
        print("pivot : \(pivot)")

        var i = low
        var j = high

        while i < j {
            print("begin while i: \(i), j: \(j)")

            while i < j && array[j] >= pivot {
                j = j - 1
            }
            print("i: \(i), j: \(j)")
            print(array)
            swap_T(array: &array, i: i, j: j)
            print(array)

            while i < j && array[i] <= pivot {
                i = i + 1
            }
            print("i: \(i), j: \(j)")
            print(array)
            swap_T(array: &array, i: i, j: j)
            print(array)

            print("after while i: \(i), j: \(j)")
        }

        return i
    }

    let pivot = partition(array: &array, low: low, high: high)
    quick_sort_2(array: &array, low: low, high: pivot - 1)
    quick_sort_2(array: &array, low: pivot + 1, high: high)
}


// using partition，左侧奇数右侧偶数
func quick_sort_3(array: inout [Int], low: Int, high: Int) {
    if low >= high {
        return
    }

    func partition(array: inout [Int], low: Int, high: Int) -> Int {
        var i = low
        var j = high

        while i < j {
            if i < j && array[j] % 2 == 0 {
                j = j - 1
            }
            swap_T(array: &array, i: i, j: j)
            print(array)

            if i < j && array[i] % 2 == 1 {
                i = i + 1
            }
            swap_T(array: &array, i: i, j: j)
            print(array)
        }

        return i
    }

    let pivot = partition(array: &array, low: low, high: high)
    quick_sort_3(array: &array, low: low, high: pivot - 1)
    quick_sort_3(array: &array, low: pivot + 1, high: high)
}


// using partition，左侧male右侧female
func quick_sort_4(array: inout [String], low: Int, high: Int) {
    if low >= high {
        return
    }

    func partition(array: inout [String], low: Int, high: Int) -> Int {
        var i = low
        var j = high

        while i < j {
            if i < j && array[j] == "female" {
                j = j - 1
            }
            swap_T(array: &array, i: i, j: j)
            print(array)

            if i < j && array[i] == "male" {
                i = i + 1
            }
            swap_T(array: &array, i: i, j: j)
            print(array)
        }

        return i
    }

    let pivot = partition(array: &array, low: low, high: high)
    quick_sort_4(array: &array, low: low, high: pivot - 1)
    quick_sort_4(array: &array, low: pivot + 1, high: high)
}


// more swifter
func quick_sort_T<T: Comparable>(_ array: [T]) -> [T] {
    if array.count <= 1 {
        return array
    }

    print(array)

    let pivot = array[array.count / 2]
    print("pivot index : \(array.count / 2)")
    print("pivot value : \(pivot)")

    let low = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let high = array.filter { $0 > pivot }

    return quick_sort_T(low) + equal + quick_sort_T(high)
}


// Lomuto's partitioning scheme
// 使用最后一个元素作为pivot
// [ values <= pivot | values > pivot | not looked at yet | pivot ]
//   low           i   i+1        j-1   j          high-1   high
func quick_sort_Lomuto(array: inout [Int], low: Int, high: Int) {
    if low >= high {
        return
    }

    func partition_Lomuto<T: Comparable>(array: inout [T], low: Int, high: Int) -> Int {
        let pivot = array[high]
        print("pivot index : \(high)")
        print("pivot : \(pivot)")

        var i = low
        for j in low ..< high {
            if array[j] <= pivot {
                print("i: \(i), j: \(j)")
                print(array)
                (array[i], array[j]) = (array[j], array[i])
                print(array)
                i = i + 1
            }
        }

        print("i: \(i), high: \(high)")
        print(array)
        (array[i], array[high]) = (array[high], array[i])
        print(array)

        return i
    }

    let pivot = partition_Lomuto(array: &array, low: low, high: high)
    quick_sort_Lomuto(array: &array, low: low, high: pivot - 1)
    quick_sort_Lomuto(array: &array, low: pivot + 1, high: high)
}


// Hoare's partitioning scheme
// 使用第一个元素作为pivot
// [low...p] [p] [p+1...high]
func quick_sort_Hoare(array: inout [Int], low: Int, high: Int) {
    if low >= high {
        return
    }

    func partition_Hoare<T: Comparable>(array: inout [T], low: Int, high: Int) -> Int {
        let pivot = array[low]
        print("pivot index : \(low)")
        print("pivot : \(pivot)")

        var i = low
        var j = high

        while true {
            while array[j] > pivot {
                j = j - 1
            }
            while array[i] < pivot {
                i = i + 1
            }

            if i < j {
                print("i: \(i), j: \(j)")
                print(array)
                swap_T(array: &array, i: i, j: j)
                print(array)
            } else {
                return i
            }
        }
    }

    let pivot = partition_Hoare(array: &array, low: low, high: high)
    quick_sort_Hoare(array: &array, low: low, high: pivot - 1)
    quick_sort_Hoare(array: &array, low: pivot + 1, high: high)
}


//////////////////////////////////////////////////


var numbers = [Int]()

print(">>>>>>>>>> quick_sort_1")
numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
let results_1 = quick_sort_1(array: numbers)
print(results_1)

print("")

print(">>>>>>>>>> quick_sort_2, 从小到大")
numbers = [1,3,10,6,4,5,9,2,8,7]
numbers = [3,4,1,2,5]
print(numbers)
quick_sort_2(array: &numbers, low: 0, high: numbers.count - 1)
print(numbers)

print("")

print(">>>>>>>>>> quick_sort_3，左侧奇数右侧偶数")
numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
quick_sort_3(array: &numbers, low: 0, high: numbers.count - 1)
print(numbers)

print("")

print(">>>>>>>>>> quick_sort_4，左侧male右侧female")
var persons = [String]()
persons = ["male","female","male","female","male","male","female","female","female","male"]
print(persons)
quick_sort_4(array: &persons, low: 0, high: persons.count - 1)
print(persons)

print("")

print(">>>>>>>>>> quick_sort_T")
numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
let results_T = quick_sort_T(numbers)
print(results_T)

print("")

print(">>>>>>>>>> quick_sort_2 again, 从小到大")
numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
quick_sort_2(array: &numbers, low: 0, high: numbers.count - 1)
print(numbers)

print("")

print(">>>>>>>>>> Lomuto's partitioning scheme")
numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
quick_sort_Lomuto(array: &numbers, low: 0, high: numbers.count - 1)
print(numbers)

print("")

print(">>>>>>>>>> Hoare's partitioning scheme")
numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
quick_sort_Hoare(array: &numbers, low: 0, high: numbers.count - 1)
print(numbers)
