//
//  main.m
//  SortAlgorithm-OC
//
//  Created by Chris Hu on 16/11/9.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BubbleSort.h"
#import "QuickSort.h"

void testBubbleSort()
{
    NSMutableArray *mutableArray;
    NSArray *array = @[@3, @5, @2, @6, @2, @9, @1, @23, @12, @1, @7];
    //        static NSInteger kMaxNumber = 1000;
    //        for (NSInteger i=0; i<10; i++) {
    //            NSInteger tmp = arc4random() % kMaxNumber;
    //            [arr addObject:@(tmp)];
    //        }
    mutableArray = [NSMutableArray arrayWithArray:array];
    NSLog(@"%@", mutableArray);
    
    [BubbleSort bubbleSort:mutableArray];
    
    NSLog(@"bubbleSort: %@", mutableArray);
}

void testQuickSort()
{
    NSMutableArray *mutableArray;
    NSArray *array = @[@3, @5, @2, @6, @2, @9, @1, @23, @12, @1, @7];
    mutableArray = [NSMutableArray arrayWithArray:array];
    NSLog(@"%@", mutableArray);
    
    [QuickSort quickSort:mutableArray low:0 high:mutableArray.count-1];
    
    NSLog(@"quickSort: %@", mutableArray);
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
//        testBubbleSort();
        testQuickSort();
    }
    return 0;
}
