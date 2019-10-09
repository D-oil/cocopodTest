//
//  ViewController.swift
//  viewController
//
//  Created by 董安东 on 2019/7/31.
//  Copyright © 2019 AdamDong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    var dataSource : ArrayDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataSource = ArrayDataSource(items: ["name","path","domain"], cellIdentifier: "cell")
        
        tableview.dataSource = dataSource
        tableview.delegate = self
        tableview.isEditing = true
        dataSource?.configureCell = { (cell, item) in
            cell.textLabel?.text = item
        }
        
        let concurrentQueue = DispatchQueue.init(label: "test", attributes: .concurrent)
//
//
//        for i in 0...9 {
//            concurrentQueue.async{
//                print("读 \(i)")
//            }
//        }
//
//        let workItem = DispatchWorkItem.init(qos: DispatchQoS.default, flags: DispatchWorkItemFlags.barrier) {
//            print("开始写数据------写数据完成")
//        }
//
//        concurrentQueue.sync(execute: workItem)
//
//        for i in 10...19 {
//            concurrentQueue.async{
//                print("读 \(i)")
//            }
//        }
        
//        let group = DispatchGroup()
//
//        for i in 0...9 {
//            concurrentQueue.async(group: group) {
//                print("\(i)")
//            }
//        }
//
//        group.notify(queue: concurrentQueue) {
//            print("刷新UI")
//        }
        
//        var arr = [Int]()
//        let semaphore = DispatchSemaphore.init(value: 1) // 创建信号量，控制同时访问资源的线程数为1
//        for i in 0...100 {
//            DispatchQueue.global().async {
//
//                /*
//                 其他并发操作
//                 */
//
//                semaphore.wait() // 如果信号量计数>=1,将信号量计数减1；如果信号量计数<1，阻塞线程直到信号量计数>=1
//                arr.append(i)
//                print("\(i)")
//                semaphore.signal() // 信号量计加1i
//
//                /*
//                 其他并发操作
//                 */
//            }
//        }
        
        
        let thread = Thread {
            print("线程中执行任务")
            
            let runloop = RunLoop.current
            runloop.add(NSMachPort(), forMode: .common)
            runloop.run()
            print("线程开启Runloop")
        }
        thread.start()
        
//        self.performSelector(onMainThread: #selector(reloadData), with: nil, waitUntilDone: false, modes: [RunLoop.Mode.default.rawValue])

    }
    
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .insert
    }


}

