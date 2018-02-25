#!/usr/bin/swift

/**
Given an input string, reverse the string word by word.
A word is defined as a sequence of non-space characters.
The input string does not contain leading or trailing spaces and the words are always separated by a single space.
For example,
Given s = "the sky is blue",
return "blue is sky the".
Could you do it in-place without allocating extra space?
*/

func swap_T<T>(array: inout [T], i: Int, j: Int) {
    if i < 0 || j < 0 {
        return
    }

    if array.count <= i ||
       array.count <= j {
        return
    }

    let tmp = array[i]
    array[i] = array[j]
    array[j] = tmp
}

func reverse_word(_ word: String) -> String {
    var array = Array(word)
    
    var begin = 0
    var end = array.count - 1
    while begin < end {
        swap_T(array: &array, i: begin, j: end)
        end = end - 1
        begin = begin + 1
    }

    return String(array)
}

// 时间复杂度为O(n)
func reverse_string(_ string: String) -> String {
    var array = string.split(separator: " ")

    var begin = 0
    var end = array.count - 1
    while begin < end {
        swap_T(array: &array, i: begin, j: end)
        end = end - 1
        begin = begin + 1
    }

    return array.joined(separator: " ")
}

func reverse_string_by_word(_ string: String) -> String {
    let array = string.split(separator: " ")

    var ret = [String]()
    for word in array {
        let tmp = reverse_word(String(word))
        ret.append(tmp)
    }

    return ret.joined(separator: " ")
}

var word = "hello"
print(word)
print(reverse_word(word))
print("")
var string = "the sky is blue"
print(string)
print(reverse_string(string))
print(reverse_string_by_word(string))
