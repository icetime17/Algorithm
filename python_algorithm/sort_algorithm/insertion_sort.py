#!/usr/bin/python
# -*- coding: utf-8 -*-

import swap_T

def insertion_sort(list):
    if len(list) <= 1:
        return list

    result = list

    for i in xrange(1, len(list)):
        j = i
        while j > 0 and result[j] < result[j-1]:
            swap_T.swap_T(result, j, j-1)
            j -= 1

if __name__ == '__main__':
    list = [1,3,5,6,2,7,4,8,9]
    print(list)
    insertion_sort(list)
    print(list)
