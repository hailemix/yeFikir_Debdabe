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
    
    func getRandomColor(){
        
        let red = Float((arc4random() % 256)) / 255.0
        let green = Float((arc4random() % 256)) / 255.0
        let blue = Float((arc4random() % 256)) / 255.0
        let alpha = Float(1.0)
        colours = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
        
        UIView.animate(withDuration:3, delay: 0, options:[ UIViewAnimationOptions.repeat,UIViewAnimationOptions.autoreverse], animations: { self.view.backgroundColor = self.colours} ,completion: nil)
    }

    
  

}

