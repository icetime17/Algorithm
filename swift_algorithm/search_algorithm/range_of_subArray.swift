#!/usr/bin/swift


// Given [5, 7, 7, 8, 8, 10] and target value 8,
// return [3, 4].

/**
 分别从左侧找到left boundary, 从右侧找到right boundary即可.
 Linear Search: 时间复杂度 O(n)
 Binary Search: 时间复杂度 O(lgn)

 空间复杂度: O(1)
*/


// class Solution {
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
        print("beginIndex: \(beginIndex)")
        if beginIndex == -1 {
            return [-1, -1]
        }
        let endIndex = p_endIndex(nums, target)
        print("endIndex: \(endIndex)")

        return [beginIndex, endIndex]

/*
        if beginIndex == endIndex {
            return [beginIndex, endIndex]
        } else {
            return [Int](beginIndex...endIndex)
            //return (beginIndex...endIndex).map { $0 }
        }
*/
    }
// }


// 依然是Binary Search
//class Solution {
    func searchRange_19ms(_ nums: [Int], _ target: Int) -> [Int] {
        if (nums.count == 0) {return [-1,-1]}

        var res = [0,nums.count-1]
        var start = 0
        var end = nums.count - 1

        while (start <= end) {
            let middle = start+(end-start)/2
            if (nums[middle] == target) {
                end = middle - 1
            } else if (nums[middle] < target) {
                start = middle + 1
            } else {
                end = middle - 1
            }
        }
        print(start)
        res[0] = (start >= 0 && start <= nums.count-1 && nums[start]==target) ? start : -1
        if (res[0] == -1) {
            return [-1,-1]
        }
        start = 0
        end = nums.count - 1

        while(start < end) {
            let middle = start + (end-start)/2 + 1
            if (nums[middle] == target) {
                start = middle
            } else if (nums[middle] < target) {
                start = middle
            } else {
                end = middle-1
            }
        }
        res[1] = (end >= 0 && end <= nums.count-1 && nums[end] == target) ? end : -1
        return res
    }
//}

var nums = [Int]()
nums = [5, 7, 7, 8, 8, 8, 10]
print(searchRange(nums, 8)) // [3,5]
nums = [1, 2]
print(searchRange(nums, 8)) // [-1,-1]
nums = [8, 8]
print(searchRange(nums, 8)) // [0,1]
nums = [2, 2]
print(searchRange(nums, 1)) // [0,1]

nums = [5, 7, 7, 8, 8, 8, 10]
print(searchRange_19ms(nums, 8)) // [3,5]
