//
//  ZHProgressView.swift
//  ZHArcProgress
//
//  Created by user on 16/1/15.
//  Copyright © 2016年 personal. All rights reserved.
//

import UIKit

class ZHProgressView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    //初始化视图
    private func setUpUI(){
        arcBackLayer.path = backGroundPath.CGPath
        self.layer.addSublayer(arcBackLayer)
        arcPreLayer.path = preGroundPath.CGPath
        self.layer.addSublayer(arcPreLayer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var percentage:Double = 0.0 {
        //初始赋值的时候不会调用didSet
        didSet{
            if percentage > 1{
                percentage = 1.0
            }
            else{
                let animation:CABasicAnimation = CABasicAnimation(keyPath:"strokeEnd")
                animation.fromValue = NSNumber(float: Float(0))
                animation.toValue = NSNumber(float: Float(percentage))
                animation.duration = 2.0
                animation.fillMode = "forwards"
                animation.removedOnCompletion = false
                animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//                    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)

                arcPreLayer.removeAnimationForKey("strokeEndKey")
                arcPreLayer.addAnimation(animation, forKey: "strokeEndKey")
            }
        }
    }
    //懒加载
    private lazy var backGroundPath:UIBezierPath = {
        let bezierPath:UIBezierPath = UIBezierPath(arcCenter: self.center, radius: self.bounds.size.width * 0.5, startAngle: CGFloat(M_PI) * 0.75, endAngle: CGFloat(M_PI) * 0.25, clockwise: true)
        return bezierPath
    }()
    private lazy var preGroundPath:UIBezierPath = {
        let bezierPath:UIBezierPath = UIBezierPath(arcCenter: self.center, radius: self.bounds.size.width * 0.5, startAngle: CGFloat(M_PI) * 0.75, endAngle: CGFloat(M_PI) * 0.25, clockwise: true)
        return bezierPath
    }()
    private lazy var arcBackLayer:CAShapeLayer = {
        let caLayer:CAShapeLayer = CAShapeLayer()
        caLayer.lineWidth = 8.0
        caLayer.frame = self.bounds
        caLayer.lineCap = "round"
        caLayer.strokeColor = UIColor.lightGrayColor().CGColor
        caLayer.fillColor = UIColor.clearColor().CGColor
        return caLayer
    }()
    private lazy var arcPreLayer:CAShapeLayer = {
        let caLayer:CAShapeLayer = CAShapeLayer()
        caLayer.lineWidth = 7.0
        caLayer.strokeEnd = 0
        caLayer.frame = self.bounds
        caLayer.lineCap = "round"
        caLayer.strokeColor = UIColor.redColor().CGColor
        caLayer.fillColor = UIColor.clearColor().CGColor
        return caLayer
    }()
    
}
