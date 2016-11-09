//
//  QuickSort.h
//  SortAlgorithm-OC
//
//  Created by Chris Hu on 16/11/9.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "BaseSort.h"

@interface QuickSort : BaseSort

+ (void)quickSort:(NSMutableArray *)arr low:(NSInteger)low high:(NSInteger)high;

@end
