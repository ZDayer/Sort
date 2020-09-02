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
//        print(array)
        let sort = MSort(array: array)
//        print(sort)
        return sort
    }
    
    
    // 递归解法
    private class func MSort(array: [Int]) -> [Int] {
        if array.count == 1 {
            return array
        }
        let m = array.count/2
        let leftArray = MSort(array: Array(array[0..<m]))
        let rightArray = MSort(array: Array(array[m..<array.count]))
        return Merge(leftArray: leftArray, rightArray: rightArray)
    }
    
    
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
}
