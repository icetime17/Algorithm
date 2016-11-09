//
//  MyNode.m
//  BinaryTree-OC
//
//  Created by Chris Hu on 16/11/9.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "MyNode.h"

@implementation MyNode

@end


MyNode* aBinaryTree()
{
    MyNode *nodeA = [[MyNode alloc] init];
    nodeA.nodeName = @"A";
    MyNode *nodeB = [[MyNode alloc] init];
    nodeB.nodeName = @"B";
    MyNode *nodeC = [[MyNode alloc] init];
    nodeC.nodeName = @"C";
    MyNode *nodeD = [[MyNode alloc] init];
    nodeD.nodeName = @"D";
    MyNode *nodeE = [[MyNode alloc] init];
    nodeE.nodeName = @"E";
    MyNode *nodeF = [[MyNode alloc] init];
    nodeF.nodeName = @"F";
    MyNode *nodeG = [[MyNode alloc] init];
    nodeG.nodeName = @"G";
    MyNode *nodeH = [[MyNode alloc] init];
    nodeH.nodeName = @"H";
    MyNode *nodeI = [[MyNode alloc] init];
    nodeI.nodeName = @"I";
    MyNode *nodeJ = [[MyNode alloc] init];
    nodeJ.nodeName = @"J";
    MyNode *nodeK = [[MyNode alloc] init];
    nodeK.nodeName = @"K";
    MyNode *nodeL = [[MyNode alloc] init];
    nodeL.nodeName = @"L";
    MyNode *nodeM = [[MyNode alloc] init];
    nodeM.nodeName = @"M";
    MyNode *nodeN = [[MyNode alloc] init];
    nodeN.nodeName = @"N";
    MyNode *nodeO = [[MyNode alloc] init];
    nodeO.nodeName = @"O";
    
    nodeA.left = nodeB;
    nodeA.right= nodeC;

    nodeB.left = nodeD;
    nodeB.right= nodeE;
    
    nodeC.left = nodeF;
    nodeC.right= nodeG;
    
    nodeD.left = nodeH;
    nodeD.right= nodeI;
    
    nodeE.left = nodeJ;
    nodeE.right= nodeK;
    
    nodeF.left = nodeL;
    nodeF.right= nodeM;
    
    nodeG.left = nodeN;
    nodeG.right= nodeO;
    
    return nodeA;
}

int getNodeNumber(MyNode *node)
{
    if (node == NULL) {
        return 0;
    }
    return getNodeNumber(node.left) + getNodeNumber(node.right) + 1;
}

int getTreeDepth(MyNode *node)
{
    if (node == NULL) {
        return 0;
    }
    return (getTreeDepth(node.left) ?: getTreeDepth(node.right))+ 1;
}

void visitNode(MyNode *node)
{
    NSLog(@"%@", node.nodeName);
}

void firstOrderTraverse(MyNode *node)
{
    visitNode(node);
    
    if (node.left) { firstOrderTraverse(node.left); }
    
    if (node.right) { firstOrderTraverse(node.right); }
}

void midOrderTraverse(MyNode *node)
{
    if (node.left) { midOrderTraverse(node.left); }
    
    visitNode(node);
    
    if (node.right) { midOrderTraverse(node.right); }
}

void lastOrderTraverse(MyNode *node)
{
    if (node.left) { lastOrderTraverse(node.left); }
    
    if (node.right) { lastOrderTraverse(node.right); }
    
    visitNode(node);
}

void depthFirstTraverse(MyNode *node)
{
    NSLog(@"\n");
    NSLog(@"DFS :");
    
    // 栈结构
    NSMutableArray *arr = [NSMutableArray array];
    [arr insertObject:node atIndex:0];
    
    while (arr.count>0) {
        MyNode *currentNode = [arr firstObject];
        visitNode(currentNode); // 从栈顶开始
        
        [arr removeObjectAtIndex:0];
        
        if (currentNode.right) {
            [arr insertObject:currentNode.right atIndex:0];
        }
        if (currentNode.left) {
            [arr insertObject:currentNode.left atIndex:0];
        }
    }
}

void breadthFirstTraverse(MyNode *node)
{
    NSLog(@"\n");
    NSLog(@"BFS :");
    
    // 队列结构
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:node];
    
    while (arr.count>0) {
        MyNode *currentNode = [arr firstObject];
        visitNode(currentNode); // 从队列头开始
        
        [arr removeObjectAtIndex:0];
        
        if (currentNode.left) {
            [arr addObject:currentNode.left];
        }
        
        if (currentNode.right) {
            [arr addObject:currentNode.right];
        }
    }    
}

