#!/usr/bin/python
# -*- coding: utf-8 -*-

import swap_T

def selection_sort(list):
    if len(list) <= 1:
        return list

    result = list
    for i in xrange(len(result)):
        # 寻找[i,n]区间内的最小值
        lowest = i
        for j in xrange(i+1, len(result)):
            if result[j] < result[lowest]:
                lowest = j
        # 寻找[i,n]区间内的最小值

        if i != lowest:
            swap_T.swap_T(result, i, lowest)
            print result

    return result

if __name__ == '__main__':
    list = [1,3,10,6,4,5,9,2,8,7]
    print(list)
    selection_sort(list)
    print(list)
