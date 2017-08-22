//
//  DetailOne.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit
import GoogleMobileAds
import AVFoundation

class DetailThree: UIViewController,UITextViewDelegate,UIScrollViewDelegate,GADBannerViewDelegate,GADInterstitialDelegate {
    
    
    
    
    var interstitialThree : GADInterstitial!
    var adMobBannerView = GADBannerView()
    var player : AVAudioPlayer?
    
 
    @IBOutlet weak var detailDescriptionTextView: UITextView!
    @IBOutlet weak var AdThreeBut: UIButton!
    @IBOutlet weak var myBut: UIButton!
    
    
    struct Constants {
    
    static let adRate = 3
        
    }
    
    let item1 = TableThree().details[0]
    let item2 = TableThree().details[1]
    let item3 = TableThree().details[2]
    let item4 = TableThree().details[3]
    let item5 = TableThree().details[4]
    let item6 = TableThree().details[5]
    let item7 = TableThree().details[6]
    let item8 = TableThree().details[7]
    let item9 = TableThree().details[8]
    let item10 = TableThree().details[9]
    let item11 = TableThree().details[10]
    let item12 = TableThree().details[11]
    let item13 = TableThree().details[12]
    let item14 = TableThree().details[13]
    let item15 = TableThree().details[14]
    let item16 = TableThree().details[15]
    let item17 = TableThree().details[16]
    let item18  = TableThree().details[17]
    let item19  = TableThree().details[18]
    let item20  = TableThree().details[19]
    let item21  = TableThree().details[20]
    let item22  = TableThree().details[21]
    
    
    
    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail3 = self.detailItem {
            if let UITextView = self.detailDescriptionTextView {
                UITextView.text = detail3.description
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        detailDescriptionTextView.delegate = self
        
        initAdmobBanner()
        interstitialThree = createAndLoadInterstitial()
        AdvertController()
        
        
        let url = Bundle.main.url(forResource: "sleep", withExtension: "mp3")
        
        do{
        
            player = try AVAudioPlayer(contentsOf: url!)
            
            guard let player = player
                else {
              return
            
            }
            
            player.prepareToPlay()
 
        } catch let error {
        
        print(error.localizedDescription)
            
        }
        
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
        interstitialThree = createAndLoadInterstitial()
    }
    
    func randomNumberInRange(lower:Int ,upper:Int) -> Int {
    
    return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    
    
    }
    
    func randomPresentationAd (oneIn:Int){
    
    let randomNumber = randomNumberInRange(lower:1 , upper: Constants.adRate)
        print("Random Number :\(randomNumber)")
        
        if (randomNumber == 1) {
            
            if(interstitialThree != nil) {
            
                if interstitialThree!.isReady {
                
                interstitialThree.present(fromRootViewController:self)
                } else {
                
                print("Ad is not ready")
                    
                }
            
            }
        
        }
    
    
    }
    

    @IBAction func AdThreeAction(_ sender: UIButton) {
   
      randomPresentationAd(oneIn: Constants.adRate)
        
        if(player?.isPlaying)! {
        
        player?.stop()
        } else {
        
        player?.play()
            
        }
        
    }
    
    func AdvertController () {
        
        if detailDescriptionTextView.text == item1 || detailDescriptionTextView.text == item6 || detailDescriptionTextView.text == item9 || detailDescriptionTextView.text == item16 || detailDescriptionTextView.text == item20  {
            
            AdThreeBut.isHidden = false
            
        }
        
    }

    @IBAction func shareTwo(_ sender: UIButton) {
        
        randomPresentationAd(oneIn: Constants.adRate)
        
        
    
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

