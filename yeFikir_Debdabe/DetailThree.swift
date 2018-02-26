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
    var adMobBannerView : GADBannerView!
    var player : AVAudioPlayer?
    var detailThreeContent = ""
    
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
        
        if let detail3 = self.detailItem {
            if let UITextView = self.detailDescriptionTextView {
                UITextView.text = detail3.description
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.configureView()
        bannerAdController()
        addBannerViewToView(adMobBannerView)
        detailDescriptionTextView.delegate = self
        interstitialThree = createAndLoadInterstitial()
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
    
    
    @IBAction func AdThreeAction(_ sender: UIButton) {
        
        randomPresentationAd(oneIn: Constants.adRate)
        
        if(player?.isPlaying)! {
            
            player?.stop()
            
        } else {
            
            player?.play()
            
        }
        
    }
    
    
    @IBAction func shareTwo(_ sender: UIButton) {
        
        randomPresentationAd(oneIn: Constants.adRate)
        
        switch detailDescriptionTextView.text {
            
        case item1:
            detailThreeContent = item1
            
        case item2:
            detailThreeContent = item2
            
        case item3:
            detailThreeContent = item3
            
            
        case item4:
            detailThreeContent = item4
            
        case item5:
            detailThreeContent = item5
            
        case item6:
            detailThreeContent = item6
            
        case item7:
            detailThreeContent = item7
            
        case item8:
            detailThreeContent = item8
            
        case item9:
            detailThreeContent = item9
            
        case item10:
            detailThreeContent = item10
            
        case item11:
            detailThreeContent = item11
            
        case item12:
            detailThreeContent = item12
            
        case item13:
            detailThreeContent = item13
            
        case item14:
            detailThreeContent = item14
            
        case item15:
            detailThreeContent = item15
            
        case item16:
            detailThreeContent = item16
            
        case item17:
            detailThreeContent = item17
            
        case item18:
            detailThreeContent = item18
            
        case item19:
            detailThreeContent = item19
            
        case item20:
            detailThreeContent = item20
            
        case item21:
            detailThreeContent = item21
            
        case item22:
            detailThreeContent = item22
            
        default:
            print("Please Check the code")
        }
        
        let activityViewController = UIActivityViewController(activityItems:[detailThreeContent], applicationActivities:nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController,animated:true,completion:nil)
        activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
        
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

