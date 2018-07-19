//
//  MagnifyView.swift
//  MagnifyingGlass
//
//  Created by Damidu Dasanayake on 6/29/18.
//  Copyright © 2018 Damidu Dasanayake. All rights reserved.
//

import UIKit

class MagnifyView: UIView {

    var viewToMagnify: UIView!
    var touchPoint: CGPoint!
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit()
    {
        // Set border color, border width and corner radius of the magnify view
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 50
        self.layer.masksToBounds = true
    }
    
    func setTouchPoint(pt: CGPoint)
    {
        touchPoint = pt
        self.center = CGPoint(x: pt.x, y: pt.y - 80)
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context!.translateBy(x: 1 * (self.frame.size.width * 0.5), y: 1 * (self.frame.size.height * 0.5))
        context!.scaleBy(x: 1.5, y: 1.5) // 1.5 is the zoom scale
        context!.translateBy(x: -1 * (touchPoint.x), y: -1 * (touchPoint.y))
        self.viewToMagnify.layer.render(in: context!)
    }

}
