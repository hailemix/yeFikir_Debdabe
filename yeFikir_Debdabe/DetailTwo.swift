//
//  DetailOne.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit
import GoogleMobileAds



class DetailTwo: UIViewController,UITextViewDelegate,UIScrollViewDelegate,GADBannerViewDelegate,GADInterstitialDelegate {
    
    // Don't forget to add the delegates in the class extension,otherwise it won't work
    
    var interstitialTwo : GADInterstitial!
    var adMobBannerView = GADBannerView()
    
    @IBOutlet weak var detailDescriptionTextView: UITextView!
    @IBOutlet weak var myBut: UIButton!
    @IBOutlet weak var AdvertTwo: UIButton!
    
  
    
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
    let item12 = TableTwo().details[11]
    let item13 = TableTwo().details[12]
    let item14 = TableTwo().details[13]
    let item15 = TableTwo().details[14]
    let item16 = TableTwo().details[15]
    let item17 = TableTwo().details[16]
    let item18  = TableTwo().details[17]
    let item19  = TableTwo().details[18]
    let item20  = TableTwo().details[19]
    let item21  = TableTwo().details[20]
    let item22  = TableTwo().details[21]
    let item23  = TableTwo().details[22]
    let item24  = TableTwo().details[23]
    let item25  = TableTwo().details[24]
    let item26  = TableTwo().details[25]
    let item27  = TableTwo().details[26]
    let item28  = TableTwo().details[27]
    let item29  = TableTwo().details[28]
    let item30  = TableTwo().details[29]
    let item31  = TableTwo().details[30]
    
    /* 'weak'  helps to protect your view controller in the event of the NSManagedObject being deleted and leaving a dangling reference to a non-existent object. When the property is declared as weak it is automatically set to nil when the object is deleted.
    */
  
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
        
        detailDescriptionTextView.delegate = self
        initAdmobBanner()
        interstitialTwo = createAndLoadInterstitial()
        AdvertController()
    }
    
    func initAdmobBanner() {
    
        if UIDevice.current.userInterfaceIdiom == .phone {
        adMobBannerView.adSize = kGADAdSizeSmartBannerPortrait
        } else {
        
        adMobBannerView.adSize = kGADAdSizeSmartBannerLandscape
        
        }
      
        adMobBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        adMobBannerView.rootViewController = self
        adMobBannerView.delegate = self
        view.addSubview(adMobBannerView)
        
        let request = GADRequest()
        adMobBannerView.load(request)
    
    }
    
    
    func hidebanner(_ banner:UIView) {
    
        UIView.beginAnimations("hideBanner", context: nil)
        
        banner.frame = CGRect(x:view.frame.size.width/2 - banner.frame.size.width/2, y:view.frame.size.height - banner.frame.size.height,width:banner.frame.size.width,height:banner.frame.size.height)
    
        UIView.commitAnimations()
        banner.isHidden = true
    
    
    }
    
    func showBanner(_ banner: UIView) {
    
        UIView.beginAnimations("showBanner",context:nil)
        banner.frame = CGRect(x:view.frame.size.width/2 - banner.frame.size.width/2, y: view.frame.size.height - banner.frame.size.height,width:banner.frame.size.width,height:banner.frame.size.height)
        
        UIView.commitAnimations()
        banner.isHidden  = false
    
    }
    
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        showBanner(adMobBannerView)
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        hidebanner(adMobBannerView)
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
    
    let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.load(GADRequest())
        interstitial.delegate = self
        return interstitial
  
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitialTwo = createAndLoadInterstitial()
    }
    
  
    @IBAction func AdvertTwoButton(_ sender: Any)
    
      {
        
        if interstitialTwo.isReady {
            
            interstitialTwo.present(fromRootViewController: self)
            
        } else {
            
            print("Ad wasn't ready")
            
        }
    }
    
    func AdvertController () {
    
        if detailDescriptionTextView.text == item2 || detailDescriptionTextView.text == item7 || detailDescriptionTextView.text == item13 || detailDescriptionTextView.text == item19 || detailDescriptionTextView.text == item25 || detailDescriptionTextView.text == item31 {
            AdvertTwo.isHidden = false
            
        }
  
    }
 
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
          myBut.isHidden = true
        
        if detailDescriptionTextView.text == item2 || detailDescriptionTextView.text == item7 || detailDescriptionTextView.text == item13 || detailDescriptionTextView.text == item19 || detailDescriptionTextView.text == item25 || detailDescriptionTextView.text == item31 {
            AdvertTwo.isHidden = true
            
        }
        
        if(detailDescriptionTextView.text == item30) {
        
        myBut.isHidden = false
        
        }
        
        
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        myBut.isHidden = false
        
        if detailDescriptionTextView.text == item2 || detailDescriptionTextView.text == item7 || detailDescriptionTextView.text == item13 || detailDescriptionTextView.text == item19 || detailDescriptionTextView.text == item25 || detailDescriptionTextView.text == item31 {
            AdvertTwo.isHidden = false
            
        }
    }
    

    @IBAction func shareButton(_ sender: UIButton) {
     
        
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
        else if (detailDescriptionTextView.text == item12){
            
            let activityViewController = UIActivityViewController(activityItems:[item12], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
          
        }
        
        else if (detailDescriptionTextView.text == item13){
            
            let activityViewController = UIActivityViewController(activityItems:[item13], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
           
        }
        else if (detailDescriptionTextView.text == item14){
            
            let activityViewController = UIActivityViewController(activityItems:[item14], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
          
        }
        else if (detailDescriptionTextView.text == item15){
            
            let activityViewController = UIActivityViewController(activityItems:[item15], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
          
        }
        else if (detailDescriptionTextView.text == item16){
            
            let activityViewController = UIActivityViewController(activityItems:[item16], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
          
        }
        
        else if (detailDescriptionTextView.text == item17){
            
            let activityViewController = UIActivityViewController(activityItems:[item17], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
         
        }
        else if (detailDescriptionTextView.text == item18){
            
            let activityViewController = UIActivityViewController(activityItems:[item18], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
         
        }
        else if (detailDescriptionTextView.text == item19){
            
            let activityViewController = UIActivityViewController(activityItems:[item19], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
       
        }
        
        else if (detailDescriptionTextView.text == item20){
            
            let activityViewController = UIActivityViewController(activityItems:[item20], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
        
        }
        else if (detailDescriptionTextView.text == item21){
            
            let activityViewController = UIActivityViewController(activityItems:[item21], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
        }
        else if (detailDescriptionTextView.text == item22){
            
            let activityViewController = UIActivityViewController(activityItems:[item22], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
       
        }
        else if (detailDescriptionTextView.text == item23){
            
            let activityViewController = UIActivityViewController(activityItems:[item23], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
       
        }
        else if (detailDescriptionTextView.text == item24){
            
            let activityViewController = UIActivityViewController(activityItems:[item24], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
        }
        else if (detailDescriptionTextView.text == item25){
            
            let activityViewController = UIActivityViewController(activityItems:[item25], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
        }
        
        else if (detailDescriptionTextView.text == item26){
            
            let activityViewController = UIActivityViewController(activityItems:[item26], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
          
        }
        
        else if (detailDescriptionTextView.text == item27){
            
            let activityViewController = UIActivityViewController(activityItems:[item27], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
          
        }
        
        else if (detailDescriptionTextView.text == item28){
            
            let activityViewController = UIActivityViewController(activityItems:[item28], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
            
        }
        
        else if (detailDescriptionTextView.text == item29){
            
            let activityViewController = UIActivityViewController(activityItems:[item29], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
         
        }
        else if (detailDescriptionTextView.text == item30){
            
            let activityViewController = UIActivityViewController(activityItems:[item30], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
            
            
        }
        else if (detailDescriptionTextView.text == item31){
            
            let activityViewController = UIActivityViewController(activityItems:[item31], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController,animated:true,completion:nil)
            
            activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
           
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

