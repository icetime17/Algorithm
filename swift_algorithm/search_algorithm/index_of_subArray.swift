#!/usr/bin/swift

var array = [1,3,10,6,4,5,9,2,8,7]

var pattern = [4,5,9]

// array(indexOf: pattern) // 4

/*
extension Array {
    func indexOf(_ pattern: []) -> Int {

    }
}
*/

print(array.index(of: 10) as Any)
