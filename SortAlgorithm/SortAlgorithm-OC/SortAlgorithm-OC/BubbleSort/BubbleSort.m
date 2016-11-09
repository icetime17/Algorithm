//
//  BubbleSort.m
//  SortAlgorithm-OC
//
//  Created by Chris Hu on 16/11/9.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "BubbleSort.h"

@implementation BubbleSort

+ (void)bubbleSort:(NSMutableArray *)arr
{
    for (NSInteger i=0; i<arr.count; i++) {
        for (NSInteger j=0; j<arr.count-1-i; j++) {
            if ([arr[j] integerValue] > [arr[j+1] integerValue]) {
                [super swap:arr a:j b:j+1];
            }
        }
    }
}

@end
