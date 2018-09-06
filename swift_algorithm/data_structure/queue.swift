#!/usr/bin/swift


/**
 Queue也使用Array, enqueue为O(1), dequeue为O(n)(因dequeue移出首元素, 剩下的元素需要依次向前做shift移动操作).
 因swift中的Array通常使用顺序表, append的平均复杂度为O(1). 个别情况考虑顺序表的分配内存已满而需要的迁移策略.
 迁移涉及到分配新的内存空间, 将已有的数据copy至新内存, O(n)复杂度.

 所以, Queue的enqueue操作很高效, 但dequeue操作有待优化:
 dequeue之后并不将剩下元素向前shift,而是将dequeue之后的空位留着,定期执行trim操作将所有空位移除即可.
 定期trim的复杂度为O(n), 但dequeue的平均复杂度降为O(1)了.
 因此,需要引入一个head,存储当前的实际首元素的index.
 */

let desc = ">>>>>>>>>> Queue采用Array实现, enqueue为O(1), dequeue为O(n). \n dequeue的优化方案:Array中可存储空值,并添加一个head存储当前实际首元素的index"

public struct Queue<T> {
    fileprivate var array = [T]()

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    public var top: T? {
        return array.first
    }

    public var bottom: T? {
        return array.last
    }

    public mutating func enqueue(_ newElement: T) {
        array.append(newElement)
    }

    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.remove(at: 0)
        }
    }
}


public struct Queue_Optimized<T> {
    fileprivate var array = [T?]() // 元素可能为nil
    fileprivate var head = 0 // 真正的首元素所在的index

    public var isEmpty: Bool {
        return array.count - head == 0
    }

    public var count: Int {
        return array.count - head
    }

    public var top: T? {
        if array.count == 0 {
          return nil
        }
        return array[head]
    }

    public var bottom: T? {
      if array.count == 0 {
        return nil
      }
      return array.last!
    }

    public mutating func enqueue(_ newElement: T) {
        array.append(newElement)
    }

    public mutating func dequeue() -> T? {
        if array.count - head <= 0 {
          return nil
        }

        let headElement = array[head]
        array[head] = nil
        head = head + 1

        // remove nil elements
        let p = Double(head) / Double(array.count)
        if array.count > 100 && p > 0.25 {
            // removeFirst(_:) Removes the specified number of elements from the beginning of the collection.
            array.removeFirst(head)
            head = 0
        }

        if head == array.count {
            array.removeAll()
            head = 0
        }

        return headElement
    }
}


//////////////////////////////////////////////////

print(desc)


var queue_int = Queue<Int>()
queue_int.enqueue(1)
print(queue_int) // [1]
print(queue_int.isEmpty) // false
queue_int.enqueue(2)
print(queue_int) // [1,2]
queue_int.enqueue(3)
print(queue_int) // [1,2,3]
print("top : \(queue_int.top as Any)") // 1
print("bottom : \(queue_int.bottom as Any)") // 3
print("dequeue: \(queue_int.dequeue() as Any)") // 1
print(queue_int) // [2,3]
print("dequeue: \(queue_int.dequeue() as Any)") // 2
print(queue_int) // [3]
print("dequeue: \(queue_int.dequeue() as Any)") // 3
print(queue_int) // []
print(queue_int.isEmpty) // true

print("")

var queue_string = Queue<String>()
queue_string.enqueue("AAA")
print(queue_string) // ["AAA"]
print(queue_string.isEmpty) // false
queue_string.enqueue("BBB")
print(queue_string) // ["AAA", "BBB"]
queue_string.enqueue("CCC")
print(queue_string) // ["AAA", "BBB", "CCC"]
print("top : \(queue_string.top as Any)") // "AAA"
print("bottom : \(queue_string.bottom as Any)") // "CCC"
print("dequeue: \(queue_string.dequeue() as Any)") // "AAA"
print(queue_string) // ["BBB", "CCC"]
print("dequeue: \(queue_string.dequeue() as Any)") // "BBB"
print(queue_string) // ["CCC"]
print("dequeue: \(queue_string.dequeue() as Any)") // "CCC"
print(queue_string) // []
print(queue_string.isEmpty) // true

print("")

var queue_string_optimized = Queue_Optimized<String>()
queue_string_optimized.enqueue("AAA")
print(queue_string_optimized) // ["AAA"], head= 0
print(queue_string_optimized.isEmpty) // false
queue_string_optimized.enqueue("BBB")
print(queue_string_optimized) // ["AAA", "BBB"], head = 0
queue_string_optimized.enqueue("CCC")
print(queue_string_optimized) // ["AAA", "BBB", "CCC"], head = 0
print("top : \(queue_string_optimized.top as Any)") // "AAA"
print("bottom : \(queue_string_optimized.bottom as Any)") // "CCC"

print("dequeue: \(queue_string_optimized.dequeue() as Any)") // "AAA"
print(queue_string_optimized) // [nil, "BBB", "CCC"], head = 1
print("dequeue: \(queue_string_optimized.dequeue() as Any)") // "BBB"
print(queue_string_optimized) // [nil, nil, "CCC"], head = 2
print("dequeue: \(queue_string_optimized.dequeue() as Any)") // "CCC"
print(queue_string_optimized) // [], head = 0
print(queue_string_optimized.isEmpty) // true

print("top : \(queue_string_optimized.top as Any)") // nil
print("bottom : \(queue_string_optimized.bottom as Any)") // nil
