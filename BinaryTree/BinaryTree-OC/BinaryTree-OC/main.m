//
//  main.m
//  BinaryTree-OC
//
//  Created by Chris Hu on 16/11/9.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyNode.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        MyNode *nodeA = [[MyNode alloc] init];
        nodeA.nodeName = @"A";
        
        MyNode *nodeB = [[MyNode alloc] init];
        nodeB.nodeName = @"B";
        
        MyNode *nodeC = [[MyNode alloc] init];
        nodeC.nodeName = @"C";
        
        nodeA.left = nodeB;
        nodeA.right= nodeC;
        
        NSLog(@"firstOrderTraverse :\n");
        firstOrderTraverse(nodeA);
        NSLog(@"\n");
        NSLog(@"midOrderTraverse :\n");
        midOrderTraverse(nodeA);
        NSLog(@"\n");
        NSLog(@"lastOrderTraverse :\n");
        lastOrderTraverse(nodeA);
        NSLog(@"\n");
        
        NSLog(@"firstOrderTraverse :\n");
        MyNode *aTree = aBinaryTree();
        firstOrderTraverse(aTree);
        NSLog(@"\n");
        NSLog(@"midOrderTraverse :\n");
        midOrderTraverse(aTree);
        NSLog(@"\n");
        NSLog(@"lastOrderTraverse :\n");
        lastOrderTraverse(aTree);
        NSLog(@"\n");
        
        NSLog(@"getNodeNumber : %d", getNodeNumber(nodeA));
        NSLog(@"getNodeNumber : %d", getNodeNumber(aTree));
        NSLog(@"\n");
        
        NSLog(@"getTreeDepth : %d", getTreeDepth(nodeA));
        NSLog(@"getTreeDepth : %d", getTreeDepth(aTree));
        NSLog(@"\n");
        
        breadthFirstTraverse(nodeA);
        breadthFirstTraverse(aTree);
        
        depthFirstTraverse(nodeA);
        depthFirstTraverse(aTree);
        NSLog(@"\n");
        
        NSLog(@"nodeNumbersOfLeafs : %d", nodeNumbersOfLeafs(nodeA));
        NSLog(@"nodeNumbersOfLeafs : %d", nodeNumbersOfLeafs(aTree));
        
        NSLog(@"nodeNumbersOfLevel : %d", nodeNumbersOfLevel(nodeA, 0));
        NSLog(@"nodeNumbersOfLevel : %d", nodeNumbersOfLevel(nodeA, 1));
        NSLog(@"nodeNumbersOfLevel : %d", nodeNumbersOfLevel(nodeA, 2));
        NSLog(@"nodeNumbersOfLevel : %d", nodeNumbersOfLevel(nodeA, 3));
        NSLog(@"nodeNumbersOfLevel : %d", nodeNumbersOfLevel(nodeA, 4));
        
        NSLog(@"nodeNumbersOfLevel : %d", nodeNumbersOfLevel(aTree, 0));
        NSLog(@"nodeNumbersOfLevel : %d", nodeNumbersOfLevel(aTree, 1));
        NSLog(@"nodeNumbersOfLevel : %d", nodeNumbersOfLevel(aTree, 2));
        NSLog(@"nodeNumbersOfLevel : %d", nodeNumbersOfLevel(aTree, 3));
        NSLog(@"nodeNumbersOfLevel : %d", nodeNumbersOfLevel(aTree, 4));
        NSLog(@"nodeNumbersOfLevel : %d", nodeNumbersOfLevel(aTree, 5));
        NSLog(@"\n");
        
        NSMutableArray *path = pathOfNodeInTree(nodeB, nodeA);
        for (MyNode *node in path) {
            visitNode(node);
        }
        NSLog(@"\n");
        
        MyNode *O = aTree.right.right.right;
        path = pathOfNodeInTree(O, aTree);
        for (MyNode *node in path) {
            visitNode(node);
        }
        NSLog(@"\n");
        
        path = pathOfNodeInTree(nodeA, aTree);
        for (MyNode *node in path) {
            visitNode(node);
        }
        NSLog(@"\n");
        
        NSLog(@"midOrderTraverse :\n");
        midOrderTraverse(nodeA);
        invertTree(nodeA);
        NSLog(@"midOrderTraverse :\n");
        midOrderTraverse(nodeA);
        NSLog(@"\n");
        
        NSLog(@"midOrderTraverse :\n");
        midOrderTraverse(aTree);
        invertTree(aTree);
        NSLog(@"midOrderTraverse :\n");
        midOrderTraverse(aTree);
        NSLog(@"\n");
    }
    return 0;
}


