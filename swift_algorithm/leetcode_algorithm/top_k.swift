#!/usr/bin/swift

func swap_T<T>(_ array: inout [T], _ i: Int, _ j: Int) {
    if i<0 || j<0 || array.count <= i || array.count <= j {
      return
    }

    let tmp = array[i]
    array[i] = array[j]
    array[j] = tmp
}

func quick_sort(_ array: inout [Int], _ low: Int, _ high: Int) {
    if low >= high {
      return
    }

    func partition(_ array: inout [Int], _ low: Int, _ high: Int) -> Int {
      let pivot = array[low];

      var i = low
      var j = high
      while i<j {
          while i<j && array[j]>pivot {
              j -= 1
          }
          swap_T(&array, i, j)

          while i<j && array[i]<pivot {
              i += 1
          }
          swap_T(&array, i, j)
      }
      return i
    }

    let pivot = partition(&array, low, high)
    quick_sort(&array, low, pivot-1)
    quick_sort(&array, pivot+1, high)
}

// O(N*logN)
// 结果是排序过的
func top_k_by_all_sorted(_ array: inout [Int], _ k: Int) -> [Int] {
    if array.count <= k {
        return []
    }

    var sourceArray = array
    print(sourceArray)
    quick_sort(&sourceArray, 0, sourceArray.count-1)
    print(sourceArray)
    var ret = [Int]()
    for i in 0..<k {
        ret.append(sourceArray[i])
    }
    return ret
}

// O(N*K)
// 结果是排序过的
func top_k_by_k_sorted(_ array: inout [Int], _ k: Int) -> [Int] {
    if array.count <= k {
        return []
    }

    var ret = [Int]()
    var sourceArray = array
    print(sourceArray)
    // K次，每次取出最小值
    for _ in 0..<k {
      var min = 0
      for j in 1..<sourceArray.count {
          if sourceArray[j]<sourceArray[min] {
              min = j
          }
      }
      ret.append(sourceArray[min])
      sourceArray.remove(at: min)
    }
    return ret
}

// O(N*logK)
// 结果非排序的
// top K:
// 最小的K个，则构建K个元素的最大堆，将剩余元素依次与堆顶元素比较，若比堆顶元素小则替换之，并shiftDown保证最大堆。
// 最大的K个，则构建K个元素的最小堆，将剩余元素依次与堆顶元素比较，若比堆顶元素大则替换之，并shiftDown保证最小堆。
// 则最终结果则为top K的值。
func top_min_k_by_heap(_ array: inout [Int], _ k: Int) -> [Int] {
    if array.count <= k {
        return []
    }

    var ret = [Int]()

    print(array)

    var minHeap = MinHeap(array)
    print(minHeap)
    for _ in 0..<k {
        ret.append(minHeap.remove())
    }
    return ret
}

func top_max_k_by_heap(_ array: inout [Int], _ k: Int) -> [Int] {
    if array.count <= k {
        return []
    }

    var ret = [Int]()

    print(array)

    var maxHeap = MaxHeap(array)
    print(maxHeap)
    for _ in 0..<k {
      ret.append(maxHeap.remove())
    }

    return ret
}

// 构建最小堆
struct MinHeap {
    private var array = [Int]()
    private var count = 0
    init() {
      array.append(-1)
    }
    init(_ array: [Int]) {
        self.init()

        self.array += array
        count = array.count

        for i in (1...count/2).reversed() {
          shiftDown(i)
        }
    }
    public mutating func append(_ element: Int) {
        array.append(element)
        count += 1
        shiftUp(count)
    }
    private mutating func shiftUp(_ index: Int) {
        var k = index
        while k > 1 && array[k/2] > array[k] {
            swap_T(&array, k/2, k)
            k /= 2
        }
    }
    public mutating func remove() -> Int {
      let ret = array[1]
      array[1] = array[count]
      array.removeLast()
      count -= 1
      shiftDown(1)

      return ret
    }
    private mutating func shiftDown(_ index: Int) {
      var k = index

      while k*2 <= count {
          var idxToSwap = k*2
          if idxToSwap+1 <= count && array[idxToSwap+1] < array[idxToSwap] {
              idxToSwap += 1
          }
          if array[idxToSwap] < array[k] {
              swap_T(&array, idxToSwap, k)
          }
          k = idxToSwap
      }
    }
}

// 构建最大堆
struct MaxHeap {
    private var array = [Int]()
    private var count = 0
    init() {
      array.append(-1)
    }
    init(_ array: [Int]) {
      self.init()

      self.array += array
      count = array.count

      for i in (1...count/2).reversed() {
        shiftDown(i)
      }
    }
    mutating func append(_ element: Int) {
        array.append(element)
        count += 1
        shiftUp(count)
    }
    private mutating func shiftUp(_ index: Int) {
      var k = index
      while k>1 && array[k/2] < array[k] {
          swap_T(&array, k/2, k)
          k /= 2
      }
    }
    mutating func remove() -> Int {
      let ret = array[1]
      array[1] = array[count]
      array.removeLast()
      count -= 1
      shiftDown(1)
      return ret
    }
    private mutating func shiftDown(_ index: Int) {
      var k = index

      while k*2 <= count {
          var idxToSwap = k*2
          if idxToSwap+1 <= count && array[idxToSwap+1] > array[idxToSwap] {
              idxToSwap += 1
          }
          if array[idxToSwap] > array[k] {
              swap_T(&array, idxToSwap, k)
          }
          k = idxToSwap
      }
    }
}

var numbers = [Int]()

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)

print(">>>>>>>>>> top_k_by_all_sorted")
var result = top_k_by_all_sorted(&numbers, 3)
print(result)

print(">>>>>>>>>> top_k_by_k_sorted")
result = top_k_by_k_sorted(&numbers, 3)
print(result)

print(">>>>>>>>>> top_min_k_by_heap")
result = top_min_k_by_heap(&numbers, 3)
print(result)

print(">>>>>>>>>> top_max_k_by_heap")
result = top_max_k_by_heap(&numbers, 3)
print(result)
