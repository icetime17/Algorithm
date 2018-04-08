#!/usr/bin/python
# -*- coding: utf-8 -*-

import swap_T

def insertion_sort(list):
    if len(list) <= 1:
        return list

    result = list

    for i in xrange(1, len(result)):
        # 取出一个元素list[i], 将list[i]放到它的正确位置, (而该元素的原始位置是在要比较的数组的最右侧)
        j = i
        # while j > 0 说明最后一次比较的是result[1]与result[0]
        # result[j] < result[j-1] 说明插入排序可能提前结束, 因此比选择排序效率高一些
        while j > 0 and result[j] < result[j-1]:
            swap_T.swap_T(result, j, j-1)
            print result
            j -= 1
        # 取出一个元素list[i], 将list[i]放到它的正确位置

def insertion_sort_1(list):
    if len(list) <= 1:
        return list

    result = list

    for i in xrange(1, len(result)):

        target = result[i]
        j = i
        while j > 0 and target < result[j - 1]:
            result[j] = result[j - 1]
            j -= 1
        result[j] = target


if __name__ == '__main__':
    list = [1,3,5,6,2,7,4,8,9]
    print(list)
    insertion_sort(list)
    print(list)
    print('')
    list = [1,3,5,6,2,7,4,8,9]
    print(list)
    insertion_sort_1(list)
    print(list)
