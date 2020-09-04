//
//  ViewController.swift
//  Sort
//
//  Created by zhaoyang on 2020/8/26.
//  Copyright © 2020 zhaoyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentTime : TimeInterval!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let sortNumber = 10000
        let sortRange = UInt32(sortNumber)
        
        var array = [Int]()
        while array.count < sortNumber {
            array.append(Int(arc4random() % sortRange))
        }

        _ = timeBegin(state: true)
        var time = timeBegin(state: false)

        _ = timeBegin(state: true)
        _ = BubbleSort.BubbleSort(array: array)
        time = timeBegin(state: false)
        print("假冒泡   : \(time as Any)")

//         冒泡
        _ = timeBegin(state: true)
        _ = BubbleSort.BubbleSort1(array: array)
        time = timeBegin(state: false)
        print("真冒泡   : \(time as Any)")
        
        _ = timeBegin(state: true)
        _ = BubbleSort.BubbleSort2(array: array)
        time = timeBegin(state: false)
        print("冒泡优化  : \(time as Any)")

//         选择
        _ = timeBegin(state: true)
        _ = SelectSort.SelectSort(array: array)
        time = timeBegin(state: false)
        print("选择    : \(time as Any)")

//         插入
        _ = timeBegin(state: true)
        _ = InsertSort.InsertSort(array: array)
        time = timeBegin(state: false)
        print("插入    : \(time as Any)")

        
        // 希尔
        _ = timeBegin(state: true)
        _ = ShellSort.ShellSort(array: array)
        time = timeBegin(state: false)
        print("希尔    : \(time as Any)")

        
        // 堆 大顶堆
        _ = timeBegin(state: true)
        _ = HeapSort.HeapSort(array: array)
        time = timeBegin(state: false)
        print("大顶堆   : \(time as Any)")


        // 堆 小顶堆
        _ = timeBegin(state: true)
        _ = HeapSort.HeapSortSmall(array: array)
        time = timeBegin(state: false)
        print("小顶堆   : \(time as Any)")


        // 归并
        _ = timeBegin(state: true)
        _ = MergeSort.MergeSort(array: array)
        time = timeBegin(state: false)
        print("归并递归  : \(time as Any)")



        // 归并
        _ = timeBegin(state: true)
        _ = MergeSort.MergeSort2(array: array)
        time = timeBegin(state: false)
        print("归并迭代  : \(time as Any)")

        
        
        // 快排
        // 递归模式
        _ = timeBegin(state: true)
        _ = QuickSort.QuickSort(array: array)
        time = timeBegin(state: false)
        print("快排    : \(time as Any)")

        _ = timeBegin(state: true)
        _ = QuickSort.QuickSort2(array: array)
        time = timeBegin(state: false)
        print("快排优化  : \(time as Any)")
        
        
        _ = timeBegin(state: true)
        _ = QuickSort.QuickSort3(array: array)
        time = timeBegin(state: false)
        print("快排尾递归 : \(time as Any)")
    }

    
    
    

    func timeBegin(state: Bool) -> TimeInterval? {
        if state {
            currentTime = Date.init().timeIntervalSince1970
            return nil
        } else {
            let endTime = Date.init().timeIntervalSince1970
            return endTime-currentTime!
        }
        
    }

}

