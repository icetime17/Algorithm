#!/usr/bin/swift

let desc = ">>>>>>>>>> 二叉树主要考虑递归的思想"

class Node {
    var value: String!
    var left: Node?
    var right: Node?

    convenience init(value: String) {
        self.init()
        self.value = value
    }

    func visit() {
        print(value)
    }

    func isNodeEqualTo(node: Node) -> Bool {
        return value == node.value
    }

}


/*
extension Node {
    var desc: [String]! {
        var leftDescs = [String]()
        var rightDescs = [String]()

        if let left = left {
            leftDescs = leftDescs + left.desc
        }
        if let right = right {
            rightDescs = rightDescs + right.desc
        }
        return leftDescs + self.desc + rightDescs
    }
}
*/

extension Node: CustomStringConvertible {
    public var description: String {
        return value
    }
}

extension Node {
    // 二叉树的最大深度
    // [log(N+1),N]
    var maxDepth: Int {
        var number = 0
        if let left = left {
            number = left.maxDepth
        }
        if let right = right {
            number = max(number, right.maxDepth)
        }
        number = number + 1
        return number
    }

    // 二叉树的所有节点个数
    // N
    var allNodesNumber: Int {
        var number = 0
        if let left = left {
            number = number + left.allNodesNumber
        }
        if let right = right {
            number = number + right.allNodesNumber
        }
        number = number + 1
        return number
    }

    // 二叉树的所有叶子节点(非主节点)个数
    // [1,log(N+1)]
    var allLeafNodesNumber: Int {
        if left == nil && right == nil {
            return 1
        }

        var number = 0
        if let left = left {
            number = number + left.allLeafNodesNumber
        }
        if let right = right {
            number = number + right.allLeafNodesNumber
        }
        return number
    }

    // 第level层的所有节点个数
    func nodesNumberAtLevel(level: Int) -> Int {
        if level < 1 {
            return 0
        }
        if level == 1 {
            return level
        }
        var number = 0
        if let left = left {
            // self的第level层，即left和right的第level-1层
            number = number + left.nodesNumberAtLevel(level: level - 1)
        }
        if let right = right {
            number = number + right.nodesNumberAtLevel(level: level - 1)
        }
        return number
    }
}


extension Node {
    // 二叉树的所有节点
    // N
    var allNodes: [Node]! {
        var leftNodes = [Node]()
        var rightNodes = [Node]()
        if let left = left {
            leftNodes = left.allNodes
        }
        if let right = right {
            rightNodes = right.allNodes
        }
        return leftNodes + [self] + rightNodes
    }

    // 二叉树的所有叶子节点(非主节点)
    var allLeafNodes: [Node]! {
        if left == nil && right == nil {
            return [self]
        }

        var leafNodes = [Node]()
        if let left = left {
            leafNodes = leafNodes + left.allLeafNodes
        }
        if let right = right {
            leafNodes = leafNodes + right.allLeafNodes
        }
        return leafNodes
    }


    // 第level层的所有节点
    func nodesAtLevel(level: Int) -> [Node] {
        if level < 1 {
            return [Node]()
        }
        if level == 1 {
            return [self]
        }

        var leftNodes = [Node]()
        var rightNodes = [Node]()
        if let left = left {
            // self的第level层，即left和right的第level-1层
            leftNodes = left.nodesAtLevel(level: level - 1)
        }
        if let right = right {
            rightNodes = right.nodesAtLevel(level: level - 1)
        }
        return leftNodes + rightNodes
    }

    func visitNodesAtLevel(level: Int) {
        for node in self.nodesAtLevel(level: level) {
            node.visit()
        }
    }

}


extension Node {
    // 二叉查找树：左结点的值 < 根节点的值 < 右节点的值
    var isBinarySearchTree: Bool {
        return p_isValueIn(min: nil, max: nil)
    }

    private func p_isValueIn(min: String?, max: String?) -> Bool {
        // 所有左子节点都必须小于根节点
        if min != nil && value <= min! {
            return false
        }
        // 所有右子节点都必须大于根节点
        if max != nil && value >= max! {
            return false
        }

        var ret = true
        if let left = left {
            ret = ret && left.p_isValueIn(min: min, max: value)
        }
        if let right = right {
            ret = ret && right.p_isValueIn(min: value, max: max)
        }
        return ret
    }
}


extension Node {
    // DFS: 利用栈
    // 栈的push/pop使用Array的尾部元素.
    func depthFirstSearch() {
        var stack = [Node]()
        stack.append(self)

        while stack.count > 0 {
            guard let currentNode = stack.last else {
                continue
            }

            currentNode.visit()
            stack.removeLast()

            if let right = currentNode.right {
                stack.append(right)
            }
            if let left = currentNode.left {
                stack.append(left)
            }
        }
    }

    // BFS: 利用队列
    func breadthFirstSearch() {
        var array = [Node]()
        array.append(self)

        while array.count > 0 {
            guard let currentNode = array.first else {
                continue
            }

            currentNode.visit()
            array.removeFirst()

            if let left = currentNode.left {
                array.append(left)
            }
            if let right = currentNode.right {
                array.append(right)
            }
        }
    }
}


extension Node {
    // 前序遍历
    func preOrderTraversal() {
        visit()
        if let left = left {
            left.preOrderTraversal()
        }
        if let right = right {
            right.preOrderTraversal()
        }
    }

    // 中序遍历
    func middleOrderTraversal() {
        if let left = left {
            left.middleOrderTraversal()
        }
        visit()
        if let right = right {
            right.middleOrderTraversal()
        }
    }

    // 后序遍历
    func lastOrderTraversal() {
        if let left = left {
            left.lastOrderTraversal()
        }
        if let right = right {
            right.lastOrderTraversal()
        }
        visit()
    }

    // 分别用栈实现, 而不使用递归
    // 用栈实现前序遍历
    func preOrderTraversalViaStack() {
        var stack = [Node]()
        stack.append(self)

        while stack.count > 0 {
            guard let currentNode = stack.last else {
                continue
            }

            currentNode.visit()
            stack.removeLast()

            if let right = currentNode.right {
                stack.append(right)
            }
            if let left = currentNode.left {
                stack.append(left)
            }
        }
    }

    // 用栈实现中序遍历
    func middleOrderTraversalViaStack() {
        var stack = [Node]()
        var node: Node? = self

        while stack.count > 0  || node != nil {
            if node != nil {
                stack.append(node!)
                node = node?.left
            } else {
                node = stack.removeLast()
                node?.visit()
                node = node?.right
            }
        }
    }

    // 用栈实现后序遍历
    func lastOrderTraversalViaStack() {
        // var stack = Array<Node>()
    }
}


extension Node {
    func isNodeExisting(node: Node) -> Bool {
        return false
    }
}


extension Node {
    // 二叉树翻转
    func reverse() -> Node {
        if left == nil && right == nil {
            return self
        }

        if let left = left {
            _ = left.reverse()
        }
        if let right = right {
            _ = right.reverse()
        }

        let tmp = left
        left = right
        right = tmp

        return self
    }
}

// 判断是不是平衡二叉树（红黑树，AVL树等）
// 空树，或左右两个子树的高度差的绝对值不超过1。
// 左右两个子树都是平衡二叉树。
// 先递归判断左右子树都是平衡的，然后求出左右子树的深度，若深度之差大于1，则不平衡。
// 优化:
// 在分别判断左右子树是否平衡的同时，将其深度计算出来
func isBalancedTree(node: Node?) -> Bool {
    if node == nil {
        return true
    }

    if isBalancedTree(node: node?.left) == false {
        return false
    }
    if isBalancedTree(node: node?.right) == false {
        return false
    }

    let depthLeft = node?.left?.maxDepth != nil ? node?.left?.maxDepth : 0
    let depthRight = node?.right?.maxDepth != nil ? node?.right?.maxDepth : 0
    if abs(depthLeft! - depthRight!) > 1 {
        return false
    }
    return true
}

func isBalancedTree_v2(node: Node?, depth: inout Int) -> Bool {
    if node == nil {
        return true
    }

    var depthLeft = 0
    var depthRight = 0
    if isBalancedTree_v2(node: node?.left, depth: &depthLeft) == false {
        return false
    }
    if isBalancedTree_v2(node: node?.right, depth: &depthRight) == false {
        return false
    }

    if abs(depthLeft - depthRight) > 1 {
        return false
    }
    depth = max(depthLeft, depthRight) + 1
    return true
}

//////////////////////////////////////////////////

print(desc)


func simpleTree() -> Node {
    let a = Node(value: "A")
    let b = Node(value: "B")
    let c = Node(value: "C")
    a.left = b
    a.right = c
    let d = Node(value: "D")
    let e = Node(value: "E")
    b.left = d
    b.right = e
    let f = Node(value: "F")
    let g = Node(value: "G")
    c.left = f
    c.right = g
    return a
}

let sTree = simpleTree()
print(">>>>>>>>>> simpleTree")
print("二叉树的深度: \(sTree.maxDepth)")
//print("二叉树的desc: \(sTree.desc)")
print("二叉树的所有节点个数: \(sTree.allNodesNumber)")
print("二叉树的所有叶子节点个数: \(sTree.allLeafNodesNumber)")
for level in 0 ... sTree.maxDepth {
    print("二叉树的第\(level)层的所有节点个数: \(sTree.nodesNumberAtLevel(level: level))")

    print("二叉树的第\(level)层的所有节点: ")
    sTree.visitNodesAtLevel(level: level)
}
for level in 0 ... sTree.maxDepth {
    print("二叉树的第\(level)层的所有节点个数: \(sTree.nodesNumberAtLevel(level: level))")

    print("二叉树的第\(level)层的所有节点: ")
    sTree.visitNodesAtLevel(level: level)
}
print("二叉树的所有节点: ")
for node in sTree.allNodes {
    node.visit()
}
print("二叉树的所有叶子节点: ")
for node in sTree.allLeafNodes {
    node.visit()
}
print("二叉树是否是二叉查找树: \(sTree.isBinarySearchTree)")
print("二叉树的深度优先遍历(DFS): ")
sTree.depthFirstSearch()
print("二叉树的广度优先遍历(BFS): ")
sTree.breadthFirstSearch()
print("二叉树的前序遍历: ")
sTree.preOrderTraversal()
print("二叉树的中序遍历: ")
sTree.middleOrderTraversal()
print("二叉树的后序遍历: ")
sTree.lastOrderTraversal()
print("二叉树的前序遍历(栈实现): ")
sTree.preOrderTraversalViaStack()
print("二叉树的中序遍历(栈实现): ")
sTree.middleOrderTraversalViaStack()

print("二叉树翻转: \(sTree.reverse())")


print("")


func complexTree() -> Node {
    let nodeA = Node(value: "A")
    let nodeB = Node(value: "B")
    let nodeC = Node(value: "C")
    nodeA.left = nodeB
    nodeA.right = nodeC
    let nodeD = Node(value: "D")
    let nodeE = Node(value: "E")
    nodeB.left = nodeD
    nodeB.right = nodeE
    let nodeF = Node(value: "F")
    let nodeG = Node(value: "G")
    nodeC.left = nodeF
    nodeC.right = nodeG
    let nodeH = Node(value: "H")
    let nodeI = Node(value: "I")
    nodeD.left = nodeH
    nodeD.right = nodeI
    let nodeJ = Node(value: "J")
    let nodeK = Node(value: "K")
    nodeE.left = nodeJ
    nodeE.right = nodeK
    let nodeL = Node(value: "L")
    let nodeM = Node(value: "M")
    nodeF.left = nodeL
    nodeF.right = nodeM
    let nodeN = Node(value: "N")
    let nodeO = Node(value: "O")
    nodeG.left = nodeN
    nodeG.right = nodeO

    return nodeA
}


let cTree = complexTree()
print(">>>>>>>>>> complexTree")
print("二叉树的深度: \(cTree.maxDepth)")
//print("二叉树的desc: \(cTree.desc)")
print("二叉树的所有节点个数: \(cTree.allNodesNumber)")
print("二叉树的所有叶子节点个数: \(cTree.allLeafNodesNumber)")
for level in 0 ... cTree.maxDepth {
    print("二叉树的第\(level)层的所有节点个数: \(cTree.nodesNumberAtLevel(level: level))")

    print("二叉树的第\(level)层的所有节点: ")
    cTree.visitNodesAtLevel(level: level)
}
for level in 0 ... cTree.maxDepth {
    print("二叉树的第\(level)层的所有节点个数: \(cTree.nodesNumberAtLevel(level: level))")

    print("二叉树的第\(level)层的所有节点: ")
    cTree.visitNodesAtLevel(level: level)
}
print("二叉树的所有节点: ")
for node in cTree.allNodes {
    node.visit()
}
print("二叉树的所有叶子节点: ")
for node in cTree.allLeafNodes {
    node.visit()
}
print("二叉树是否是二叉查找树: \(cTree.isBinarySearchTree)")
print("二叉树的深度优先遍历(DFS): ")
cTree.depthFirstSearch()
print("二叉树的广度优先遍历(BFS): ")
cTree.breadthFirstSearch()
print("二叉树的前序遍历: ")
cTree.preOrderTraversal()
print("二叉树的中序遍历: ")
cTree.middleOrderTraversal()
print("二叉树的后序遍历: ")
cTree.lastOrderTraversal()
print("二叉树的前序遍历(栈实现): ")
cTree.preOrderTraversalViaStack()
print("二叉树的中序遍历(栈实现): ")
cTree.middleOrderTraversalViaStack()

print("二叉树翻转: \(cTree.reverse())")

func nonBalancedTree() -> Node {
    let a = Node(value: "A")
    let b = Node(value: "B")
    let c = Node(value: "C")
    a.left = b
    a.right = c
    let d = Node(value: "D")
    let e = Node(value: "E")
    b.left = d
    b.right = e
    let f = Node(value: "F")
    let g = Node(value: "G")
    d.left = f
    d.right = g
    return a
}
let nbTree = nonBalancedTree()
print("平衡二叉树: \(isBalancedTree(node: sTree))")
print("平衡二叉树: \(isBalancedTree(node: cTree))")
print("非平衡二叉树: \(isBalancedTree(node: nbTree))")
var depth = 0
print("非平衡二叉树: \(isBalancedTree_v2(node: nbTree, depth: &depth))")
