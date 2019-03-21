//
//  About_US.swift
//  yeFikir_Debdabe
//
//  Created by user on 6/2/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit

class About_US: UIViewController{


    @IBOutlet var About_View: UIView!
    
    var timer =  Timer()
    var colours = UIColor()
    
    
    
    override func viewDidLoad() {
        
        getRandomColor()
        timerF()
        
    }
 
    
    func timerF() {
        
        
        timer = Timer.scheduledTimer(timeInterval:3, target: self, selector: #selector(About_US.getRandomColor), userInfo: nil, repeats: true)
    }
    
    @objc func getRandomColor(){
        
        let red = Float((arc4random() % 256)) / 255.0
        let green = Float((arc4random() % 256)) / 255.0
        let blue = Float((arc4random() % 256)) / 255.0
        let alpha = Float(1.0)
        colours = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
        
        
        UIView.animate(withDuration:3, delay: 0, options:[ UIView.AnimationOptions.repeat,UIView.AnimationOptions.autoreverse], animations: { self.view.backgroundColor = self.colours} ,completion: nil)
    }

    
  

}

