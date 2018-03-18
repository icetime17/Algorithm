#!/usr/bin/python
# -*- coding: utf-8 -*-

import swap_T

def selection_sort(list):
    if len(list) <= 1:
        return list

    result = list
    for i in xrange(len(result)):
        lowest = i
        for j in xrange(i+1, len(result)):
            if result[j] < result[lowest]:
                lowest = j

        if i != lowest:
            swap_T.swap_T(result, i, lowest)

    return result

if __name__ == '__main__':
    list = [1,3,5,6,2,7,4,8,9]
    print(list)
    selection_sort(list)
    print(list)
