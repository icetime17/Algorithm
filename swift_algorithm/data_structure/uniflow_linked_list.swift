#!/usr/bin/swift

class LinkedListNode {
    var value: String!
    var next: LinkedListNode?

    init(value: String) {
        self.value = value
    }

    func visit() {
        print(value)
    }

    func isEqualTo(node: LinkedListNode) -> Bool {
        return value == node.value
    }
}

extension LinkedListNode {
    // 遍历
    func traverse() {
        var node: LinkedListNode? = self
        while let curNode = node {
            curNode.visit()
            node = curNode.next
        }
    }

    // 返回头结点
    func reverse() -> LinkedListNode {
        var newHead: LinkedListNode? = nil
        var node: LinkedListNode? = self
        while node != nil {
            let tmp = node!.next
            node!.next = newHead
            newHead = node!
            node = tmp
        }
        return newHead!
    }
}

extension LinkedListNode {
    var size: Int {
        var number = 1
        var node: LinkedListNode? = self
        while let cur = node {
            if cur.next == nil {
                break
            }
            node = cur.next
            number += 1
        }
        return number
    }

    // 尾节点
    var last: LinkedListNode {
        var node: LinkedListNode? = self
        while let cur = node {
            if cur.next == nil {
                break
            }
            node = cur.next
        }
        return node!
    }

    // 链表是否有环
    var hasCircle: Bool {
        var slow: LinkedListNode? = head
        var fast: LinkedListNode? = head
        while fast != nil && fast!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next

            if let slow = slow, let fast = fast {
              if slow.isEqualTo(node: fast) {
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
var C = LinkedListNode(value: "C")
var D = LinkedListNode(value: "D")
head.next = A
A.next = B
B.next = C
C.next = D

head.traverse()
head.last.visit()
print(head.size)
print("")
var reversed = head.reverse()
reversed.traverse()
reversed.last.visit()
print(reversed.size)

// D.next = head
// print(head.hasCircle)
