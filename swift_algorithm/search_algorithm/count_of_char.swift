#!/usr/bin/swift

// "aaaabbbcca" => "a4b3c2a1"

func countOfChar(string: String) -> String {
    var ret = ""

    var curChar: Character
    var curCharCount = 0

    for c in Array(string) {
        curChar = c

        if let lastChar = ret.last {
            if lastChar == curChar {
                curCharCount = curCharCount + 1
            } else {
                ret.append("\(curCharCount)")

                // 开始新的字符
                ret.append(curChar)
                curCharCount = 1
            }
        } else {
            ret.append(curChar)
            curCharCount = curCharCount + 1
        }
    }
    ret.append("\(curCharCount)")

    return ret
}

print(countOfChar(string: "a"))
print(countOfChar(string: "aa"))
print(countOfChar(string: "ab"))
print(countOfChar(string: "aaaabbbcca"))
