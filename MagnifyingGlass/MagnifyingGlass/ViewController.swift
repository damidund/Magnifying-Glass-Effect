//
//  ViewController.swift
//  MagnifyingGlass
//
//  Created by Damidu Dasanayake on 6/29/18.
//  Copyright © 2018 Damidu Dasanayake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var magnifyView: MagnifyView?
    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.myView = UIView()
        self.myView?.backgroundColor = UIColor(white: 0x2E2E2E, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view)
        if magnifyView == nil
        {
            magnifyView = MagnifyView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            magnifyView?.viewToMagnify = self.view
            magnifyView?.setTouchPoint(pt: point!)
            self.view.addSubview(magnifyView!)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if magnifyView != nil
        {
            magnifyView?.removeFromSuperview()
            magnifyView = nil
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view)
        magnifyView?.setTouchPoint(pt: point!)
        magnifyView?.setNeedsDisplay()
    }

}

