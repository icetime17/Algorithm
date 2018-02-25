#!/usr/bin/swift

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


//////////////////////////////////////////////////


var numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
swap_T(array: &numbers, i: 1, j: 2)
print(numbers)

numbers = [1,3]
print(numbers)
swap_T(array: &numbers, i: 1, j: 2)
print(numbers)
