//
//  QuickSort.swift
//  Sort
//
//  Created by zhaoyang on 2020/9/4.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import UIKit
// 最优  O(nlogn)  最坏 O(n^2)  平均 O(nlogn)
// 空间  最好 O(logn) 最坏 O(n)  平均 O(logn)
// 不稳定的
class QuickSort: NSObject {

    class func QuickSort(array: [Int]) -> [Int] {
        var sortArray = array
//        print(sortArray)
        QSort(array: &sortArray, low: 0, high: array.count-1)
//        print(sortArray)
        

        
        return sortArray
    }
    
    
    
    // 采用递归的方式实现
    private class func QSort(array: inout [Int], low: Int, high: Int) {
        if low < high {
            let pivot = Partition(array: &array, low: low, high: high);
            QSort(array: &array, low: low, high: pivot)
            QSort(array: &array, low: pivot+1, high: high)
        }
    }
    
    
    private class func Partition(array: inout [Int], low: Int, high: Int) -> Int {
        let pivotkey = array[low]
        var highIndex = high
        var lowIndex = low
        while lowIndex < highIndex {
            while lowIndex < highIndex && array[highIndex] >= pivotkey {
                highIndex-=1
            }
            swap(array: &array, low: lowIndex, high: highIndex)

            while lowIndex < highIndex && array[lowIndex] <= pivotkey {
                lowIndex+=1
            }
            swap(array: &array, low: lowIndex, high: highIndex)
        }
//        lowIndex == highIndex
        return lowIndex
    }
    
    
    
    
    class func QuickSort2(array: [Int]) -> [Int] {
        var sortArray = array
        QSort2(array: &sortArray, low: 0, high: array.count-1)
        return sortArray
    }
    
    // 采用递归的方式实现
   
    private class func QSort2(array: inout [Int], low: Int, high: Int) {

//        if low < high {
//            let pivot = Partition2(array: &array, low: low, high: high)
//            QSort(array: &array, low: low, high: pivot)
//            QSort(array: &array, low: pivot+1, high: high)
//        }
        
         // 优化, 在数据量小的时候, 快排不如插入
        if high - low > 7 {
            if low < high {
                let pivot = Partition2(array: &array, low: low, high: high)
                QSort(array: &array, low: low, high: pivot)
                QSort(array: &array, low: pivot+1, high: high)
            }
        } else {
            array = InsertSort.InsertSort(array: array)
        }
        
        
    }
    
    
    // 三数取中, 也可九数取中(保证取到的轴值尽可能为中间值)
    private class func getPivotKey(array: inout [Int], low: Int, high: Int) {
        if array.count == 0 {
            return
        }
        
        // 这里做一次排序
        let middle = array[(low+high)/2]
        if array[low] > array[high] {
            swap(array: &array, low: low, high: high)
        }
        if array[middle] > array[high] {
            swap(array: &array, low: middle, high: high)
        }
        if array[middle] > array[low] {
            swap(array: &array, low: low, high: middle)
        }
        // low 中存储中间值
        
    }
    
    // 优化 pivotkey 取值逻辑, 尽可能取中间值
    // 优化, 采用替换的方式取代交换的方式, 减少交换次数
    private class func Partition2(array: inout [Int], low: Int, high: Int) -> Int {
        getPivotKey(array: &array, low: low, high: high)
        let pivotkey = array[low]
        var highIndex = high
        var lowIndex = low
        let lowValue = array[low]
        
        while lowIndex < highIndex {
            while lowIndex < highIndex && array[highIndex] >= pivotkey {
                highIndex-=1
            }
//                            swap(array: &array, low: lowIndex, high: highIndex)
            array[lowIndex] = array[highIndex]
            
            while lowIndex < highIndex && array[lowIndex] <= pivotkey {
                lowIndex+=1
            }
//                            swap(array: &array, low: lowIndex, high: highIndex)
            array[highIndex] = array[lowIndex]
        }
        //        lowIndex == highIndex
        array[lowIndex] = lowValue
        return lowIndex
    }
    
    
    
    
    
    
    // 尾递归, 减小递归调用, 防止栈溢出
    class func QuickSort3(array: [Int]) -> [Int] {
        var sortArray = array
//        print(sortArray)
        QSort3(array: &sortArray, low: 0, high: array.count-1)
//        print(sortArray)
        return sortArray
    }
    
    // 采用递归的方式实现
    
    private class func QSort3(array: inout [Int], low: Int, high: Int) {
        
        var lowIndex = low
        // 优化, 在数据量小的时候, 快排不如插入
        if high - lowIndex > 7 {
            while lowIndex < high {
                let pivot = Partition2(array: &array, low: lowIndex, high: high)
                QSort(array: &array, low: lowIndex, high: pivot)
                lowIndex = pivot+1
            }
        } else {
            array = InsertSort.InsertSort(array: array)
        }
        
        
    }
    
    private class func swap(array: inout [Int], low: Int, high: Int) {
        let temp = array[low]
        array[low] = array[high]
        array[high] = temp
    }
}
