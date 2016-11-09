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
    }
    return 0;
}


