//
//  HeapSort.swift
//  Sort
//
//  Created by zhaoyang on 2020/8/31.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import UIKit

class HeapSort: NSObject {

    class func HeapSort(array: [Int]) -> [Int] {
        var sortArray = array
        print(sortArray)
        // 构建大顶堆
        // 堆的位置是从 1 开始的
        for i in (1...sortArray.count/2).reversed() {
            HeapAdjust(array: &sortArray, start: i, end: array.count)
        }
        
        for i in (2..<sortArray.count).reversed() {
            let temp = sortArray[1]
            sortArray[1] = sortArray[i]
            sortArray[i] = temp
            HeapAdjust(array: &sortArray, start: 1, end: i-1)
        }
        
        print(sortArray)
        return sortArray
    }
    
    class func HeapAdjust(array: inout [Int], start: Int, end: Int)  {
        // 实际:  在 HeapSort() 函数中, 是遍历调整, 从最后一个子结点(或最后一个非叶子结点)开始, 只要判断 根、左、右结点的大小就可以
        // start 是元素在堆中的下标, 取值时要 -1
        var s = start
        let temp = array[s-1]
        var j = 2*s
        while j <= end {
            if j < end && array[j-1] < array[j] {
                j += 1
            }
            if temp >= array[j-1] {
                break
            }
            array[start-1] = array[j-1];
            s = j
            j *= 2
        }
        array[s-1] = temp;
    }
}
                               
