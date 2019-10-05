//
//  ViewController.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit


class TableThree: UITableViewController{
    
    
    var detailViewController: DetailThree? = nil
    var contentArray = [String]()
    var contentString = ""
    var object = [String]()
    static var contentText = ""
    var objects = ["ዉዱ ድህነቴ","ይንደድ የታባቱ!","በህልሜ","ዝናሽና ክብርሽ","ዉይ አንቺ!","ኪኪኪ!","ይታየኛል ለኔ","ፍቅርን ፍለጋ"," ቆይታ","ዲቪሽ","ተዉ ሆዴ","አይ አንተ!",
                   "እድሜሽ","ቁማሩን በልተሻል","ሰዉ እንዳለ..አወቅኩ","ፐፑፒፓ","ፍቅርሽና ፍቅሬ","ተረት","አልቻልኩም","ፍቅር ድሮ ድሮ..","ይሻለኛል",
                   "መነሻዉ..","እመጣለሁ"]

    enum jsonError: Error {
        
        case failed(String)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailThree
            
        }
    }
    
    func retrieveFromJson() -> [String] {
        
        do {
            
            if let file = Bundle.main.url(forResource: "contents", withExtension: "json"){
                let data = try Data(contentsOf: file)
                let myArray = try JSONSerialization.jsonObject(with: data, options:[.allowFragments])
                
                if let contentDictionary = myArray as? [String: Any]{
                    
                    contentArray = (contentDictionary["contentC"] as? [String])!
                }
            }
        } catch {
            
            print(jsonError.failed("Failed to Serialize Json file"))
        }
        return contentArray
    }
    
    override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        object = retrieveFromJson()
        if segue.identifier == "showDetail3" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailThree
                controller.detailItem = object[indexPath.row]
                TableThree.contentText = controller.detailItem!
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3" , for: indexPath)
        let object = objects[indexPath.row]
        cell.textLabel!.text = object
        cell.imageView!.image = UIImage(named: "thirdImage")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
 
}




