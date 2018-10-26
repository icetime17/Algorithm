#!/usr/bin/swift

func swap_T<T>(_ array: inout [T], _ low: Int, _ high: Int) {
    if array.count <= 1 || low >= high || low < 0 || high >= array.count {
        return
    }

    let tmp = array[low]
    array[low] = array[high]
    array[high] = tmp
}

func partition(_ array: inout [Int], _ low: Int, _ high: Int) -> Int {
  if array.count <= 1 || low >= high || low < 0 || high >= array.count {
      return -1
  }

  let pivot = array[low]

  var i = low
  var j = high

  while i < j {
    while i < j && array[j] >= pivot {
      j -= 1
    }
    swap_T(&array, i, j)

    while i < j && array[i] <= pivot {
      i += 1
    }
    swap_T(&array, i, j)
  }

  return i
}

func quick_sort(_ array: inout [Int], _ low: Int, _ high: Int) {
  if array.count <= 1 || low >= high || low < 0 || high >= array.count {
      return
  }

  let pivot = partition(&array, low, high)
  quick_sort(&array, low, pivot - 1)
  quick_sort(&array, pivot + 1, high)
}

func find_middle(_ array: inout [Int]) -> Int {
    let low = 0
    let high = array.count - 1

    let mid = high / 2
    // 每次partition返回的div即为当次的array[low]应该处于的正确位置
    var div = partition(&array, low, high)
    while div != mid {
        if div > mid {
          div = partition(&array, low, div - 1)
        } else {
          div = partition(&array, div + 1, high)
        }
    }
    return mid
}

var numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
quick_sort(&numbers, 0, numbers.count - 1)
print(numbers)

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
let mid = find_middle(&numbers)
print(numbers[mid])
