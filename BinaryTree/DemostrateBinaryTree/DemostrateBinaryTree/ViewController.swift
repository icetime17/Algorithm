//
//  ViewController.swift
//  DemostrateBinaryTree
//
//  Created by Chris Hu on 16/11/21.
//  Copyright © 2016年 icetime17. All rights reserved.
//

import UIKit

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

fileprivate let kCellIdentifier = "kCellIdentifier"

class ViewController: UIViewController {

    var tableView: UITableView!
    
    var results = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let node = myTree()
        results = parseBinaryTree(node)
        
        initTableView()
    }

    func initTableView() {
        tableView = UITableView(frame: view.frame, style: .plain)
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: kCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController {
    // BFS
    func parseBinaryTree(_ node: Node) -> [String] {
        var ret = [String]()
        
        var nodes = [Node]()
        nodes.append(node)
        
        while !nodes.isEmpty {
            let currentNode = nodes.removeFirst()
            currentNode.visit()
            
            var str = "\(currentNode.nodeValue!) -> "
            
            if let lNode = currentNode.left {
                nodes.append(lNode)
                str += "\(lNode.nodeValue!)"
            } else {
                str += "#"
            }
            
            if let rNode = currentNode.right {
                nodes.append(rNode)
                str += " , \(rNode.nodeValue!)"
            } else {
                str += " , #"
            }
            
            ret.append(str)
        }
        
        return ret
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = results[indexPath.row]
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {

}
