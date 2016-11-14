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
    func firstOrderTraverse() {
        visit()
        if left != nil {
            left.firstOrderTraverse()
        }
        if right != nil {
            right.firstOrderTraverse()
        }
    }
    
    // 中序遍历
    func midOrderTraverse() {
        if left != nil {
            left.midOrderTraverse()
        }
        visit()
        if right != nil {
            right.midOrderTraverse()
        }
    }
    
    // 后序遍历
    func lastOrderTraverse() {
        if left != nil {
            left.lastOrderTraverse()
        }
        if right != nil {
            right.lastOrderTraverse()
        }
        visit()
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

