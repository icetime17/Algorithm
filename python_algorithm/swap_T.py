#!/usr/bin/python

def swap_T(list, i, j):
    if list.count <= i or list.count <= j:
        pass

    tmp = list[i];
    list[i] = list[j]
    list[j] = tmp

if __name__ == '__main__':
    list = [1,2]
    print(list)
    swap_T(list,0,1)
    print(list)
