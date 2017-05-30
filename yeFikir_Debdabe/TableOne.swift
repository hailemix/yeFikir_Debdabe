//
//  ViewController.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit
import CoreData

class TableOne: UITableViewController{
    

    var detailViewController: DetailOne? = nil
    var objects = ["የኔ ገላ ","ሰማይ ቤት","ሰዉ በመፋቀር ","ይኸዉ ነዉ!","እንደሚሰማኝ ","የምናፍቅሽ"]
    
    let image1 = UIImage(named: "a1")
    let image2 = UIImage(named: "a2")
    let image3 = UIImage(named: "a3")
    let image4 = UIImage(named: "a4")
    let image5 = UIImage(named: "a5")
    let image6 = UIImage(named: "a6")
    let image7 = UIImage(named: "a58")
    
    
    
    
    var details = ["በህይወት ልምድ \n\n ዉድ ኑሮ(እዉነትም ዉድ ነህ!) እንዴት ነህ? እንደኮረሪማ ነጋዴ የተከልነዉን ኮረሪማ ማንነታችንን እየቆፈርን ይኸዉ አለን! ኑሮ ንሮ በጣም የምናዝንበት ነገር መብዛቱና መርከሱ ካንተ መናር ጋር በተቃራኒ የቆመ ቢሆንም የልባችንን በኪሳችን ይዘን አለንልህ… አንድ ዳቦ ከ 20 ሳንቲም ተነስቶ 10 ብር መግባቱ  እኛንም ከ ሃያዎቹ እድሜያችን ወደ አስር አመት ዝቅ እንድናደርገዉ ረድቶናል ፤የቤት ሽያጭ ከ 10000 ብር ወደ ሚሊየን ብር መግባቱ እኛንም ከ 10 ሺህ ቀዳዶች ወደ ሚልየን የቀለብ ቀዳዶችን የመድፈን  ውስብስብና ልዩ ጥበብ ባለቤት አርጎናል፡፡አንተ ከፍ እያልክ ፣እየጨመርክ፣እየተወሳሰበክ ስትሄድ…የኛ የሃሳብ ምጥቀት ለምን እንዳልጨመረ አልገባንም! እየዘመንን፣ፋሽን እየተከተልን፣እስታይል በስታይል፣ ፌስ ቡክ በፌስቡክ እየሆንን አለን፡፡አዎን ምክንያት ልንሰጣቸዉ የምንችላቸዉ ሚሊየን ሃሳበች ተደምረዉ አስር ብር  አልሆኑንም! አዎን ልቅምቃሚ ወሬዎቻችን ከጀበና ቡና ስንነሳ  ተበታትነዉ ይቀራሉ! ምን እናርግ!ዉድ ኑሮ እንጀራ ከአንድ ብር ከሃምሳ፣ አምስት ብር ሲገባ የኛ አእምሮ ግን ያዉ እንዳስቀመጥነዉ ነዉ፡፡ የአእምሮአችን መሰላል በትምህርት ልቀት፣በህይወት ልምድ፣ በ ኮንዶሚኒየም ወይም ቀበሌ ቤት ዉስጥ ታጅበን በመኖር ልነለዉጠዉ አልቻልንም፡፡ነገር ግን ያንተን መተኮስንደቲያትር ተመልካች አስተሳሰቦቻችንን ሳንፈትሽ  የምናሽካካ፣የምንተምም፣የምናፏጭ ሰላማዊ ህጻናቶች ነን፡፡አንዱ ሲቀልድ ‹የአዲስ አበባ ህዝብ ቁጥር ስድስት ሚሊየን ሲሆን ህፃናቱን ካልቆጠርናቸዉ ግን 1 ሚሊየን አይሞላም!› ይገርማል ልጅነት ሳይለቀን ቢዝነስ እንጀምራለን፣እሽክርክሮሽ እየተጫወትን እናጋባለን እንግባባለን፣ ጢባጢቤ እያልን ሽምግልናችን ይወረናል…በመጨረሻ የምንመኘዉ ነገር  ልክ እንዳንተ እንደግ፣ከፍ ከፍ አሁንም ከፍ ያርገን  አሜን..(እዚህ ሃገር ሁሉም  ነገር ምኞት ብቻ ነዉ ለምትሉ ሰዎች ወዮላችሁ! አለች የጀበና ቡና!)መልስህን ከስር ባለዉ ፖስታ ሳጥን ቁጥር እንጠብቃለን ",
                   "John and Mary have been failing in love for more than a year...",
                   "This is nothing wrong to love a girl and being broken","The first thing that you realise in your single life is he hands of the lord,Jesus coming into you",
                   "A great romatic love I have ever heared is this:...","The next challenge in life is..."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailOne
        }
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Segues
    
    override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = details[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailOne
                controller.detailItem = object as AnyObject?
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
  
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath)
        let object = objects[indexPath.row]
        
        cell.textLabel!.text = object
        
        
        
        if(indexPath.row == 0) {
            
            cell.imageView!.image = image1
            
            
        }
        else if(indexPath.row == 1)
        {
            
            cell.imageView!.image = image3
            
            
        }
            
        else if (indexPath.row == 2)
        {
            cell.imageView!.image = image5
            
            
            
        }
        else if (indexPath.row == 3)
            
        {
            cell.imageView!.image = image6
            
        }
            
        else if (indexPath.row == 4)
            
        {
            cell.imageView!.image = image7
            
        }
        else if (indexPath.row == 5)
        {
            cell.imageView!.image = image1
            
        }
        else if (indexPath.row == 6)
            
        {
            cell.imageView!.image = image3
            
        }
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
}




