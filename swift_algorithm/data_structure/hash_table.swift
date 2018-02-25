#!/usr/bin/swift

let desc = ">>>>>>>>>> Hash Table的关键在于key值遵循Hashable协议. \n 另外, 采用key-value的存储方式来避免根据key值计算的index出现collisions."

public struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]

    // 可能存在collisions(不同key的hashValue得到的index相等)
    // 所以, 每个index对应的Element不止一个. (也使用数组Bucket存储)
    private var buckets: [Bucket]

    // 用于记录buckets中的元素个数(而非每个Bucket中的Element个数)
    private(set) public var count = 0

    public var isEmpty: Bool { return count == 0 }

    public init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }

    public func value(forKey key: Key) -> Value? {
        let index = p_index(forKey: key)
        // 可能存在collisions而导致不同key的hashValue得到的index相等
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }

    /**
        考虑已存在的情况
    */
    @discardableResult
    public mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = p_index(forKey: key)

        for (idx, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][idx].value = value
                return oldValue
            }
        }

        buckets[index].append((key: key, value: value))
        count = count + 1

        return nil
    }

    @discardableResult
    public mutating func removeValue(forKey key: Key) -> Value? {
        let index = p_index(forKey: key)

        for (idx, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: idx)
                count = count - 1
                return element.value
            }
        }

        return nil
    }

    public mutating func removeAll() {
        buckets = Array<Bucket>(repeatElement([], count: buckets.count))
        count = 0
    }

    // 利用Swift的subscript
    public subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                updateValue(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }

    // 根据Hashable协议, 每个key可以算出一个hashValue, 对应一个index(可能是多对一的关系)
    private func p_index(forKey key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }
}



//////////////////////////////////////////////////

print(desc)

var hashTable = HashTable<String, String>(capacity: 10)
print(hashTable)

print("")

hashTable.updateValue("Xiamen", forKey: "Chris")
hashTable.updateValue("Xiamen", forKey: "River")
hashTable.updateValue("Xiamen", forKey: "Stream")

print(hashTable)
print(hashTable.count)

print(hashTable.value(forKey: "Chris") as Any)
print(hashTable.value(forKey: "River") as Any)
print(hashTable.value(forKey: "Stream") as Any)
print(hashTable.value(forKey: "None") as Any)

print("")

hashTable.updateValue("Shanghai", forKey: "Chris")
hashTable.updateValue("Shanghai", forKey: "River")
hashTable.updateValue("Shanghai", forKey: "Stream")

print(hashTable)
print(hashTable.count)

print(hashTable.value(forKey: "Chris") as Any)
print(hashTable.value(forKey: "River") as Any)
print(hashTable.value(forKey: "Stream") as Any)
print(hashTable.value(forKey: "None") as Any)

print("")

hashTable.removeValue(forKey: "Chris")
hashTable.removeValue(forKey: "River")

print(hashTable)
print(hashTable.count)

print(hashTable.value(forKey: "Chris") as Any)
print(hashTable.value(forKey: "River") as Any)
print(hashTable.value(forKey: "Stream") as Any)
print(hashTable.value(forKey: "None") as Any)

print("")

hashTable.removeAll()

print(hashTable)
print(hashTable.count)

print(hashTable.value(forKey: "Chris") as Any)
print(hashTable.value(forKey: "River") as Any)
print(hashTable.value(forKey: "Stream") as Any)
print(hashTable.value(forKey: "None") as Any)

print("")

hashTable["Chris"] = "Shanghai"
hashTable["River"] = "Shanghai"
hashTable["Stream"] = "Shanghai"
hashTable["None"] = nil

print(hashTable)
print(hashTable.count)

print(hashTable["Chris"] as Any)
print(hashTable["River"] as Any)
print(hashTable["Stream"] as Any)
print(hashTable["None"] as Any)
