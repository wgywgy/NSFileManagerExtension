//
//  ViewController.swift
//  TestOfCatagory
//
//  Created by wuguanyu on 16/2/24.
//  Copyright © 2016年 dejauu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let testBtn = UIButton(type: UIButtonType.Custom)
        testBtn.frame = CGRect(x: 20, y: 20, width: 150, height: 40)
        testBtn.backgroundColor = UIColor.blackColor()
        testBtn.startTime(10, title: "test", waitTittle: "waiting")
        self.view.addSubview(testBtn)
        
        let docString = NSFileManager.documentsPath()
        let freeSpace = NSFileManager.availableDiskSpace()
        
        print("doc path: \(docString)")
        print("freeSpace: \(freeSpace)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

