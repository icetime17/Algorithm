#!/usr/bin/swift

print("")
print(">>>>>>>>>> Stack using protocol")


// 协议不能使用泛型，使用associatedtype
// 参考 https://xiaozhuanlan.com/ios-interview/6139850742
protocol StackProtocol {
  associatedtype Element

  var isEmpty: Bool { get }
  var size: Int { get }
  var top: Element? { get }
  var bottom: Element? { get }
  mutating func push(_ element: Element)
  mutating func pop() -> Element?
}

struct StackProtocoled<T>: StackProtocol {
  typealias Element = T

  private var array = [Element]()

  var isEmpty: Bool {
      return array.isEmpty
  }

  var size: Int {
      return array.count
  }

  var top: Element? {
      return array.last
  }

  var bottom: Element? {
      return array.first
  }

  mutating func push(_ element: Element) {
      array.append(element)
  }

  mutating func pop() -> Element? {
    if !isEmpty {
        return array.remove(at: array.count - 1)
    } else {
        return nil
    }
  }
}

var stack_int_v2 = StackProtocoled<String>()
print(stack_int_v2)
print(stack_int_v2.isEmpty)
print(stack_int_v2.size)
print(stack_int_v2.top as Any)
print(stack_int_v2.bottom as Any)
stack_int_v2.push("1")
stack_int_v2.push("2")
stack_int_v2.push("3")
print(stack_int_v2)
print(stack_int_v2.isEmpty)
print(stack_int_v2.size)
print(stack_int_v2.top as Any)
print(stack_int_v2.bottom as Any)
print(stack_int_v2.pop() as Any)
print(stack_int_v2)
print(stack_int_v2.pop() as Any)
print(stack_int_v2)
print(stack_int_v2.pop() as Any)
print(stack_int_v2)
print(stack_int_v2.isEmpty)
print(stack_int_v2.size)
print(stack_int_v2.top as Any)
print(stack_int_v2.bottom as Any)
