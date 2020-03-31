class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict: [Int: Int] = [:]
    for (idx, num) in nums.enumerated() {
        let complement = target - num
        if let complementIdx = dict[complement] {
            return [idx, complementIdx]
        }
        dict[num] = idx
    }
    
    fatalError() // each input would have exactly one solution
    }
}

class Solution {
  enum Res: Error { case pair(Int, Int) }
  
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    do {
      let _ = try nums.enumerated().reduce(into: [Int:Int]()) {
        if $0[target - $1.1] != nil { 
          throw Res.pair($1.0, $0[target - $1.1]!)
        } else { $0[$1.1] = $1.0 }
      }
    } catch let Res.pair(i, j) { return [i, j] } catch {}
    return []
  }
}

// 36 ms	21.3 MB
