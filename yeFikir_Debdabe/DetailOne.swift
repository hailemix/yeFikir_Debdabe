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

class DetailOne: UIViewController,UITextViewDelegate,UIScrollViewDelegate,GADBannerViewDelegate,GADInterstitialDelegate {
    
    
    @IBOutlet weak var detailDescriptionTextView: UITextView!
    @IBOutlet weak var myBut: UIButton!
    @IBOutlet weak var Advert: UIButton!
    
    static var player : AVAudioPlayer?
    
    var interstitialOne : GADInterstitial!
    var adMobBannerView : GADBannerView!
    var detailOneContent : String = ""
    var textIndex = 0
    var detailItem: String? {
        
        didSet {
            
            self.configureView()
        }
    }
    
    
    enum failed : Error {
        
        case failedCode(String)
        
    }
    
    let item1 = TableOne().object[0]
    let item2 = TableOne().object[1]
    let item3 = TableOne().object[2]
    let item4 = TableOne().object[3]
    let item5 = TableOne().object[4]
    let item6 = TableOne().object[5]
    let item7 = TableOne().object[6]
    let item8 = TableOne().object[7]
    let item9 = TableOne().object[8]
    let item10 = TableOne().object[9]
    let item11 = TableOne().object[10]
    
    struct Constants {
        
        static let adRate = 3
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        bannerAdController()
        addBannerViewToView(adMobBannerView)
        detailDescriptionTextView.delegate = self
        interstitialOne = createAndLoadInterstitial()
        DetailOne.musicControl()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    static func musicControl() {
        
        let url = Bundle.main.url(forResource: "sleep", withExtension: "mp3")
        
        do {
            
            player = try AVAudioPlayer(contentsOf: url!)
            
            guard let myPlayer = player
                else
            {
                return
            }
            
            myPlayer.prepareToPlay()
            
        } catch let error {
            
            print(error.localizedDescription)
            
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
        interstitialOne = createAndLoadInterstitial()
        
    }
    
    func randomNumberInRange(lower:Int,upper:Int) -> Int {
        
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
        
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
    
    func randomPresentationAd (oneIn:Int) {
        
        let randomNumber = randomNumberInRange(lower: 1, upper: Constants.adRate)
        print("Random Number :\(randomNumber)")
        
        if(randomNumber == 1){
            
            if(interstitialOne != nil) {
                
                if interstitialOne!.isReady{
                    
                    interstitialOne.present(fromRootViewController: self)
                    
                } else {
                    
                    print("Ad is not ready")
                    
                }
                
            }
        }
        
    }

    func configureView() {
        
        if let detail = self.detailItem {
            if let UITextView = self.detailDescriptionTextView {
                UITextView.text = detail.description
                
            }
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        
        switch detailDescriptionTextView.text {
            
        case item3,item7,item9:
            
            Advert.isHidden = true
            
        default:
            
            myBut.isHidden = true
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        myBut.isHidden = false
        
        switch detailDescriptionTextView.text {
            
        case item3, item7, item9:
            
            Advert.isHidden = false
            
        case item1, item3, item5, item9, item11:
            
            randomPresentationAd(oneIn: Constants.adRate)
            
        default:
            print(failed.failedCode("Error is found in the scrollVew func.Please check!"))
        }
        
    }
    
    @IBAction func myAdvert(_ sender: UIButton) {
        
        randomPresentationAd(oneIn: Constants.adRate)
        
        if(DetailOne.player?.isPlaying)! {
            
            DetailOne.player?.stop()
            
        } else {
            
            DetailOne.player?.play()
            
        }
        
    }
    
    @IBAction func myShare(_ sender: UIButton) {
        
        randomPresentationAd(oneIn: Constants.adRate)
        
        self.detailDescriptionTextView.text = TableOne().object[textIndex]
        let activityViewController = UIActivityViewController(activityItems:[detailOneContent], applicationActivities:nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController,animated:true,completion:nil)
          activityViewController.excludedActivityTypes = [UIActivity.ActivityType.assignToContact,UIActivity.ActivityType.saveToCameraRoll,UIActivity.ActivityType.copyToPasteboard]
          self.present(activityViewController,animated:true,completion:nil)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
}

