#!/usr/bin/swift

let desc = ">>>>>>>>>> 给一个整型数组和一个目标值，判断数组中是否有两个数字之和等于目标值"

func targetEqualTwoSum(target: Int, array: [Int]) -> Array<(a: Int, b: Int)> {
    var set = Set<Int>()

    var results = Array<(a: Int, b: Int)>()

    for num in array {
        if set.contains(target - num) {
            results.append((num, target - num))
            continue
        }
        set.insert(num)
    }

    return results
}


//////////////////////////////////////////////////


print(desc)

print(targetEqualTwoSum(target: 6, array: [1,2,3,4,5,6]))
