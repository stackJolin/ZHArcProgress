//
//  ViewController.swift
//  ZHArcProgress
//
//  Created by user on 16/1/15.
//  Copyright © 2016年 personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor()
        self.view.addSubview(self.progressView)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //懒加载控件
    private lazy var progressView:ZHProgressView = ZHProgressView(frame:CGRectMake(0, 0, 100, 100))

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.progressView.percentage = 1
    }
}

