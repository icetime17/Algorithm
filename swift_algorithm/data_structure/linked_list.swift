#!/usr/bin/swift

class LinkedListNode<T> {
    var value: T!
    var pre: LinkedListNode<T>?
    var next: LinkedListNode<T>?

    init(value: T) {
        self.value = value
    }

    func visit() {
        print(self.value)
    }

    func isEqual(_ node: LinkedListNode) -> Bool {
        return (value as! String) == (node.value as! String)
    }
}

extension LinkedListNode: CustomStringConvertible {
    var description: String {
        return value as! String
    }
}

class LinkedList<T> {
    typealias Node = LinkedListNode<T>

    var head: Node?

    var isEmpty: Bool {
        return head == nil
    }

    var first: Node? {
        return head
    }

    var last: Node? {
        guard var node = head else { return nil }

        while let next = node.next {
            node = next
        }
        return node
    }

    var count: Int {
        var c = 0
        guard var node = head else { return c }

        c = c + 1

        while let next = node.next {
            node = next
            c = c + 1
        }
        return c
    }

    func node(at index: Int) -> Node? {
        guard index >= 0 else { return nil }
        guard index < count else { return nil }

        guard var node = head else { return nil }
        if index == 0 {
            return node
        }

        var i = 0
        while let next = node.next {
            node = next
            i = i + 1
            if i == index {
                break
            }
        }
        return node
    }

    func enumerate(by closure: (_ node: Node) -> Void) {
        guard var node = head else { return }
        closure(node)

        while let next = node.next {
            node = next
            closure(node)
        }
    }

    func contains(_ node: Node) -> Bool {
        guard var pivot = head else {
            return false
        }

        if pivot.isEqual(node) {
            return true
        }

        while let next = pivot.next {
            pivot = next
            if pivot.isEqual(node) {
                return true
            }
        }

        return false
    }

    func append(_ node: Node) -> Int {
        guard let last = last else {
            head = node
            return 0
        }
        last.next = node
        node.pre = last
        return count - 1
    }

    func pop() -> Node? {
        if count > 1 {
            let tmp = last!
            last!.pre!.next = nil
            return tmp
        } else if count == 1 {
            let tmp = head
            head = nil
            return tmp
        } else {
            return nil
        }
    }

    func insert(_ node: Node, at index: Int) {
        if index < 0 || index > count { return }
        if count == 0 {
            head = node
            return
        }

        if index == 0 {
            node.next = head
            head?.pre = node
            head = node
        } else if index > 0 {
            if let pre = self.node(at: index - 1) {
                if let preNext = pre.next {
                    node.next = preNext
                    pre.next!.pre = node
                }
                pre.next = node
                node.pre = pre
            }
        }
    }

    func remove(_ node: Node) {
        let pre = node.pre
        let next = node.next

        if let pre = pre {
            pre.next = next
        } else {
            head = next
        }

        if let next = next {
            next.pre = pre
        }
    }

    func removeAll() {
        head = nil
    }

    func reverse() {
        var node = head
        while let curNode = node {
            node = curNode.next
            curNode.next = curNode.pre
            curNode.pre = node
            head = curNode
        }
    }

    func isCircleExisting() -> Bool {
        var slow = head
        var fast = head

        while fast != nil && fast!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next

            if let slow = slow, let fast = fast {
                if slow.isEqual(fast) {
                    return true
                }
            }
        }
        return false
    }
}

var head = LinkedListNode(value: "HEAD")
var A = LinkedListNode(value: "A")
var B = LinkedListNode(value: "B")

var list = LinkedList<String>()
list.head = head
head.next = A
A.pre = head
A.next = B
B.pre = A

if list.isCircleExisting() == false {
    list.enumerate { (node) in
        node.visit()
    }
}

print(list.isCircleExisting())


list.reverse()

if list.isCircleExisting() == false {
    list.enumerate { (node) in
        node.visit()
    }
}

head.visit()
print(list.count)
list.head?.visit()
list.last?.visit()
_ = list.contains(A)
list.enumerate { (node) in
    node.visit()
}

print("> 1")
print(list.node(at: 0) as Any)
print(list.node(at: 1) as Any)
print(list.node(at: 2) as Any)
print(list.node(at: 3) as Any)
print(list.node(at: 4) as Any)
print(list.node(at: -1) as Any)
print(list.node(at: 10) as Any)

print("> 2")
print(list.count)
print(list.head as Any)
print(list.last as Any)
print(list.pop() as Any)
print(list.pop() as Any)
print(list.pop() as Any)
print(list.pop() as Any)

print("> 3")
print(list.append(head))
print(list.append(A))
print(list.append(B))

if list.isCircleExisting() == false {
    list.enumerate { (node) in
        node.visit()
    }
}

print("> 4")
var newHead = LinkedListNode(value: "HEAD")
list.insert(newHead, at: 0)
list.insert(LinkedListNode(value: "C"), at: -1)
list.insert(LinkedListNode(value: "D"), at: 0)
list.insert(LinkedListNode(value: "E"), at: 1)
list.insert(LinkedListNode(value: "F"), at: 2)
list.insert(LinkedListNode(value: "G"), at: list.count)
list.insert(LinkedListNode(value: "H"), at: 100)
list.insert(LinkedListNode(value: "I"), at: -1)

if list.isCircleExisting() == false {
    list.enumerate { (node) in
        node.visit()
    }
}

print(list.contains(LinkedListNode(value: "HEAD")))
print(list.contains(LinkedListNode(value: "C")))
print(list.contains(LinkedListNode(value: "D")))
