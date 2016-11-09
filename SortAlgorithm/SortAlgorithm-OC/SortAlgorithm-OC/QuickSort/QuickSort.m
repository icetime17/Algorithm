//
//  QuickSort.m
//  SortAlgorithm-OC
//
//  Created by Chris Hu on 16/11/9.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

+ (NSInteger)partition:(NSMutableArray *)arr low:(NSInteger)low high:(NSInteger)high
{
    NSNumber *base = arr[low];
    
    while (low < high) {
        while (low < high && [arr[high] integerValue] >= [base integerValue]) {
            high--;
        }
//        [super swap:arr a:low b:high];
        [arr exchangeObjectAtIndex:low withObjectAtIndex:high];
        
        while (low < high && [arr[low] integerValue] <= [base integerValue]) {
            low++;
        }
//        [super swap:arr a:low b:high];
        [arr exchangeObjectAtIndex:low withObjectAtIndex:high];
    }
    return low;
}

+ (void)quickSort:(NSMutableArray *)arr low:(NSInteger)low high:(NSInteger)high
{
    if (low < high) {
        NSInteger division = [self partition:arr low:low high:high];
        [self quickSort:arr low:low high:division-1];
        [self quickSort:arr low:division+1 high:high];
    }
}

@end
