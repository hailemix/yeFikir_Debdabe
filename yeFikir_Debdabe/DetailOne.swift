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
    
    var interstitialOne : GADInterstitial!
    var adMobBannerView : GADBannerView!
    var player : AVAudioPlayer?
    var detailOneContent : String = ""
    enum failed : Error {
        
        case failedCode(String)
        
    }
    
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
        musicControl()
       
    }
    
    func musicControl(){
        
        let url = Bundle.main.url(forResource: "sleep", withExtension: "mp3")
        
        do {
            
            player = try AVAudioPlayer(contentsOf: url!)
            
            guard let player = player
                else
            {
                return
            }
            
            player.prepareToPlay()
            
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
                               toItem: bottomLayoutGuide,
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
    
    
    @IBAction func myAdvert(_ sender: UIButton) {
        
        randomPresentationAd(oneIn: Constants.adRate)
        
        if(player?.isPlaying)! {
            
            player?.stop()
            
        } else {
            
            player?.play()
            
        }
        
    }
    
    
    @IBAction func myShare(_ sender: UIButton) {
        
        randomPresentationAd(oneIn: Constants.adRate)
        
        
        switch detailDescriptionTextView.text {
            
        case item1:
            detailOneContent = item1
            
        case item2:
            detailOneContent = item2
            
        case item3:
            detailOneContent = item3
            
        case item4:
            detailOneContent = item4
            
        case item5:
            detailOneContent = item5
            
        case item6:
            detailOneContent = item6
            
        case item7:
            detailOneContent = item7
            
        case item8:
            detailOneContent = item8
            
        case item9:
            detailOneContent = item9
            
        case item10:
            detailOneContent = item10
            
        case item11:
            detailOneContent = item11
            
        default:
            print("Please Check the code")
        }
        
        let activityViewController = UIActivityViewController(activityItems:[detailOneContent], applicationActivities:nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController,animated:true,completion:nil)
        activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
        
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
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        

    }
    
    var detailItem: String? {
        
        didSet {
            
            self.configureView()
        }
    }
    
    
}

