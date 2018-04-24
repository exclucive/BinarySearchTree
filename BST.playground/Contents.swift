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
    
    class func createTree(array: [Int], start: Int, end: Int) -> TreeNode? {
        guard start <= end else {
            print("finished")
            return nil
        }
        
        let midIndex = (start + end) / 2
        let midElement = array[midIndex]
        
        let node = TreeNode(value: midElement)
        node.left = createTree(array: array, start: start, end: midIndex-1)
        node.right = createTree(array: array, start: midIndex+1, end: end)
        
        return node
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

let sortedArray = [1, 2, 3, 4, 5, 6, 7]
let root = TreeNode.createTree(array: sortedArray, start: 0, end: sortedArray.count - 1)
