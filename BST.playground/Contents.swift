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
    
    func createTree(array: [Int], min: Int, max: Int) -> TreeNode? {        
        if (min < max) {
            let midIndex = (max - min) / 2
            let midElement = array[midIndex]
            print("min: \(min)--max: \(max)")
            print("midEl: \(midElement)")
            
            let node = TreeNode(value: midElement, parent: self)
            node.left = createTree(array: array, min: 0, max: midIndex-1)
            node.right = createTree(array: array, min: midIndex+1, max: max)
            
            return node
        }
        else {
            print("finished")
            return nil
        }
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

func createTreeFrom(sortedArray array: [Int]) -> TreeNode? {
    if array.count == 0 {
        return nil
    }
    
    let midIndex = array.count / 2
    let midElement = array[midIndex]
    let rootNode = TreeNode(value: midElement)
    rootNode.left = rootNode.createTree(array: array, min: 0, max: midIndex-1)
    rootNode.right = rootNode.createTree(array: array, min: midIndex+1, max: array.count - 1)
    
    return rootNode
}

createTreeFrom(sortedArray: sortedArray)
