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
        
        firstOrderEnumerate(nodeA);
        NSLog(@"\n");
        midOrderEnumerate(nodeA);
        NSLog(@"\n");
        lastOrderEnumerate(nodeA);
        NSLog(@"\n");
        
        MyNode *aTree = aBinaryTree();
        firstOrderEnumerate(aTree);
        NSLog(@"\n");
        midOrderEnumerate(aTree);
        NSLog(@"\n");
        lastOrderEnumerate(aTree);
        NSLog(@"\n");
        
        NSLog(@"%d", getNodeNumber(nodeA));
        NSLog(@"%d", getNodeNumber(aTree));
        
        NSLog(@"%d", getDepth(nodeA));
        NSLog(@"%d", getDepth(aTree));
        
        
    }
    return 0;
}


