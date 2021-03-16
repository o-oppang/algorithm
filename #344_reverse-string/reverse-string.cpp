/**
discuss : https://leetcode.com/problems/reverse-string/discuss/1111683/c-two-lines-solution-without-using-stack-variables-8-ms-9995-231-mb-9388
https://leetcode.com/problems/reverse-string/
Write a function that reverses a string. The input string is given as an array of characters char[].
Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
You may assume all the characters consist of printable ascii characters.
*/
class Solution {
public:
    void reverseString(vector<char>& s) {
        for( auto i = 0; i < s.size() / 2.0 ; ++i )
            swap( s[i], s[s.size() - i - 1] );
    }
};
