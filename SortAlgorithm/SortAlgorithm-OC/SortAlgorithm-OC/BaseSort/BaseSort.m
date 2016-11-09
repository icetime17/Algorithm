//
//  BaseSort.m
//  SortAlgorithm-OC
//
//  Created by Chris Hu on 16/11/9.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "BaseSort.h"

@implementation BaseSort

+ (void)swap:(NSMutableArray *)arr a:(NSInteger)a b:(NSInteger)b
{
    NSNumber *tmp = arr[b];
    arr[b] = arr[a];
    arr[a] = tmp;
}

@end
