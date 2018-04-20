//
//  ViewController.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit


class TableTwo: UITableViewController {
    
    
    var detailViewController: DetailTwo? = nil
    var contentArray = [String]()
    var object = [String]()
    static var contentText = ""
    var objects = ["ማትስ ተማሪ ለፍቅረኛዋ የፃፈችዉ ደብዳቤ", "ሰዉ አይደለሁማ!","የ‹ለምን አንተን ወደድኩህ?›ፍልስፍና","የህግ ተመራቂ ለፍቅረኛዉ የፃፈዉ መልእክት","አምናለሁ","ትዝ ሲለኝ…","አዲስ አበቤና ኑሮ","ወደፊት!","ይገባታል...","ለምወድህና ለማፈቅርህ ብር...","አጭር መልእክት","ለብቻሽ አንብቢዉ","ክትባት ዉሰጂ"," ይድረስ ለሜካኒካል ኢንጅነሯ… ","ቃል እገባለሁ!","ልጅነቴ","ሞትና እሹሩሩ","ደብዳቤ 6","ምክር","ዉዴ","አቶ ገንዘብ ","ለምወድህ ካለህበት","ፍቅር ቆሎ አይደለም","ብልጣብልጥነትና የፍቅር ፍርፋሪ","ያማርኛ የፍቅር ፊልምና እቃቃ","RC1","መዋጋት ቀለለኝ እህህ ከበደኝ","ፍቅር በድውታ","*** ደራሲዉ ***","ህይወት ስትሟዘዝ…ስትጣደፍ","ዲያስፖራና የፍቅር ደብዳቤ","ቫለንታይን ዴይና ባላንጣዎቼ"]
    
    enum jsonError : Error {
        
        case failed(String)
    }
    
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
        cell.imageView!.image = UIImage(named: "secondImage")
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}




