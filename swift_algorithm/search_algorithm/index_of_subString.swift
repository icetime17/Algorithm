#!/usr/bin/swift

extension String {
  func indexOf(_ pattern: String) -> String.Index? {
    for i in self.indices {
        var j = i
        var found = true
        for p in pattern.indices{
            if j == self.endIndex || self[j] != pattern[p] {
                found = false
                break
            } else {
                j = self.index(after: j)
            }
        }
        if found {
            return i
        }
    }
    return nil
  }
}

var string = "hello world!"
print(string.indexOf("world") as Any)
