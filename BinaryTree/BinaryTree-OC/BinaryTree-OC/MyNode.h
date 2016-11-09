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

void visitNode(MyNode *node);

void firstOrderEnumerate(MyNode *node);
void midOrderEnumerate(MyNode *node);
void lastOrderEnumerate(MyNode *node);
