//
//  MergeSort.swift
//  Sort
//
//  Created by zhaoyang on 2020/9/1.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import UIKit
// 时间复杂度  O(nlogn)  最好、最坏、平均
// 空间复杂度  O(n+logn)
// 稳定算法
class MergeSort: NSObject {
    class func MergeSort(array: [Int]) -> [Int] {
        let sort = MSort(array: array)
        return sort
    }
    
    class func MergeSort2(array: [Int]) -> [Int] {
        let sort = MSort2(array: array)
        return sort
    }
    
    // 递归解法
    private class func MSort(array: [Int]) -> [Int] {
        if array.count <= 1 {
            return array
        }
        let m = array.count/2
        let leftArray = MSort(array: Array(array[0..<m]))
        let rightArray = MSort(array: Array(array[m..<array.count]))
        return Merge(leftArray: leftArray, rightArray: rightArray)
    }
    
    // leftArray, rightArray 都是排好序的 
    private class func Merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
        var i = 0
        var j = 0
        var mArray = [Int]()
        while i < leftArray.count && j < rightArray.count {
            if leftArray[i] < rightArray[j] {
                mArray.append(leftArray[i])
                i+=1
            } else {
                mArray.append(rightArray[j])
                j+=1
            }
        }
        while i < leftArray.count {
            mArray.append(leftArray[i])
            i+=1
        }
        while j < rightArray.count {
            mArray.append(rightArray[j])
            j+=1
        }
        return mArray
    }
    
    
    
    // 迭代解法
    private class func MSort2(array: [Int]) -> [Int] {
        if array.count <= 1 {
            return array
        }
        var k = 1;
        var sortArray = array
        while k < sortArray.count {
            _ = MergePass(array: &sortArray, space: k)
            k*=2
        }
        return sortArray
    }
    
    private class func MergePass(array: inout [Int], space: Int) {
        var i = 0 // 虚拟分组起始下标
        while i <= array.count-array.count%(2*space)-1 {  // 剩下  array.count%(2*space)
            let min = i
            let max = i+2*space-1
            Merge2(array: &array, start: min, middle: (min+max)/2, end: max)
            i+=2*space
        }
        
        if 2*space > array.count {
            Merge2(array: &array, start: 0, middle: space-1, end: array.count-1)
        } else if array.count%(2*space) != 0 {
            let middle = array.count-array.count%(2*space)-1
            let min = middle-2*space+1
            Merge2(array: &array, start: min, middle: middle, end: array.count-1)
        } 
    }
    
    
    private class func Merge2(array: inout [Int], start: Int, middle: Int, end: Int){
        var index = start
        let leftArray = Array(array[start...middle])
        let rightArray = Array(array[middle+1...end])
        var i = 0
        var j = 0
        while i < leftArray.count && j < rightArray.count {
            if leftArray[i] < rightArray[j] {
                array[index] = leftArray[i]
                i+=1
            } else {
                array[index] = rightArray[j]
                j+=1
            }
            index+=1
        }
        while i < leftArray.count {
            array[index] = leftArray[i]
            i+=1
            index+=1
        }
        while j < rightArray.count {
            array[index] = rightArray[j]
            j+=1
            index+=1
        }
    }
    
}
