//
//  SelectSort.swift
//  Sort
//
//  Created by zhaoyang on 2020/8/31.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import UIKit

// 时间复杂度  n 平方, 理论上 性能略优于 冒泡排序
// 实际测试过程, 冒泡 时间 快于 选择
class SelectSort: NSObject {

    class func SelectSort(array: [Int]) -> [Int] {
        var sortArray = array
        for i in 0..<sortArray.count {
            var min = i
            for j in i+1..<sortArray.count {
                if sortArray[min] > sortArray[j] {
                    min = j
                }
            }
            if i != min {
                let temp = sortArray[i]
                sortArray[i] = sortArray[min]
                sortArray[min] = temp
            }
        }
        return sortArray
    }
    
    func selectsortmethod(array: [Int]) -> [Int] {
        var sortarray = array
        for i in 0..<sortarray.count {
            var min = i
            for j in i+1..<sortarray.count {
                if sortarray[min] > sortarray[j] {
                    min = j // 找到最小的
                }
            }
            // 交换最小的到最前面
            if i != min {
                let temp = sortarray[i]
                sortarray[i] = sortarray[min]
                sortarray[min] = temp
            }
        }
        return sortarray
    }
    
}
