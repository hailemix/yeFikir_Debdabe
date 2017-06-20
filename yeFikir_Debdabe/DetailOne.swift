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
   
    
    @IBAction func shareBtnOne(_ sender: UIButton) {
        
        let details = ["በህይወት ልምድ \n\n ዉድ ኑሮ(እዉነትም ዉድ ነህ!) እንዴት ነህ? እንደኮረሪማ ነጋዴ የተከልነዉን ኮረሪማ ማንነታችንን እየቆፈርን ይኸዉ አለን! ኑሮ ንሮ በጣም የምናዝንበት ነገር መብዛቱና መርከሱ ካንተ መናር ጋር በተቃራኒ የቆመ ቢሆንም የልባችንን በኪሳችን ይዘን አለንልህ… አንድ ዳቦ ከ 20 ሳንቲም ተነስቶ 10 ብር መግባቱ  እኛንም ከ ሃያዎቹ እድሜያችን ወደ አስር አመት ዝቅ እንድናደርገዉ ረድቶናል ፤የቤት ሽያጭ ከ 10000 ብር ወደ ሚሊየን ብር መግባቱ እኛንም ከ 10 ሺህ ቀዳዶች ወደ ሚልየን የቀለብ ቀዳዶችን የመድፈን  ውስብስብና ልዩ ጥበብ ባለቤት አርጎናል፡፡አንተ ከፍ እያልክ ፣እየጨመርክ፣እየተወሳሰበክ ስትሄድ…የኛ የሃሳብ ምጥቀት ለምን እንዳልጨመረ አልገባንም! እየዘመንን፣ፋሽን እየተከተልን፣እስታይል በስታይል፣ ፌስ ቡክ በፌስቡክ እየሆንን አለን፡፡አዎን ምክንያት ልንሰጣቸዉ የምንችላቸዉ ሚሊየን ሃሳበች ተደምረዉ አስር ብር  አልሆኑንም! አዎን ልቅምቃሚ ወሬዎቻችን ከጀበና ቡና ስንነሳ  ተበታትነዉ ይቀራሉ! ምን እናርግ!ዉድ ኑሮ እንጀራ ከአንድ ብር ከሃምሳ፣ አምስት ብር ሲገባ የኛ አእምሮ ግን ያዉ እንዳስቀመጥነዉ ነዉ፡፡ የአእምሮአችን መሰላል በትምህርት ልቀት፣በህይወት ልምድ፣ በ ኮንዶሚኒየም ወይም ቀበሌ ቤት ዉስጥ ታጅበን በመኖር ልነለዉጠዉ አልቻልንም፡፡ነገር ግን ያንተን መተኮስንደቲያትር ተመልካች አስተሳሰቦቻችንን ሳንፈትሽ  የምናሽካካ፣የምንተምም፣የምናፏጭ ሰላማዊ ህጻናቶች ነን፡፡አንዱ ሲቀልድ ‹የአዲስ አበባ ህዝብ ቁጥር ስድስት ሚሊየን ሲሆን ህፃናቱን ካልቆጠርናቸዉ ግን 1 ሚሊየን አይሞላም!› ይገርማል ልጅነት ሳይለቀን ቢዝነስ እንጀምራለን፣እሽክርክሮሽ እየተጫወትን እናጋባለን እንግባባለን፣ ጢባጢቤ እያልን ሽምግልናችን ይወረናል…በመጨረሻ የምንመኘዉ ነገር  ልክ እንዳንተ እንደግ፣ከፍ ከፍ አሁንም ከፍ ያርገን  አሜን..(እዚህ ሃገር ሁሉም  ነገር ምኞት ብቻ ነዉ ለምትሉ ሰዎች ወዮላችሁ! አለች የጀበና ቡና!)መልስህን ከስር ባለዉ ፖስታ ሳጥን ቁጥር እንጠብቃለን ",
                       "John and Mary have been failing in love for more than a year...",
                       "This is nothing wrong to love a girl and being broken","The first thing that you realise in your single life is he hands of the lord,Jesus coming into you",
                       "A great romatic love I have ever heared is this:...","The next challenge in life is..."]
        
        
        let textToShare = [details]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities:nil)
        
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        
        activityViewController.excludedActivityTypes = [UIActivityType.airDrop,UIActivityType.copyToPasteboard,UIActivityType.mail,UIActivityType.assignToContact]
        
        self.present(activityViewController,animated:true,completion:nil)
        
        
        
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

