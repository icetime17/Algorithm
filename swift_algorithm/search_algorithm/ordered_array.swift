#!/usr/bin/swift

let desc = ">>>>>>>>>> 有序数组可采用binary search来查找. \n 时间复杂度为O(log n)"

public struct OrderedArray<T: Comparable> {
    fileprivate var array = [T]()

    public init(array: [T]) {
        self.array = array.sorted()
    }

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    public subscript(index: Int) -> T {
        return array[index]
    }

    public mutating func removeAtIndex(index: Int) -> T {
        return array.remove(at: index)
    }

    public mutating func removeAll() {
        return array.removeAll()
    }

    public mutating func insert(_ newElement: T) -> Int {
        //let index = p_findIndexToInsert(newElement)
        let index = p_findIndexToInsertUsingBinarySearch(newElement)
        array.insert(newElement, at: index)
        return index
    }

    private func p_findIndexToInsert(_ newElement: T) -> Int {
        for i in 0..<array.count {
            if newElement <= array[i] {
                return i
            }
        }
        return array.count
    }

    // use binary search to optimize the findIndex method
    private func p_findIndexToInsertUsingBinarySearch(_ newElement: T) -> Int {
        var beginIndex = 0
        var endIndex = array.count

        while beginIndex < endIndex {
            let middleIndex = (beginIndex + endIndex) / 2
            if array[middleIndex] == newElement {
                return middleIndex
            } else if array[middleIndex] < newElement {
                beginIndex = middleIndex + 1
            } else {
                endIndex = middleIndex
            }
        }

        return beginIndex
    }
}

extension OrderedArray: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}


//////////////////////////////////////////////////

print(desc)


var numbers = [Int]()

numbers = [1,3,10,6,4,5,9,2,8,7]
print(numbers)
var orderedArray = OrderedArray(array: numbers)
print(orderedArray)

_ = orderedArray.insert(3)
print(orderedArray)
