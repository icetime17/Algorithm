//
//  main.swift
//  SortAlgorithm-Swift
//
//  Created by Chris Hu on 16/12/1.
//  Copyright © 2016年 icetime17. All rights reserved.
//

import Foundation


func swapT<T>(arr: inout [T], i: Int, j: Int) {
    let tmp = arr[i]
    arr[i] = arr[j]
    arr[j] = tmp
}


func bubbleSort(numbers: inout [Int]) {
    for i in 0..<numbers.count-1 {
        for j in 0..<numbers.count-1-i {
            if numbers[j] > numbers[j+1] {
//                swap(&numbers[j], &numbers[j+1])
                swapT(arr: &numbers, i: j, j: j+1)
            }
        }
    }
}


func swapA<A>(arr: inout [A], i: Int, j: Int) {
    let tmp = arr[i]
    arr[i] = arr[j]
    arr[j] = tmp
}

func bubble(numbers: inout [Int]) {
    for i in 0..<numbers.count - 1 {
        for j in 0..<numbers.count - 1 - i {
            if numbers[j] > numbers[j+1] {
                swapA(arr: &numbers, i: j, j: j + 1)
            }
        }
    }
}

var numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
bubbleSort(numbers: &numbers)
print(numbers)


print("")


func quickSort1(_ list: [Int]) -> [Int] {
    if list.count <= 1 { return list }
    
    var low = [Int]()
    var equal = [Int]()
    var high = [Int]()
    
    let base = list[list.count / 2]
    
    for i in list {
        if i < base {
            low.append(i)
        }
        if (i == base) {
            equal.append(i)
        }
        if (i > base) {
            high.append(i)
        }
    }
    return quickSort1(low) + quickSort1(equal) + quickSort1(high)
}

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
print(quickSort1(numbers))


print("")







// 给一个整型数组和一个目标值，判断数组中是否有两个数字之和等于目标值
func twoSum(nums: [Int], target: Int) -> Bool {
    var set = Set<Int>()
    
    for num in nums {
        if set.contains(target - num) {
            return true
        }
        set.insert(num)
    }

    return false
}

print(twoSum(nums: [1,2,3], target: 6))


func partition(arr: inout [Int], low: Int, high: Int) -> Int {
    let base = arr[low]
    var low = low
    var high = high
    
    while low < high {
        while low < high && arr[high] >= base {
            high = high - 1
        }
        swapA(arr: &arr, i: low, j: high)
        
        while low < high && arr[low] <= base {
            low = low + 1
        }
        swapA(arr: &arr, i: low, j: high)
    }
    
    return low
}

func quickSort(arr: inout [Int], low: Int, high: Int) {
    if low < high {
        let d = partition(arr: &arr, low: low, high: high)
        quickSort(arr: &arr, low: low, high: d - 1)
        quickSort(arr: &arr, low: d + 1, high: high)
    }
}

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
quickSort(arr: &numbers, low: 0, high: numbers.count - 1)
print(numbers)



// 左侧奇数，右侧偶数
func partition2(arr: inout [Int], low: Int, high: Int) -> Int {
    var low = low
    var high = high
    
    while low < high {
        if low < high && arr[high] % 2 == 0 {
            high = high - 1
        }
        swapA(arr: &arr, i: low, j: high)
        
        if low < high && arr[low] % 2 == 1 {
            low = low + 1
        }
        swapA(arr: &arr, i: low, j: high)
    }
    
    return low
}


func quickSort2(arr: inout [Int], low: Int, high: Int) {
    if low < high {
        let d = partition2(arr: &arr, low: low, high: high)
        quickSort2(arr: &arr, low: low, high: d - 1)
        quickSort2(arr: &arr, low: d + 1, high: high)
    }
}

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
quickSort2(arr: &numbers, low: 0, high: numbers.count - 1)
print(numbers)



// 左侧male，右侧female
func partition3(arr: inout [String], low: Int, high: Int) -> Int {
    var low = low
    var high = high
    
    while low < high {
        if low < high && arr[high] == "female" {
            high = high - 1
        }
        swapA(arr: &arr, i: low, j: high)
        
        if low < high && arr[low] == "male" {
            low = low + 1
        }
        swapA(arr: &arr, i: low, j: high)
    }
    
    return low
}

func quickSort3(arr: inout [String], low: Int, high: Int) {
    if low < high {
        let d = partition3(arr: &arr, low: low, high: high)
        quickSort3(arr: &arr, low: low, high: d - 1)
        quickSort3(arr: &arr, low: d + 1, high: high)
    }
}

var persons = ["male","female","male","female","male","male","female","female","female","male"]
print(persons)
quickSort3(arr: &persons, low: 0, high: persons.count - 1)
print(persons)

















