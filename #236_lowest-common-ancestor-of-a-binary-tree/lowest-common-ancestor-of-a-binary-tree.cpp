/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
/**
https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree
Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
*/
class Solution {
private:
    typedef unordered_map<TreeNode*, pair<TreeNode*, int>> p_d_map;
    
    void insertMap( p_d_map &map, TreeNode* node ) {
        auto nextDepth = map[node].second + 1;
        if( node->left ) {
            map.insert( { node->left, { node, nextDepth } } );
            insertMap( map, node->left );
        }
        if( node->right ) {
            map.insert( { node->right, { node, nextDepth } } );
            insertMap( map, node->right );
        }
    }
    
public:
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        p_d_map map;
        this->insertMap( map, root );
        while( p != q ) {
            auto pPair = map[p], qPair = map[q];
            if( pPair.second == qPair.second ) {
                p = pPair.first;
                q = qPair.first;
            } else if( pPair.second > qPair.second ) {
                p = pPair.first;
            } else {
                q = qPair.first;
            }
        }
        
        return p;
    }
};
