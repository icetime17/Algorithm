#!/usr/bin/swift

/**
Given an absolute path for a file (Unix-style), simplify it.
For example,
path = "/home/", => "/home"
path = "/a/./b/../../c/", => "/c"
*/

/**
利用Stack结构的push/pop操作的特点
*/
func absolute_path(_ path: String) -> String {
    var stack = [String]()

    for tmp in path.split(separator: "/") {
        if tmp == "." {
            continue
        }

        if tmp == ".." {
            if stack.count > 0 {
                stack.removeLast()
            }
            continue
        }

        stack.append(String(tmp))
    }

    return "/" + stack.joined(separator: "/")
}

var path = "/home/"
print(absolute_path(path))
path = "/a/./b/../../c/"
print(absolute_path(path))
