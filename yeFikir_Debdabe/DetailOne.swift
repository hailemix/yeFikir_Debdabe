//
//  DetailOne.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit
import GoogleMobileAds

class DetailOne: UIViewController,UITextViewDelegate,UIScrollViewDelegate,GADBannerViewDelegate,GADInterstitialDelegate {
    
    
    
    @IBOutlet weak var detailDescriptionTextView: UITextView!
    
    
    var interstitial : GADInterstitial!
    var adMobBannerView = GADBannerView()
   
    
    @IBOutlet weak var myBut: UIButton!
    @IBOutlet weak var Advert: UIButton!

    
    
    let item1 = TableOne().details[0]
    let item2 = TableOne().details[1]
    let item3 = TableOne().details[2]
    let item4 = TableOne().details[3]
    let item5 = TableOne().details[4]
    let item6 = TableOne().details[5]
    let item7 = TableOne().details[6]
    let item8 = TableOne().details[7]
    let item9 = TableOne().details[8]
    let item10 = TableOne().details[9]
    let item11 = TableOne().details[10]
    

    
    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail = self.detailItem {
            if let UITextView = self.detailDescriptionTextView {
                UITextView.text = detail.description
           
            }
            
        }
    }
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad() // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        
        detailDescriptionTextView.delegate = self
        initAdmobBanner()
        interstitial = createAndLoadInterstitial()
        AdvertController()
       
        //Any additional functionality happening in the Description TextView will be working only if you set the DescriptionTextView as a self delegate.
        
       
    }
    
    func initAdmobBanner() {
    
        if UIDevice.current.userInterfaceIdiom == .phone {
        
        // iPhone
            
            adMobBannerView.adSize = kGADAdSizeSmartBannerPortrait
       
        } else {
         
            //iPad
            adMobBannerView.adSize = kGADAdSizeSmartBannerLandscape
    
        }
        
        adMobBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        adMobBannerView.rootViewController = self
        adMobBannerView.delegate = self
        view.addSubview(adMobBannerView)
        
        let request = GADRequest()
        adMobBannerView.load(request)
 
    
    }
    
    
    func hideBanner(_ banner:UIView) {
        
        UIView.beginAnimations("hideBanner", context: nil)
        banner.frame = CGRect(x:view.frame.size.width/2 - banner.frame.size.width/2, y:view.frame.size.height - banner.frame.size.height,width: banner.frame.size.width,height: banner.frame.size.height)
        UIView.commitAnimations()
        banner.isHidden = true

    
    }
    
    func showBanner(_ banner:UIView) {
    
        UIView.beginAnimations("showBanner", context: nil)
        banner.frame = CGRect(x:view.frame.size.width/2 - banner.frame.size.width/2, y:view.frame.size.height - banner.frame.size.height,width: banner.frame.size.width,height: banner.frame.size.height)
        UIView.commitAnimations()
        banner.isHidden = false
        
        /* If you want to put the banner ad in the top part of the View,make the value of the view frame as 0 and the banner height as it is i.e
         y:banner.frame.size.height
         
         */

    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        showBanner(adMobBannerView)
    }
    
   func adView(_ view: GADBannerView,didFailToReceiveAdWithError error: GADRequestError){
       hideBanner(adMobBannerView)
    
    }
  
  
     func createAndLoadInterstitial() -> GADInterstitial {
        
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")  // GADInterstitialAd loads a single Interstitail
        interstitial.load(GADRequest())
        interstitial.delegate = self
        return interstitial
    
    }
    
   
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
        
    }
    
    
    @IBAction func myAdvert(_ sender: UIButton) {
        
        if interstitial.isReady {
            
            interstitial.present(fromRootViewController: self)
            
        } else {
            
            print("Ad wasn't ready")
        }
   
    }
    
    
    func AdvertController () {
   
        
        if detailDescriptionTextView.text == item3 || detailDescriptionTextView.text == item7 || detailDescriptionTextView.text == item9 {
        
            Advert.isHidden = false
          
        }
    
    }
    
    
    
    @IBAction func myShare(_ sender: UIButton) {

        
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
    
  
    func scrollViewDidScroll(_ scrollView: UIScrollView){
    
           myBut.isHidden = true
        
        
        if detailDescriptionTextView.text == item3 || detailDescriptionTextView.text == item7 || detailDescriptionTextView.text == item9 {
           Advert.isHidden = true
        }
        
        if detailDescriptionTextView.text == item2 {
            
            myBut.isHidden = false
            
        }
        
        //Becareful of the lowerSlash(_) since if you don't give one space moe.it won't work
    
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
        myBut.isHidden = false
        
        if detailDescriptionTextView.text == item3 || detailDescriptionTextView.text == item7 || detailDescriptionTextView.text == item9 {
            Advert.isHidden = false
        }
       
    }
  
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
            
            
        }
    }
    

}

