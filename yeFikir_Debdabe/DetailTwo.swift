//
//  DetailOne.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.

/* Don't forget to add the delegates in the class extension,otherwise it won't work and Becareful of segues(delete their relationships) when copy-pasting buttons from one viewcontroller to another view controller
 */

import UIKit
import GoogleMobileAds
import AVFoundation



class DetailTwo: UIViewController,UITextViewDelegate,UIScrollViewDelegate,GADBannerViewDelegate,GADInterstitialDelegate {
    
    var interstitialTwo : GADInterstitial!
    var adMobBannerView : GADBannerView!
    var detailTwoContent = ""
    var detailItem: String? {
        didSet {
            
            self.configureView()
            
        }
    }
    
    @IBOutlet weak var detailDescriptionTextView: UITextView!
    @IBOutlet weak var myBut: UIButton!
    @IBOutlet weak var AdvertTwo: UIButton!
    
    enum detailTwoFailed : Error {
        
        case codeError(String)
        
    }
    
    struct Constants{
        
        static let adRate = 3
        
    }
    
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
    let item32  = TableTwo().details[31]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        
        detailDescriptionTextView.delegate = self
        bannerAdController()
        addBannerViewToView(adMobBannerView)
        interstitialTwo = createAndLoadInterstitial()
        DetailOne.musicControl()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configureView() {
        
        if let detail2 = self.detailItem {
            if let UITextView = self.detailDescriptionTextView {
                UITextView.text = detail2.description
                
            }
        }
    }
    
    func bannerAdController() {
        
        adMobBannerView = GADBannerView(adSize: kGADAdSizeBanner)
        adMobBannerView.adUnitID = "ca-app-pub-9156727777369518/1529726170"
        adMobBannerView.rootViewController = self
        adMobBannerView.delegate = self
        adMobBannerView.load(GADRequest())
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        
   
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-9156727777369518/3772746133")
        interstitial.load(GADRequest())
        interstitial.delegate = self
        return interstitial
        
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitialTwo = createAndLoadInterstitial()
    }
    
    func randomNumberInRange(lower:Int, upper:Int) -> Int {
        
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
        
    }
    
    func randomPresentationAd(oneIn:Int) {
        
        let randomNumber = randomNumberInRange(lower:1 ,upper:Constants.adRate)
        print("Random Number:\(randomNumber)")
        
        if(randomNumber == 1) {
            
            if(interstitialTwo != nil){
                
                if interstitialTwo!.isReady {
                    interstitialTwo.present(fromRootViewController: self)
                    
                } else {
                    
                    print("Ad is not ready")
                    
                }
            }
        }
    }
    
    func addBannerViewToView(_ bannerView : GADBannerView){
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(adMobBannerView)
        view.addConstraints([
            
            NSLayoutConstraint(item:bannerView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: view.safeAreaLayoutGuide.bottomAnchor,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item:bannerView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0) ])
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        myBut.isHidden = true
        
        switch detailDescriptionTextView.text {
            
        case item1,item2, item5, item12, item19, item18, item28:
            
            AdvertTwo.isHidden = true
            
        default:
            print(detailTwoFailed.codeError("Please Check the code!"))
        }
        
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        myBut.isHidden = false
        
        switch detailDescriptionTextView.text {
            
        case item1,item2, item5, item12, item19, item18, item28:
            
            AdvertTwo.isHidden = false
            
        case item2, item6, item13, item17, item20, item25, item31:
            
            randomPresentationAd(oneIn: Constants.adRate)
            
        default:
            print(detailTwoFailed.codeError("Please Check the code!"))
        }
        
    }
    
    @IBAction func AdvertTwoButton(_ sender:UIButton) {
        
        randomPresentationAd(oneIn: Constants.adRate)
        
        if(DetailOne.player?.isPlaying)!{
            
            DetailOne.player?.stop()
        }  else {
            
            DetailOne.player?.play()
            
        }
        
    }
    
    @IBAction func shareButton(_ sender: UIButton) {
        
        
        randomPresentationAd(oneIn: Constants.adRate)
        
        switch detailDescriptionTextView.text {
            
        case item1:
            detailTwoContent = item1
            
        case item2:
            detailTwoContent = item2
            
        case item3:
            detailTwoContent = item3
            
        case item4:
            detailTwoContent = item4
            
        case item5:
            detailTwoContent = item5
            
        case item6:
            detailTwoContent = item6
            
        case item7:
            detailTwoContent = item7
            
        case item8:
            detailTwoContent = item8
            
        case item9:
            detailTwoContent = item9
            
        case item10:
            detailTwoContent = item10
            
        case item11:
            detailTwoContent = item11
            
        case item12:
            detailTwoContent = item12
            
        case item13:
            detailTwoContent = item13
            
        case item14:
            detailTwoContent = item14
            
        case item15:
            detailTwoContent = item15
            
        case item16:
            detailTwoContent = item16
            
        case item17:
            detailTwoContent = item17
            
        case item18:
            detailTwoContent = item18
            
        case item19:
            detailTwoContent = item19
            
        case item20:
            detailTwoContent = item20
            
        case item21:
            detailTwoContent = item21
            
        case item22:
            detailTwoContent = item22
            
        case item23:
            detailTwoContent = item23
            
        case item24:
            detailTwoContent = item24
            
        case item25:
            detailTwoContent = item25
            
        case item26:
            detailTwoContent = item26
            
        case item27:
            detailTwoContent = item27
            
        case item28:
            detailTwoContent = item28
            
        case item29:
            detailTwoContent = item29
            
        case item30:
            detailTwoContent = item30
            
        case item31:
            detailTwoContent = item31
            
        case item32:
            detailTwoContent = item32
            
        default:
            print("Please Check the code")
        }
        
        let activityViewController = UIActivityViewController(activityItems:[detailTwoContent], applicationActivities:nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController,animated:true,completion:nil)
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.airDrop,UIActivity.ActivityType.copyToPasteboard,UIActivity.ActivityType.mail,UIActivity.ActivityType.assignToContact]
        
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
  
    
}

