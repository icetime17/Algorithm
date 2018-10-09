#!/usr/bin/swift

/**
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:
Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
*/

/**
 给一个整型数组和一个目标值，判断数组中是否有两个数字之和等于目标值
 采用字典将每个值对应的index存起来.
 时间复杂度为O(n).
 */
func two_sum(_ nums: [Int], _ target: Int) -> [Int] {
    var dictValueIndex = Dictionary<Int, Int>()
    for (index, value) in nums.enumerated() {
        if let matchedIndex = dictValueIndex[target - value] {
            return [matchedIndex, index]
        }
        dictValueIndex[value] = index
    }
    return []
}

var nums = [2, 7, 11, 15]
print(two_sum(nums, 9))


func two_sum_set(_ nums: [Int], _ target: Int) -> Bool {
    var set = Set<Int>()
    for num in nums {
      if set.contains(target - num) {
        return true
      }
      set.insert(num)
    }
    return false
}

nums = [2, 7, 11, 15]
print(two_sum_set(nums, 9))


func two_sum_dict(_ nums: [Int], _ target: Int) -> [(Int, Int)] {
    var ret = [(Int, Int)]()

    var set = Set<Int>()
    for num in nums {
        if set.contains(target - num) {
            ret.append((target-num, num))
        }
        set.insert(num)
    }
    return ret
}

nums = [2, 7, 1, 8, 11, 15]
print(two_sum_dict(nums, 9))
