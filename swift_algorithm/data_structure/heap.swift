#!/usr/bin/swift

func swap_T<T>(_ array: inout [T], _ i: Int, _ j: Int) {
    if i < 0 || j < 0 || array.count <= i || array.count <= j {
        return
    }

    let tmp = array[i]
    array[i] = array[j]
    array[j] = tmp
}

public struct MaxHeap {
    private var array = [Int]()
    private var count = 0
    // 如何做到从索引 1 开始
    init() {
        array.append(-1)
    }

    // heapify
    init(_ array: [Int]) {
      self.init()

      // for i in 0..<array.count {
      //     self.array.append(array[i])
      // }
      self.array += array
      count = array.count

      // heapify
      // 依次做shiftDown操作
      for i in (1...count/2).reversed() {
          shiftDown(i)
      }
    }

    public var isEmpty: Bool {
        return array.count <= 1
    }

    public var size: Int {
        return array.count - 1
    }

    public subscript(index: Int) -> Int {
      if index > 0 && index < array.count {
        return array[index]
      } else {
        return -1
      }
    }

    public mutating func append(_ element: Int) {
        array.append(element)
        count += 1
        shiftUp(count)
        // shiftUp_optimized(count)
    }

    private mutating func shiftUp(_ index: Int) {
      var k = index

      // 生成最大堆，保证父节点array[k/2]比子节点大
      while k > 1 && array[k/2] < array[k] {
          swap_T(&array, k/2, k)
          k /= 2
      }
    }

    private mutating func shiftUp_optimized(_ index: Int) {
      var k = index

      // 生成最大堆，保证父节点array[k/2]比子节点大
      // 记录应该swap的位置，则仅需依次swap一次即可
      var idxToSwap = k // 仅用于记录最后一次的k而已
      while k > 1 && array[k/2] < array[k] {
          idxToSwap = k
          k /= 2
      }
      if idxToSwap != index {
          swap_T(&array, idxToSwap, index)
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

      // 维持最大堆
      while k*2 <= count { // 有左节点
        var idxToSwap = k*2 // 与k交换的idx
        if idxToSwap+1 <= count && array[idxToSwap+1] > array[idxToSwap] {
          // 有右节点，且右节点比左节点大
          idxToSwap += 1
        }
        if array[idxToSwap] > array[k] {
            swap_T(&array, idxToSwap, k)
        }
        k = idxToSwap
      }
    }

    private mutating func shiftDown_optimized(_ index: Int) {
      // var k = index
    }
}

// var maxHeap = MaxHeap()
// for i in 1..<10 {
//   maxHeap.append(i)
// }
var maxHeap = MaxHeap([1,2,3,4,5,6,7,8,9])
print(maxHeap)
print(maxHeap.isEmpty)
print(maxHeap.size)
print(maxHeap[1], maxHeap[2], maxHeap[3])
print(maxHeap[2], maxHeap[4], maxHeap[5])
print(maxHeap[3], maxHeap[6], maxHeap[7])
print(maxHeap[4], maxHeap[8], maxHeap[9])
let max = maxHeap.remove()
print(max)
print(maxHeap)


print("")


public struct MinHeap {
    private var array = [Int]()
    private var count = 0
    // 如何做到从索引 1开始
    init() {
        array.append(-1)
    }

    // heapify
    init(_ array: [Int]) {
      self.init()

      self.array += array
      count = array.count

      // heapify
      for i in (1...count/2).reversed() {
          shiftDown(i)
      }
    }

    public var isEmpty: Bool {
        return array.count <= 1
    }

    public var size: Int {
        return array.count - 1
    }

    public subscript(index: Int) -> Int {
      if index > 0 && index < array.count {
        return array[index]
      } else {
        return -1
      }
    }

    public mutating func append(_ element: Int) {
        array.append(element)
        count += 1
        shiftUp(count)
    }

    private mutating func shiftUp(_ index: Int) {
        var k = index
        // 保证最小堆，父节点一定不能比子节点大
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

        while k*2 <= count { // 有左节点
            var idxToSwap = k*2
            if idxToSwap+1 <= count && array[idxToSwap+1] < array[idxToSwap] {
                idxToSwap += 1
            }
            if array[idxToSwap] < array[k] {
                swap_T(&array, k, idxToSwap)
            }
            k = idxToSwap
        }
    }
}

/*
var minHeap = MinHeap()
minHeap.append(1)
minHeap.append(3)
minHeap.append(4)
minHeap.append(2)
minHeap.append(6)
minHeap.append(5)
minHeap.append(8)
minHeap.append(9)
minHeap.append(7)
*/
var minHeap = MinHeap([1,3,4,2,6,5,8,9,7])
print(minHeap)
print(minHeap.isEmpty)
print(minHeap.size)
print(minHeap[1], minHeap[2], minHeap[3])
print(minHeap[2], minHeap[4], minHeap[5])
print(minHeap[3], minHeap[6], minHeap[7])
print(minHeap[4], minHeap[8], minHeap[9])
let min = minHeap.remove()
print(min)
print(minHeap)
