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


