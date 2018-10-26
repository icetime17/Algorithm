#!/usr/bin/swift

func isRoundString(_ str: String) -> Bool {
    print(str)
    if str.count <= 1 {
        return true
    }

    let startIndex = str.startIndex
    for i in 0..<str.count-1 {
      let leftIndex = str.index(startIndex, offsetBy: i)
      let rightIndex = str.index(startIndex, offsetBy: str.count-1-i)
      if leftIndex < rightIndex {
          if str[leftIndex] != str[rightIndex] {
              return false
          }
      } else {
          break
      }
    }
    return true
}

print(isRoundString("1"))
print(isRoundString("122"))
print(isRoundString("1221"))
print(isRoundString("12321"))
