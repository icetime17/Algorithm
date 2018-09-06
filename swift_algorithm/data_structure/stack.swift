#!/usr/bin/swift

/**
注意:
Notice that a push puts the new element at the end of the array, not the beginning.
Inserting at the beginning of an array is expensive, an O(n) operation,
because it requires all existing array elements to be shifted in memory.
Adding at the end is O(1); it always takes the same amount of time, regardless of the size of the array.

push操作从array的尾部添加,O(1)复杂度, 而非首部(O(n), 因为从array的首部插入数据更为复杂耗时,需移动整个数组中的元素).
 */

let desc = ">>>>>>>>>> Stack采用Array实现, push为O(1), pop为O(1)."

public struct Stack<T> {
    fileprivate var array = [T]()

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    public var top: T? {
        return array.last
    }

    public var bottom: T? {
        return array.first
    }
    
    public mutating func push(_ newElement: T) {
        array.append(newElement)
    }

    public mutating func pop() -> T? {
        if !isEmpty {
            return array.remove(at: array.count - 1)
        } else {
            return nil
        }
    }
}


//////////////////////////////////////////////////

print(desc)


var stack_int = Stack<Int>()
stack_int.push(1)
print(stack_int) // [1]
stack_int.push(2)
print(stack_int) // [1,2]
stack_int.push(3)
print(stack_int) // [1,2,3]
print(stack_int.top as Any) // 3
print(stack_int.bottom as Any) // 1
print(stack_int.pop() as Any) // 3
print(stack_int) // [1,2]
print(stack_int.pop() as Any) // 2
print(stack_int) // [1]
print(stack_int.pop() as Any) // 1
print(stack_int) // []

print("")

var string_stack = Stack<String>()
string_stack.push("AAA")
print(string_stack) // ["AAA"]
string_stack.push("BBB")
print(string_stack) // ["AAA", "BBB"]
string_stack.push("CCC")
print(string_stack) // ["AAA", "BBB", "CCC"]
print(string_stack.top as Any) // "CCC"
print(string_stack.bottom as Any) // "AAA"
print(string_stack.pop() as Any) // "CCC"
print(string_stack) // ["AAA", "BBB"]
print(string_stack.pop() as Any) // "BBB"
print(string_stack) // ["AAA"]
print(string_stack.pop() as Any) // "AAA"
print(string_stack) // []


print(string_stack.pop() as Any) // nil
print(string_stack) // []
