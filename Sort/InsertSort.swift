//
//  InsertSort.swift
//  Sort
//
//  Created by zhaoyang on 2020/8/31.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import UIKit

// 时间复杂度  n 平方, 性能 优于 冒泡排序、选择排序
// 测试 性能远优于 冒泡排序、选择排序
class InsertSort: NSObject {

    class func InsertSort(array: [Int]) -> [Int] {
        var sortArray = array
        // 默认 0..i-1 是已经排好序的
        for i in 1..<sortArray.count {
            if sortArray[i-1] > sortArray[i] {
                let temp = sortArray[i]
                var j = i-1
                while j >= 0 && sortArray[j] > temp {
                    sortArray[j+1] = sortArray[j]
                    j-=1
                }
                sortArray[j+1] = temp  // j+1 位置是对应 22行 j-=1
            }
        }
        return sortArray
    }
    
    func insertsortmethod(array: [Int]) -> [Int] {
        if array.count < 2  {
            return array
        }
        var sortarray = array
        for i in 1..<sortarray.count {
            if sortarray[i-1] > sortarray[i] {
                let temp = sortarray[i]
                var j = i-1
                // 循环查找该插入的位置
                while j >= 0 && sortarray[j] > temp {
                    sortarray[j+1] = sortarray[j] // 第一次的循环  j+1 = i, 将 sortarray[i]  的值覆盖, 保留在 temp 中
                    j -= 1
                }
                // j+1 的值已经向后移动到 j+2 中
                sortarray[j+1] = temp
            }
        }
        
        return sortarray
    }
}
