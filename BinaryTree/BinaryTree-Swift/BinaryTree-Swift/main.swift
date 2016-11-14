//
//  main.swift
//  BinaryTree-Swift
//
//  Created by Chris Hu on 16/11/14.
//  Copyright © 2016年 icetime17. All rights reserved.
//

import Foundation

func simpleTree() -> Node {
    let nodeA = Node(value: "A")
    let nodeB = Node(value: "B")
    let nodeC = Node(value: "C")
    nodeA.left = nodeB
    nodeA.right = nodeC
    return nodeA
}

func myTree() -> Node {
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

// simple tree
print("")
let sTree = simpleTree()
print(sTree.allNodeNumber())
print(sTree.depth())
print("")
sTree.firstOrderTraverse()
print("")
sTree.midOrderTraverse()
print("")
sTree.lastOrderTraverse()
print("")
print("BFS")
sTree.breadthFirstSearch()
print("")
print("DFS")
sTree.depthFirstSearch()


// my tree
print("")
let mTree = myTree()
print(mTree.allNodeNumber())
print(mTree.depth())
print("")
mTree.firstOrderTraverse()
print("")
mTree.midOrderTraverse()
print("")
mTree.lastOrderTraverse()
print("")
print("BFS")
mTree.breadthFirstSearch()
print("")
print("DFS")
mTree.depthFirstSearch()
