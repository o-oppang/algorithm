class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let minVal = nums.min()!
        let decVal = (minVal < 0 ? minVal : 0)
        var numsDic = [Int:Int]()
        for (index, val) in nums.enumerated() {
            numsDic[index] = val
        }
        let sortedNums = numsDic.filter {
            $0.value <= target - decVal
        }.sorted {
            $0.value < $1.value   
        }
        for (index0, value0) in sortedNums.reversed() {
            let findVal = target - value0
            let findIndex = sortedNums.firstIndex { (index, value) in
                return value == findVal
            }
            if let findIndexUnwrapped = findIndex {
                return [sortedNums[findIndexUnwrapped].key, index0]
            }
            
        }
        preconditionFailure()
        return[0, 1]
    }
}
// 76 ms	22.9 MB
