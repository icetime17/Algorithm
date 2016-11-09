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
    
    MyNode *nodeA1 = [[MyNode alloc] init];
    nodeA1.nodeName = @"A1";
    
    MyNode *nodeA2 = [[MyNode alloc] init];
    nodeA2.nodeName = @"A2";
    
    nodeA.left = nodeA1;
    nodeA.right= nodeA2;
    
    
    MyNode *nodeB = [[MyNode alloc] init];
    nodeB.nodeName = @"B";
    
    MyNode *nodeB1 = [[MyNode alloc] init];
    nodeB1.nodeName = @"B1";
    
    MyNode *nodeB2 = [[MyNode alloc] init];
    nodeB2.nodeName = @"B2";
    
    nodeB.left = nodeB1;
    nodeB.right= nodeB2;
    
    
    MyNode *nodeC = [[MyNode alloc] init];
    nodeC.nodeName = @"C";
    
    MyNode *nodeC1 = [[MyNode alloc] init];
    nodeC1.nodeName = @"C1";
    
    MyNode *nodeC2 = [[MyNode alloc] init];
    nodeC2.nodeName = @"C2";
    
    nodeC.left = nodeC1;
    nodeC.right= nodeC2;
    
    
    nodeA1.left = nodeB;
    nodeA2.right= nodeC;
    
    return nodeA;
}

void visitNode(MyNode *node)
{
    NSLog(@"%@", node.nodeName);
}

void firstOrderEnumerate(MyNode *node)
{
    visitNode(node);
    
    if (node.left) { firstOrderEnumerate(node.left); }
    
    if (node.right) { firstOrderEnumerate(node.right); }
}

void midOrderEnumerate(MyNode *node)
{
    if (node.left) { midOrderEnumerate(node.left); }
    
    visitNode(node);
    
    if (node.right) { midOrderEnumerate(node.right); }
}

void lastOrderEnumerate(MyNode *node)
{
    if (node.left) { lastOrderEnumerate(node.left); }
    
    if (node.right) { lastOrderEnumerate(node.right); }
    
    visitNode(node);
}

int getNodeNumber(MyNode *node)
{
    if (node == NULL) {
        return 0;
    }
    return getNodeNumber(node.left) + getNodeNumber(node.right) + 1;
}

int getDepth(MyNode *node)
{
    if (node == NULL) {
        return 0;
    }
    return (getDepth(node.left) ?: getDepth(node.right))+ 1;
}

void depthFirstTraverse(MyNode *node)
{
    // 栈结构
    NSMutableArray *arr = [NSMutableArray array];
    [arr insertObject:node atIndex:0];
    
    while (arr.count>0) {
        MyNode *currentNode = [arr firstObject];
        NSLog(@"%@", currentNode.nodeName); // 从栈顶开始
        
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
    // 队列结构
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:node];
    
    while (arr.count>0) {
        MyNode *currentNode = [arr firstObject];
        NSLog(@"%@", currentNode.nodeName); // 从队列头开始
        
        [arr removeObjectAtIndex:0];
        
        if (currentNode.left) {
            [arr addObject:currentNode.left];
        }
        
        if (currentNode.right) {
            [arr addObject:currentNode.right];
        }
    }    
}

