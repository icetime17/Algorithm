#!/usr/bin/swift

// 检查(), [], {}的用法是否有误

func check_valid_mark(_ string: String) -> Bool {
    var stack = [String]()

    for c in string {
        let s = String(c)
        if ["(", "[", "{"].contains(s) {
            stack.append(s)
        } else if [")", "]", "}"].contains(s) {
            if let last = stack.last {
                if last == "(" && s == ")" ||
                    last == "[" && s == "]" ||
                    last == "{" && s == "}"
                {
                    stack.removeLast()
                }
            } else {
                return false
            }
        }
    }

    return stack.isEmpty
}

print(check_valid_mark(""))
print(check_valid_mark("(1,2,3), [1,2,3], {1,2,3}"))
print(check_valid_mark("(1,2,3), [1,2,3], {1,2,3"))
