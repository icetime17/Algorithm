//
//  MyNode.h
//  BinaryTree-OC
//
//  Created by Chris Hu on 16/11/9.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyNode : NSObject

@property (nonatomic, strong) NSString *nodeName;

@property (nonatomic, strong) MyNode *left;
@property (nonatomic, strong) MyNode *right;

@end


MyNode* aBinaryTree();

int getNodeNumber(MyNode *node);                    // 二叉树的结点个数
int nodeNumbersOfLeafs(MyNode *node);               // 返回叶子结点数
int nodeNumbersOfLevel(MyNode *node, int level);    // 返回第i层结点数

int getTreeDepth(MyNode *node);         // 二叉树的深度

void visitNode(MyNode *node);

void firstOrderTraverse(MyNode *node); // 前序遍历
void midOrderTraverse(MyNode *node);   // 中序遍历
void lastOrderTraverse(MyNode *node);  // 后序遍历

void depthFirstTraverse(MyNode *node);  // 深度优先遍历
void breadthFirstTraverse(MyNode *node);// 广度优先遍历
