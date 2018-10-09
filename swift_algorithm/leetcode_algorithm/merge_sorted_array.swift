#!/usr/bin/swift

func merge_sorted_array(_ a: [Int], _ b: [Int]) -> [Int] {
    var ret = [Int]()

    let p = min(a.count, b.count)
    for i in 0..<p {
      // wrong !!!
      if a[i] <= b[i] {
        ret.append(a[i])
        ret.append(b[i])
      } else {
        ret.append(b[i])
        ret.append(a[i])
      }
    }

    if p < a.count {
      for i in p..<a.count {
        ret.append(a[i])
      }
    }

    if p < b.count {
      for j in p..<b.count {
        ret.append(b[j])
      }
    }

    return ret
}

let a = [1,4,6]
let b = [2,3,5,7,8,9]

let c = merge_sorted_array(a, b)
print(c)

let c_2 = merge_sorted_array([7,8,9], [1,2,3,4,5,6])
print(c_2)


func merge_sorted_array_v2(_ a: [Int], _ b: [Int]) -> [Int] {
    var ret = [Int]()

    var p = 0
    var q = 0

    while p < a.count && q < b.count {
        if a[p] <= b[q] {
            ret.append(a[p])
            p += 1
        } else {
          ret.append(b[q])
          q += 1
        }
    }

    while p < a.count {
        ret.append(a[p])
        p += 1
    }

    while q < b.count {
      ret.append(b[q])
      q += 1
    }

    return ret
}

let d = merge_sorted_array_v2(a, b)
print(d)

let d_2 = merge_sorted_array_v2([7,8,9], [1,2,3,4,5,6])
print(d_2)
