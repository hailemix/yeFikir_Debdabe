//
//  ViewController.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit


class TableTwo: UITableViewController{
    
    
    var detailViewController: DetailTwo? = nil
    var contentArray = [String]()
    var object = [String]()
    static var contentText = ""
    var objects = ["ማትስ ተማሪ ለፍቅረኛዋ የፃፈችዉ ደብዳቤ", "ሰዉ አይደለሁማ!","የ‹ለምን አንተን ወደድኩህ?›ፍልስፍና","የህግ ተመራቂ ለፍቅረኛዉ የፃፈዉ መልእክት","አምናለሁ","ትዝ ሲለኝ…","አዲስ አበቤና ኑሮ","ወደፊት!","ይገባታል...","ለምወድህና ለማፈቅርህ ብር...","አጭር መልእክት","ለብቻሽ አንብቢዉ","ክትባት ዉሰጂ"," ይድረስ ለሜካኒካል ኢንጅነሯ… ","ቃል እገባለሁ!","ልጅነቴ","ሞትና እሹሩሩ","ደብዳቤ 6","ምክር","ዉዴ","አቶ ገንዘብ ","ለምወድህ ካለህበት","ፍቅር ቆሎ አይደለም","ብልጣብልጥነትና የፍቅር ፍርፋሪ","ያማርኛ የፍቅር ፊልምና እቃቃ","RC1","መዋጋት ቀለለኝ እህህ ከበደኝ","ፍቅር በድውታ","*** ደራሲዉ ***","ህይወት ስትሟዘዝ…ስትጣደፍ","ዲያስፖራና የፍቅር ደብዳቤ","ቫለንታይን ዴይና ባላንጣዎቼ"]
    
    enum jsonError : Error {
        
        case failed(String)
    }
    
    
    let image1 = UIImage(named: "1")
    let image2 = UIImage(named: "2")
    let image3 = UIImage(named: "3")
    let image4 = UIImage(named: "4")
    let image5 = UIImage(named: "5")
    let image6 = UIImage(named: "6")
    let image7 = UIImage(named: "7")
    let image8 = UIImage(named: "8")
    let image9 = UIImage(named: "9")
    let image10 = UIImage(named: "10")
    let image11 = UIImage(named: "11")
    let image12 = UIImage(named: "12")
    let image13 = UIImage(named: "13")
    let image14 = UIImage(named: "14")
    let image15 = UIImage(named: "15")
    let image16 = UIImage(named: "16")
    let image17 = UIImage(named: "17")
    let image18 = UIImage(named: "18")
    let image19 = UIImage(named: "19")
    let image20 = UIImage(named: "20")
    let image21 = UIImage(named: "21")
    let image22 = UIImage(named: "22")
    let image23 = UIImage(named: "23")
    let image24 = UIImage(named: "24")
    let image25 = UIImage(named: "25")
    let image26 = UIImage(named: "26")
    let image27 = UIImage(named: "27")
    let image28 = UIImage(named: "28")
    let image29 = UIImage(named: "29")
    let image30 = UIImage(named: "30")
    let image31 = UIImage(named: "31")
    let image32 = UIImage(named: "32")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailTwo
            
        }
    }
    
    func retrieveFromJson() -> [String] {
        
        do {
            
            if let file = Bundle.main.url(forResource: "contents",
                                          withExtension: "json"){
                let data = try Data(contentsOf: file)
                let myArray = try JSONSerialization.jsonObject(with: data, options:[])
                
                if let contentDictionary = myArray as? [String: Any] {
                    contentArray = (contentDictionary ["contentB"] as?
                    [String])!
                }
            }
        } catch {
            print(jsonError.failed("Failed to Serialize Json file."))
        }
        
        return contentArray
    }
    
    
    override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let object = retrieveFromJson()
        if segue.identifier == "showDetail2" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailTwo
                controller.detailItem = object[indexPath.row]
                TableTwo.contentText = controller.detailItem!
                
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2" , for: indexPath)
        let object = objects[indexPath.row]
        
        cell.textLabel!.text = object
      
        if(indexPath.row == 0) {
            
            cell.imageView!.image = image1
            
        }
        else if(indexPath.row == 1)
        {
            cell.imageView!.image = image2
        
        }
            
        else if (indexPath.row == 2)
        {
            cell.imageView!.image = image3
            
            
        }
        else if (indexPath.row == 3)
            
        {
            cell.imageView!.image = image4
            
        }
            
        else if (indexPath.row == 4)
            
        {
            cell.imageView!.image = image5
            
        }
        else if (indexPath.row == 5)
        {
            cell.imageView!.image = image6
            
        }
        else if (indexPath.row == 6)
            
        {
            cell.imageView!.image = image7
            
        }
        
        else if (indexPath.row == 7)
        {
        
        
        cell.imageView!.image = image8
        
        }
        
        else if (indexPath.row == 8) {
        
        cell.imageView!.image = image9
        
        }
        
        else if(indexPath.row == 9 ) {
        
        cell.imageView!.image = image10
        
        }
        else if(indexPath.row == 10 ) {
            
            cell.imageView!.image = image11
            
        }
        else if(indexPath.row == 11 ) {
            
            cell.imageView!.image = image12
            
        }
        else if(indexPath.row == 12 ) {
            
            cell.imageView!.image = image13
            
        }
        else if(indexPath.row == 13) {
            
            cell.imageView!.image = image14
            
        }
        
        else if(indexPath.row == 14 ) {
            
            cell.imageView!.image = image15
            
        }
        
        else if(indexPath.row == 15 ) {
            
            cell.imageView!.image = image16
            
        }
        
        else if(indexPath.row == 16) {
            
            cell.imageView!.image = image17
            
        }
        
        else if(indexPath.row == 17 ) {
            
            cell.imageView!.image = image18
            
        }
        
        else if(indexPath.row == 18) {
            
            cell.imageView!.image = image19
            
        }
        
        
        else if(indexPath.row == 19) {
            
            cell.imageView!.image = image20
            
        }
        
        else if(indexPath.row == 20 ) {
            
            cell.imageView!.image = image21
            
        }
        
        else if(indexPath.row == 21 ) {
            
            cell.imageView!.image = image22
            
        }
        
        else if(indexPath.row == 22) {
            
            cell.imageView!.image = image23
            
        }
        else if(indexPath.row == 23 ) {
            
            cell.imageView!.image = image24
            
        }
        else if(indexPath.row == 24) {
            
            cell.imageView!.image = image25
            
        }
        
        else if(indexPath.row == 25 ) {
            
            cell.imageView!.image = image26
            
        }
            
        else if(indexPath.row == 26) {
            
            cell.imageView!.image = image27
        }
        
        else if(indexPath.row == 27) {
            
            cell.imageView!.image = image28
            
        }
        else if(indexPath.row == 28) {
            
            cell.imageView!.image = image29
            
        }
        else if(indexPath.row == 29) {
            
            cell.imageView!.image = image30
            
        }
        else if(indexPath.row == 30) {
            
            cell.imageView!.image = image31
            
        } else if (indexPath.row == 31){
        
           cell.imageView!.image = image32
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    
}




