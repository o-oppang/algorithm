/**
https://leetcode.com/problems/minimum-path-sum/
Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.
Note: You can only move either down or right at any point in time.
*/

class Solution {
public:
    int minPathSum(vector<vector<int>>& grid) {
        auto height = grid.size();
        auto width = height > 0 ? grid[0].size() : 0;
        auto weightLine = vector<int>(width, INT_MAX);
        weightLine[0] = 0;
        for( auto y = 0; y < height; ++y ) {
            weightLine[0] += grid[y][0];
            for( auto x = 1; x < width; ++x )
                weightLine[x] = min( weightLine[x - 1], weightLine[x] ) + grid[y][x];
        }
        return weightLine[width - 1];
    }
};
