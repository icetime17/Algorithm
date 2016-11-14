//
//  Node.swift
//  BinaryTree-Swift
//
//  Created by Chris Hu on 16/11/14.
//  Copyright © 2016年 icetime17. All rights reserved.
//

import Foundation

class Node {
    var nodeValue: String!
    var left: Node!
    var right: Node!
    
    convenience init(value: String) {
        self.init()
        self.nodeValue = value
    }
    
    func visit() {
        print(nodeValue)
    }
    
    func isNodeEqualTo(node: Node) -> Bool {
        return nodeValue == node.nodeValue
    }
}

extension Node {
    // 树的结点个数
    func allNodeNumber() -> Int {
        var number = 0
        if left != nil {
            number += left.allNodeNumber()
        }
        if right != nil {
            number += right.allNodeNumber()
        }
        number += 1
        return number
    }
    
    // 树的叶子结点个数
    func allLeafNodeNumber() -> Int {
        if left == nil && right == nil {
            return 1
        }
        return left.allLeafNodeNumber() + right.allLeafNodeNumber()
    }
    
    // 第i层的结点个数
    func nodeNumberOfLevel(level: Int) -> Int {
        if level < 1 {
            return 0
        }
        if level == 1 {
            return 1
        }
        var number = 0
        if left != nil {
            number += left.nodeNumberOfLevel(level: level - 1)
        }
        if right != nil {
            number += right.nodeNumberOfLevel(level: level - 1)
        }
        return number
    }
}

extension Node {
    // 树的深度
    func depth() -> Int {
        var number = 0
        if left != nil {
            number = left.depth()
        } else if right != nil {
            number = right.depth()
        }
        number += 1
        return number
    }
}

extension Node {
    // 前序遍历
    func preOrderTraversal() {
        visit()
        if left != nil {
            left.preOrderTraversal()
        }
        if right != nil {
            right.preOrderTraversal()
        }
    }
    
    // 中序遍历
    func midOrderTraversal() {
        if left != nil {
            left.midOrderTraversal()
        }
        visit()
        if right != nil {
            right.midOrderTraversal()
        }
    }
    
    // 后序遍历
    func lastOrderTraversal() {
        if left != nil {
            left.lastOrderTraversal()
        }
        if right != nil {
            right.lastOrderTraversal()
        }
        visit()
    }
    
    
    // 用栈实现前序遍历
    func preOrderTraversalViaStack() {
        var stack = Array<Node>()
        var node: Node? = self
        stack.insert(node!, at: 0)
        while !stack.isEmpty {
            node = stack.removeFirst()
            node?.visit()
            
            if let rNode = node?.right {
                stack.insert(rNode, at: 0)
            }
            if let lNode = node?.left {
                stack.insert(lNode, at: 0)
            }
        }
    }
    
    // 用栈实现中序遍历
    func midOrderTraversalViaStack() {
        var stack = Array<Node>()
        var node: Node? = self
        while !stack.isEmpty || node != nil {
            if node != nil {
                stack.insert(node!, at: 0)
                node = node?.left
            } else {
                node = stack.removeFirst()
                node?.visit()
                node = node?.right
            }
        }
    }
    
    // 用栈实现后序遍历
    func lastOrderTraversalViaStack() {
        var stack = Array<Node>()
    }
}

extension Node {
    // BFS: 队列
    func breadthFirstSearch() {
        var arr = Array<Node>()
        arr.append(self)
        
        while arr.count > 0 {
            let currentNode = arr.first
            currentNode?.visit() // 从队列头开始访问
            arr.removeFirst()
            
            if let lNode = currentNode?.left {
                arr.append(lNode)
            }
            if let rNode = currentNode?.right {
                arr.append(rNode)
            }
        }
    }
    
    // DFS: 栈
    func depthFirstSearch() {
        var arr = Array<Node>()
        arr.insert(self, at: 0)
        
        while arr.count > 0 {
            let currentNode = arr.first
            currentNode?.visit() // 从栈顶开始访问
            arr.removeFirst()
            
            if let rNode = currentNode?.right {
                arr.insert(rNode, at: 0)
            }
            if let lNode = currentNode?.left {
                arr.insert(lNode, at: 0)
            }
        }
    }
    
    func isNodeExisting(node: Node, path: inout Array<Node>) -> Bool {
        path.append(self)
        
        if self.isNodeEqualTo(node: node) {
            return true
        }
        
        var isExisting = false
        if left != nil {
            isExisting = left.isNodeExisting(node: node, path: &path)
        }
        if isExisting == false && right != nil {
            isExisting = right.isNodeExisting(node: node, path: &path)
        }
        if isExisting == false {
            path.removeLast()
        }
        return isExisting
    }
}

extension Node {
    // 二叉树翻转
    func invertNode() -> Node {
        if left == nil && right == nil {
            return self
        }
        
        left.invertNode()
        right.invertNode()
        
        let tmpNode = left
        left = right
        right = tmpNode
        
        return self
    }
}

