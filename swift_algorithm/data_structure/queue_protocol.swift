#!/usr/bin/swift

// 协议不能使用泛型，而是associatedtype
// 参考 https://xiaozhuanlan.com/ios-interview/6139850742
protocol QueueProtocol {
  associatedtype Element

  var isEmpty: Bool { get }
  var size: Int { get }
  var top: Element? { get }
  var bottom: Element? { get }
  mutating func enqueue(_ element: Element)
  mutating func dequeue() -> Element?
}

struct QueueProtocoled<T>: QueueProtocol {
    typealias Element = T

    private var array = [Element]()

    var isEmpty: Bool {
        return array.isEmpty
    }

    var size: Int {
        return array.count
    }

    var top: Element? {
        return array.first
    }

    var bottom: Element? {
        return array.last
    }

    mutating func enqueue(_ element: Element) {
        array.append(element)
    }

    mutating func dequeue() -> Element? {
        if isEmpty {
            return nil
        } else {
            return array.remove(at: 0)
        }
    }
}

var queue_i = QueueProtocoled<Int>()
queue_i.enqueue(1)
print(queue_i)
print(queue_i.isEmpty)
print(queue_i.size)
print(queue_i.top as Any)
print(queue_i.bottom as Any)
queue_i.enqueue(2)
queue_i.enqueue(3)
print(queue_i)
print(queue_i.isEmpty)
print(queue_i.size)
print(queue_i.top as Any)
print(queue_i.bottom as Any)
print(queue_i.dequeue() as Any)
print(queue_i.dequeue() as Any)
print(queue_i.dequeue() as Any)
print(queue_i)
print(queue_i.isEmpty)
print(queue_i.size)
print(queue_i.top as Any)
print(queue_i.bottom as Any)

var queue_s = QueueProtocoled<String>()
queue_s.enqueue("1")
print(queue_s)
print(queue_s.isEmpty)
print(queue_s.size)
print(queue_s.top as Any)
print(queue_s.bottom as Any)
queue_s.enqueue("2")
queue_s.enqueue("3")
print(queue_s)
print(queue_s.isEmpty)
print(queue_s.size)
print(queue_s.top as Any)
print(queue_s.bottom as Any)
print(queue_s.dequeue() as Any)
print(queue_s.dequeue() as Any)
print(queue_s.dequeue() as Any)
print(queue_s)
print(queue_s.isEmpty)
print(queue_s.size)
print(queue_s.top as Any)
print(queue_s.bottom as Any)


struct QueueProtocoled_Optimized<T>: QueueProtocol {
    typealias Element = T

    private var array = [Element?]()
    private var head = 0 // 首元素所在的index

    var isEmpty: Bool {
        return array.count - head == 0
    }

    var size: Int {
        return array.count - head
    }

    var top: Element? {
        if array.count == 0 {
            return nil
        } else {
          return array[head]
        }
    }

    var bottom: Element? {
      if array.count == 0 {
          return nil
      } else {
        return array.last!
      }
    }

    mutating func enqueue(_ element: Element) {
        array.append(element)
    }

    mutating func dequeue() -> Element? {
        if isEmpty {
            return nil
        }

        let headElement = array[head]
        array[head] = nil
        head += 1

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

var queue_op = QueueProtocoled_Optimized<Int>()
queue_op.enqueue(1)
print(queue_op)
print(queue_op.isEmpty)
print(queue_op.size)
print(queue_op.top as Any)
print(queue_op.bottom as Any)
queue_op.enqueue(2)
queue_op.enqueue(3)
print(queue_op)
print(queue_op.isEmpty)
print(queue_op.size)
print(queue_op.top as Any)
print(queue_op.bottom as Any)
print(queue_op.dequeue() as Any)
print(queue_op.dequeue() as Any)
print(queue_op.dequeue() as Any)
print(queue_op)
print(queue_op.isEmpty)
print(queue_op.size)
print(queue_op.top as Any)
print(queue_op.bottom as Any)
