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
    
    @IBOutlet weak var detailDescriptionTextView: UITextView!
    @IBOutlet weak var myBut: UIButton!
    
    
    var interstitialThree : GADInterstitial!
    var adMobBannerView : GADBannerView!
    var detailThreeContent = ""
    var detailItem: String? { didSet {self.configureView()}}
    
    enum failed: Error {case failedCode(String)}
    
    struct Constants {
        
        static let adRate = 3
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        bannerAdController()
        addBannerViewToView(adMobBannerView)
        detailDescriptionTextView.delegate = self
        interstitialThree = createAndLoadInterstitial()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.detailDescriptionTextView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func addBannerViewToView(_ bannerView : GADBannerView){
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(adMobBannerView)
        view.addConstraints([
            
            NSLayoutConstraint(item:bannerView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: view,
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
        interstitialThree = createAndLoadInterstitial()
    }
    
    func randomNumberInRange(lower:Int ,upper:Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    func randomPresentationAd (oneIn:Int)  {
        
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
    
    func configureView() {
        
        if let detail3 = self.detailItem {
            if let UITextView = self.detailDescriptionTextView {
                UITextView.text = detail3.description
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if(scrollView.contentOffset.y + 1) >= (scrollView.contentSize.height - scrollView.frame.size.height) {
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: {_ in
                
                self.showHideButtons(isShareButtonHiding: false)
                self.randomPresentationAd(oneIn: Constants.adRate)
            })
            
        } else {
            
            self.showHideButtons(isShareButtonHiding: true)
        }
    }
    
    
    func showHideButtons(isShareButtonHiding: Bool) {
        
        myBut.isHidden = isShareButtonHiding
    }
    
    
    @IBAction func shareTwo(_ sender: UIButton) {
        
        randomPresentationAd(oneIn: Constants.adRate)
        
        let activityViewController = UIActivityViewController(activityItems:[TableThree.contentText], applicationActivities:nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController,animated:true,completion:nil)
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.assignToContact,UIActivity.ActivityType.saveToCameraRoll,UIActivity.ActivityType.copyToPasteboard]
        self.present(activityViewController,animated:true,completion:nil)
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
}

