//
//  File.swift
//  
//
//  Created by Vagner Oliveira on 11/01/23.
//

import Foundation
import UIKit

class UICircleAnimation:UIView {
    
    /**
     *  Variables
     */
    
    /// - Initial angle
    public var startAngle:ZMStartAngle = ZMStartAngle.bottom
   
    /// - Circle properties colors
    public var circleProperties:ZMCircleProperties = ZMCircleProperties(backgroundColor: UIColor(red: 251/255, green: 221/255, blue: 221/255, alpha: 1), circleColor: UIColor(red: 236/255, green: 87/255, blue: 87/255, alpha: 1))
    
    /// - Total percent
    public var percent:Double = 100
    
    /// - Initial value text
    public var initialValue:Double = 0
    
    /// - Animation duration
    public var animationDuration:CFTimeInterval = 0.4
 
    // - Size of stroke
    public var lineWidth:CGFloat = 10
    
    /// - View wrapper, size equal this view
    private var wrapperView:UIView?
 
    /// - Total perncent
    public var percentText:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    /// - Calc of circle position
    private lazy var circleWidth:CGFloat = {
        return CGFloat(percent) / self.lineWidth
    }()
    
    /// - Start time animation text
    private var timer:Timer!
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(percentText)
        addConstraints()
    }
    
    /// - Add constraint to percent text
    private func addConstraints() {
        NSLayoutConstraint.activate([
            percentText.centerXAnchor.constraint(equalTo: centerXAnchor),
            percentText.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// - Animation text while initialValue <= percent
    @objc private func timerFunc() {
        initialValue += 1
        if initialValue <= percent {
            percentText.text = "\(initialValue)%"
        } else {
            timer.invalidate()
            timer = nil
        }
    }
    
    /// - Set wrapperView, default 100x100
    func setView(wrapperView:UIView) {
        self.wrapperView = wrapperView
    }
    
    /// - Start code here
    public func start() {
        self.wrapperView?.addSubview(self)
        self.addPropertiesSuperView()
        self.circleAnimation()
        self.textAnimation()
    }
    
    /// - Call timer
    private func textAnimation() {
        self.timer = Timer.scheduledTimer(timeInterval: self.animationDuration / self.percent, target: self, selector: #selector(self.timerFunc), userInfo: nil, repeats: true)
    }
    
    /// - Add from superview
    private func addPropertiesSuperView() {
        backgroundColor = circleProperties.backgroundColor
      
        bounds = self.wrapperView?.bounds ?? CGRect(x: 0, y: 0, width: 200, height: 200)
        

        
        layer.cornerRadius = (self.wrapperView?.frame.width ?? 100) / 2
    }
    
    /// - Start circle animation
    private func circleAnimation() {
        
        let radius = (self.wrapperView?.frame.width ?? 200) / 2
        
        let center = self.wrapperView?.center ?? CGPoint(x: 100, y: 100)
        
        let borderLayer = CAShapeLayer()
        let circularPathFill = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle.show  , endAngle: abs(startAngle.show + circleWidth), clockwise: true)
        borderLayer.path = circularPathFill.cgPath
        
        borderLayer.strokeColor = circleProperties.circleColor?.cgColor
        borderLayer.lineWidth = lineWidth
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeEnd = 0
        borderLayer.lineCap = .round
        
        layer.addSublayer(borderLayer)

        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 0.65
        animation.duration = animationDuration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        borderLayer.add(animation, forKey: "urSoBasic")
    }
}


