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
}



