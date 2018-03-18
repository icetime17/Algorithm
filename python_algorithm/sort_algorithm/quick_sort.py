#!/usr/bin/python
# -*- coding: utf-8 -*-

#
# quick sort
#

import swap_T

def quick_sort(list):
    if len(list) <= 1:
        return list

    left = []
    equal = []
    right = []

    pivot = list[len(list) / 2]
    for value in list:
        if value < pivot:
            left.append(value)
        elif value == pivot:
            equal.append(value)
        else:
            right.append(value)

    return quick_sort(left) + equal + quick_sort(right)

def quick_sort_partition(list, low, high):
    if low >= high:
        return

    def partition(list, low, high):
        pivot = list[low]

        i = low
        j = high

        while i < j:
            while i < j and list[j] >= pivot:
                j -= 1
            swap_T.swap_T(list,i,j)

            while i < j and list[i] <= pivot:
                i += 1
            swap_T.swap_T(list,i,j)

        return i

    pivot = partition(list, low, high)
    quick_sort_partition(list, low, pivot-1)
    quick_sort_partition(list, pivot+1, high)

if __name__ == '__main__':
    list = [1,3,5,6,2,7,4,8,9]
    print(list)
    list = quick_sort(list)
    print(list)

    print("")

    list = [1,3,5,6,2,7,4,8,9]
    print(list)
    quick_sort_partition(list,0,len(list)-1)
    print(list)
