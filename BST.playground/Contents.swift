//: Playground - noun: a place where people can play

import UIKit

class TreeNode {
    let value: Int
    var parent: TreeNode?
    var left: TreeNode?
    var right: TreeNode?

    init(value: Int, parent: TreeNode? = nil) {
        self.value = value
        self.parent = parent
    }
        
    func createTreeFrom(sortedArray array: [Int]) -> TreeNode {
        if array.count == 0 {
            return
        }
        
        let midElement = array[array.count / 2]
        let rootNode = TreeNode(value: midElement)
        
        rootNode.createTree(array: array, min: <#T##Int#>, max: <#T##Int#>)
    }
    
    func createTree(array: [Int], min: Int, max: Int) -> TreeNode? {
        
    }
    
    @discardableResult func insert(_ value: Int) -> TreeNode? {
        // go right
        if value > self.value {
            if let rightNode = self.right {
                rightNode.insert(value)
            }
            
            let newNode = TreeNode(value: value, parent: self)
            self.right = newNode
            
            return newNode
        }
        // go left
        else {
            if let leftNode = self.left {
                leftNode.insert(value)
            }
            
            let newNode = TreeNode(value: value, parent: self)
            self.left = newNode
            
            return newNode        
        }
    }
}
