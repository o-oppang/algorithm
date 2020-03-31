class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let minVal = nums.min()!
        let sortedNums = nums.filter { $0 <= target - (minVal < 0 ? minVal : 0) }.sorted(by: <)
        if sortedNums.count == 2 {
            return findIndex(source: nums, target: sortedNums)
        }
        for (index0, value0) in sortedNums.reversed().enumerated() {
            for (index1, value1) in sortedNums.enumerated() {
                if index0 == sortedNums.count - 1 - index1 {
                    break;
                }
                if value0 + value1 == target {
                    return findIndex(source: nums, target: [value0, value1]).sorted(by: <)
                }
            }
        }
        return[0, 1]
    }

    func findIndex(source: [Int], target: [Int]) -> [Int] {
        var retVal = [Int]()
        for num in target {
            guard let numUnwrapped = source.index(of:num) else { preconditionFailure() }
            retVal.append( numUnwrapped )
        }
        if( retVal[0] == retVal[1] ) {
            guard let reversedIndex: Int = source.reversed().index(of:target[1]) else { preconditionFailure() }
            retVal[1] = source.count - reversedIndex - 1
        }
        return retVal
    }
}
// 64 ms	21.9 MB
