//
//  DetailOne.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit

class DetailTwo: UIViewController {
    
    
    
    @IBOutlet weak var detailDescriptionTextView: UITextView!
    
  
    
    
    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail2 = self.detailItem {
            if let UITextView = self.detailDescriptionTextView {
                UITextView.text = detail2.description
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        
        
        
        
    }
    
  
    @IBAction func AddFavourite(sender: UIButton) {
        
              
        }
    
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
            
            
        }
    }
    
    
}

