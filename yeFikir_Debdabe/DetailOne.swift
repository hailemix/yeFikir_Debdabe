//
//  DetailOne.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit

class DetailOne: UIViewController {
    
    
    
    @IBOutlet weak var detailDescriptionTextView: UITextView!
  
    
    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail = self.detailItem {
            if let UITextView = self.detailDescriptionTextView {
                UITextView.text = detail.description
                
                
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
       
        
        
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
   
  
    @IBAction func butOne(_ sender: UIButton) {
        
        let item1 = TableTwo().details[0]
        let item2 = TableTwo().details[1]
        let item3 = TableTwo().details[2]
        let item4 = TableTwo().details[3]
        let item5 = TableTwo().details[4]
        let item6 = TableTwo().details[5]
        let item7 = TableTwo().details[6]
        let item8 = TableTwo().details[7]
        let item9 = TableTwo().details[8]
        let item10 = TableTwo().details[9]
        let item11 = TableTwo().details[10]
        
        
        
        
        if(detailDescriptionTextView.text == item1){
            let activityViewController = UIActivityViewController(activityItems:[item1], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
            
        } else if(detailDescriptionTextView.text == item2) {
            let activityViewController = UIActivityViewController(activityItems:[item2], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
            
        }else if(detailDescriptionTextView.text == item3) {
            let activityViewController = UIActivityViewController(activityItems:[item3], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
            
        }else if(detailDescriptionTextView.text == item4) {
            let activityViewController = UIActivityViewController(activityItems:[item4], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
            
        }
        else if(detailDescriptionTextView.text == item5) {
            let activityViewController = UIActivityViewController(activityItems:[item5], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
            
        }
        else if(detailDescriptionTextView.text == item6) {
            let activityViewController = UIActivityViewController(activityItems:[item6], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
            
        }
        else if(detailDescriptionTextView.text == item7) {
            let activityViewController = UIActivityViewController(activityItems:[item7], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
            
        }
            
        else if (detailDescriptionTextView.text == item8){
            
            let activityViewController = UIActivityViewController(activityItems:[item8], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
            
        }
        else if (detailDescriptionTextView.text == item9){
            
            let activityViewController = UIActivityViewController(activityItems:[item9], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
            
        }
        else if (detailDescriptionTextView.text == item10){
            
            let activityViewController = UIActivityViewController(activityItems:[item10], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
            
        }
        else if (detailDescriptionTextView.text == item11){
            
            let activityViewController = UIActivityViewController(activityItems:[item11], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
            
        }

        
        
        
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

