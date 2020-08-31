//
//  BubbleSort.swift
//  Sort
//
//  Created by zhaoyang on 2020/8/28.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import UIKit
// 时间复杂度  n 平方
class BubbleSort: NSObject {
    
    class func BubbleSort(array: [Int]) -> [Int] {
        var sortArray = array

        for i in 0..<sortArray.count-1 {
            for j in i+1..<sortArray.count {
                if sortArray[i] > sortArray[j] {
                    let temp = sortArray[i]
                    sortArray[i] = sortArray[j]
                    sortArray[j] = temp
                }
            }
        }
        return sortArray
    }
    
    // 从后向前可以在一次遍历过程中, 将较小的数据提到前面
    class func BubbleSort1(array: [Int]) -> [Int] {
        var sortArray = array
        for i in 0..<sortArray.count-1 {
            for j in (i..<sortArray.count-1).reversed() {
                if sortArray[j] > sortArray[j+1] {
                    let temp = sortArray[j]
                    sortArray[j] = sortArray[j+1]
                    sortArray[j+1] = temp
                }
            }
        }
        return sortArray
    }
    
    
    // 增加标记, 在数据有序时减少不必要的比较, 提高效率
    class func BubbleSort2(array: [Int]) -> [Int] {
        var sortArray = array
        var flag = true
        for i in 0..<sortArray.count-1 {
            if flag {
                flag = false
                for j in (i..<sortArray.count-1).reversed() {
                    if sortArray[j] > sortArray[j+1] {
                        let temp = sortArray[j]
                        sortArray[j] = sortArray[j+1]
                        sortArray[j+1] = temp
                        flag = true
                    }
                }
            }
        }
        return sortArray
    }
}
