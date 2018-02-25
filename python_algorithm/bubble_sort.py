#!/usr/bin/python
# -*- coding: utf-8 -*-

#
# bubble sort
# 时间复杂度都为 O(n^2)
# Best O(n^2); Average O(n^2); Worst O(n^2).
#

import swap_T

def bubble_sort(list):
    if len(list) <= 1:
        return list

    for i in xrange(len(list)):
        for j in xrange(len(list) - 1 - i):
            if list[j] > list[j+1]:
                swap_T.swap_T(list, j, j+1)


if __name__ == '__main__':
    list = [1,3,5,6,2]
    print(list)
    bubble_sort(list)
    print(list)
