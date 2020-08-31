//
//  ShellSort.swift
//  Sort
//
//  Created by zhaoyang on 2020/8/31.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import UIKit
// 不稳定算法
// 时间复杂度比较复杂, 依赖于增量序列的选取
class ShellSort: NSObject {

    class func ShellSort(array: [Int]) -> [Int] {
        var sortArray = array
        let step = getHibbardStepArr(num: sortArray.count)
        for increment in step {
//            print(increment)
            // 根据 increment 虚拟分组
            // 虚拟分组数据 插入排序
            for i in increment..<sortArray.count {
                // 处理虚拟分组, 插入排序
                // 虚拟分组为 反序: i-increment, i-2*increment, i-3*increment ...
                var j = i-increment
                let temp = sortArray[i]
                while j >= 0 && temp < sortArray[j] {
                    sortArray[j+increment] = sortArray[j]
                    j -= increment
                }
                sortArray[j+increment] = temp
            }
        }
        return sortArray
    }
    
    
    // 增量序列
    // Hibbard增量序列的取法为𝐷𝑘=2^𝑘−1
    // 最坏时间复杂度为𝑂(𝑁^3/2), 平均时间复杂度约为𝑂(𝑁^5/4)
    class func getHibbardStepArr(num: Int) -> [Int] {
        var i = 1
        var array = [Int]()
        while true {
            let temp = (1 << i) - 1
            if temp <= num  {
                array.append(temp)
            } else {
                break
            }
            i += 1
        }
        return array.reversed()
    }
    // 最坏
    //  n/2^i   O(n^2)
    //  2^k-1   O(n^3/2)
    //  2^i * 3^j O(nlog^2 * n)
    
    
    
    
}

