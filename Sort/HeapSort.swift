//
//  HeapSort.swift
//  Sort
//
//  Created by zhaoyang on 2020/8/31.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import UIKit
// 时间复杂度 O(nlogn)  最好, 最坏, 平均 都是
// 不稳定的排序
// 不适合排序个数较少的情况
class HeapSort: NSObject {
    
    class func HeapSort(array: [Int]) -> [Int] {
        var sortArray = array
        
        // 构建大顶堆
        // 堆的位置是从 1 开始的
        for i in (1...sortArray.count/2).reversed() {
            HeapAdjust(array: &sortArray, start: i, end: array.count)
        }
        
        for i in (1..<sortArray.count).reversed() {
            
            // 第一个于最后一个未排序的交换,
            let temp = sortArray[0]
            sortArray[0] = sortArray[i]
            sortArray[i] = temp
            
            
            HeapAdjust(array: &sortArray, start: 1, end: i)
        }
        
        return sortArray
    }
    
    class func HeapAdjust(array: inout [Int], start: Int, end: Int)  {
        // 实际:  在 HeapSort() 函数中, 是遍历调整, 从最后一个子结点(或最后一个非叶子结点)开始, 只要判断 根、左、右结点的大小就可以
        // start 是元素在堆中的下标, 取值时要 -1, array 是从 0 开始的
        var s = start
        let temp = array[s-1]
        var j = 2*s  // 根结点为 s, 左孩子为 2*s, 右孩子为 2*s+1
        while j <= end {
            if j < end && array[j-1] < array[j] {
                j+=1  // 右孩子大于左孩子, 指向右孩子下标
            } else {
                // j 指向左孩子
            }
            if temp >= array[j-1] {
                break  // 根结点最大
            }
            array[s-1] = array[j-1] // 将较大值放在堆顶
            s = j  // 改变下标, 将交换后的下标放入 s
            j*=2
        }
        array[s-1] = temp
    }
    
    
    
    
    
    class func HeapSortSmall(array: [Int]) -> [Int] {
        var sortArray = array
        // 构建小顶堆
        // 堆的位置是从 1 开始的
        for i in (1...sortArray.count/2).reversed() {
            HeadAdjustSmall(array: &sortArray, start: i, end: array.count)
        }
        
        for i in (1..<sortArray.count).reversed() {
            
            // 第一个于最后一个未排序的交换,
            let temp = sortArray[0]
            sortArray[0] = sortArray[i]
            sortArray[i] = temp
            
            
            HeadAdjustSmall(array: &sortArray, start: 1, end: i)
        }
        
        return sortArray
    }
    
    // 小顶堆
    class func HeadAdjustSmall(array: inout [Int], start: Int, end: Int) {
        var s = start
        let temp = array[s-1]
        var j = 2*s
        while j <= end {
            if j < end && array[j-1] > array[j] {
                j+=1
            }
            if temp <= array[j-1] {
                break
            }
            array[s-1] = array[j-1]
            s = j
            j*=2
        }
        array[s-1] = temp
    }
    
    
}
                               
