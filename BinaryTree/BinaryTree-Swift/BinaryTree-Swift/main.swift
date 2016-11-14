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
print(sTree.depth())
print(sTree.allNodeNumber())
print(sTree.allLeafNodeNumber())
print(sTree.nodeNumberOfLevel(level: 0))
print(sTree.nodeNumberOfLevel(level: 1))
print(sTree.nodeNumberOfLevel(level: 2))
print(sTree.nodeNumberOfLevel(level: 3))

print("")
print("preOrderTraversal")
sTree.preOrderTraversal()
print("")
print("midOrderTraversal")
sTree.midOrderTraversal()
print("")
print("lastOrderTraversal")
sTree.lastOrderTraversal()
print("")
print("BFS")
sTree.breadthFirstSearch()
print("")
print("DFS")
sTree.depthFirstSearch()

print("")
print("invertNode")
let retSTree = sTree.invertNode()
retSTree.breadthFirstSearch()

let nodeA = Node(value: "A")
let nodeB = Node(value: "B")
let nodeC = Node(value: "C")
let nodeD = Node(value: "D")
nodeA.left = nodeB
nodeA.right = nodeC
print("")
print("isNodeExisting")
var path = Array<Node>()
var isExisting = nodeA.isNodeExisting(node: nodeB, path: &path)
print("\(isExisting)")
for tmpNode: Node in path {
    tmpNode.visit()
}
print("")
print("isNodeExisting")
isExisting = sTree.isNodeExisting(node: nodeD, path: &path)
print("\(isExisting)")


// my tree
print("")
let mTree = myTree()
print(mTree.depth())
print(mTree.allNodeNumber())
print(mTree.allLeafNodeNumber())
print(mTree.nodeNumberOfLevel(level: 0))
print(mTree.nodeNumberOfLevel(level: 1))
print(mTree.nodeNumberOfLevel(level: 2))
print(mTree.nodeNumberOfLevel(level: 3))
print(mTree.nodeNumberOfLevel(level: 4))
print(mTree.nodeNumberOfLevel(level: 5))

print("")
print("preOrderTraversal")
mTree.preOrderTraversal()
print("")
print("midOrderTraversal")
mTree.midOrderTraversal()
print("")
print("lastOrderTraversal")
mTree.lastOrderTraversal()
print("")
print("BFS")
mTree.breadthFirstSearch()
print("")
print("DFS")
mTree.depthFirstSearch()

print("")
print("invertNode")
let retMTree = mTree.invertNode()
retMTree.breadthFirstSearch()

print("")
print("isNodeExisting")
let nodeH = Node(value: "H")
path = Array<Node>()
isExisting = mTree.isNodeExisting(node: nodeH, path: &path)
print("\(isExisting)")
for tmpNode: Node in path {
    tmpNode.visit()
}
