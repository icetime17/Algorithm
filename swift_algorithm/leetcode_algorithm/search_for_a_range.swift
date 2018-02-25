#!/usr/bin/swift
/**
Given an array of integers sorted in ascending order, find the starting and ending position of a given target value.

Your algorithm's runtime complexity must be in the order of O(log n).

If the target is not found in the array, return [-1, -1].

For example,
Given [5, 7, 7, 8, 8, 10] and target value 8,
return [3, 4].
*/

/**
利用二分查找法, Binary Search: 时间复杂度 O(lgn)
分别从左侧找到left boundary, 从右侧找到right boundary即可.
*/
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count == 0 {
        return [-1, -1]
    }

    if nums.count == 1 {
        if nums[0] == target {
            return [0, 0]
        } else {
            return [-1, -1]
        }
    }

    func p_beginIndex(_ nums: [Int], _ target: Int) -> Int {
        var beginIndex = 0
        var endIndex = nums.count

        while beginIndex < endIndex {
            let midIndex = (beginIndex + endIndex) / 2
            if nums[midIndex] < target {
                beginIndex = midIndex + 1
            } else {
                endIndex = midIndex
            }
        }

        if beginIndex < nums.count && nums[beginIndex] == target {
            return beginIndex
        } else {
            return -1
        }
    }

    func p_endIndex(_ nums: [Int], _ target: Int) -> Int {
        var beginIndex = 0
        var endIndex = nums.count

        while beginIndex < endIndex {
            let midIndex = (beginIndex + endIndex) / 2
            if nums[midIndex] > target {
                endIndex = midIndex
            } else {
                beginIndex = midIndex + 1
            }
        }

        if beginIndex - 1 < nums.count && nums[beginIndex - 1] == target {
            return beginIndex - 1
        } else {
            return -1
        }
    }

    let beginIndex = p_beginIndex(nums, target)
    if beginIndex == -1 {
        return [-1, -1]
    }
    let endIndex = p_endIndex(nums, target)
    print("beginIndex: \(beginIndex)")
    print("endIndex: \(endIndex)")

    return [beginIndex, endIndex]
}

var nums = [5, 7, 7, 8, 8, 10]
print(searchRange(nums, 8))
