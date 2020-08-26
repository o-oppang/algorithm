// Given an array nums of n integers, are there elements 
// a, b, c in nums such that a + b + c = 0? Find all unique triplets
// in the array which gives the sum of zero.

class Solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
    	auto uniqueNums = nums.erase(unique(nums.begin(),nums.end()),nums.end());
    	return {uniqueNums};
        vector<vector<int>> triplets;
        map<int, int> nummap;
    	for(auto i = nums.begin(); i < nums.end(); ++i)
    	{
    		for( auto j = i + 1; j < nums.end(); j++ )
    		{
    			auto sum = *i + *j;
    			auto third = nummap.find( -sum );

    			if( third == nil ) {
    				nummap.insert( *j, 0 );
    			} else {
    				vector<int> triplet = { *i, *j, *it };
                    // sort(triplet.begin(), triplet.end());
    				triplets.push_back( triplet );
    			}
    		}
    	}
    	return triplets;
    }
};