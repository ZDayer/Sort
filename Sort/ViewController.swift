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
        
        let sortNumber = 10
        let sortRange = UInt32(100)
        
        var array = [Int]()
        while array.count < sortNumber {
            array.append(Int(arc4random() % sortRange))
        }

        _ = timeBegin(state: true)
        var time = timeBegin(state: false)

//        _ = timeBegin(state: true)
//        _ = BubbleSort.BubbleSort(array: array)
//        var time = timeBegin(state: false)
//        print(time as Any)

        // 冒泡
//        _ = timeBegin(state: true)
//        _ = BubbleSort.BubbleSort1(array: array)
//        time = timeBegin(state: false)
//        print(time as Any)
        
//        _ = timeBegin(state: true)
//        _ = BubbleSort.BubbleSort2(array: array)
//        time = timeBegin(state: false)
//        print(time as Any)
        
        // 选择
//        _ = timeBegin(state: true)
//        _ = SelectSort.SelectSort(array: array)
//        time = timeBegin(state: false)
//        print(time as Any)
        
        // 插入
        _ = timeBegin(state: true)
        _ = InsertSort.InsertSort(array: array)
        time = timeBegin(state: false)
        print(time as Any)
        
        
        _ = timeBegin(state: true)
        _ = ShellSort.ShellSort(array: array)
        time = timeBegin(state: false)
        print(time as Any)
        
        
        
        _ = timeBegin(state: true)
        _ = HeapSort.HeapSort(array: array)
        time = timeBegin(state: false)
        print(time as Any)
        
        
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

