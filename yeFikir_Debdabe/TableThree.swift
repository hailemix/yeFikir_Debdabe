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
    var objects = ["ይንደድ የታባቱ!","በህልሜ","ዝናሽና ክብርሽ","ዉይ አንቺ!","ኪኪኪ...","ይታየኛል ለኔ","ፍቅርን ፍለጋ"," ቆይታ","ዲቪሽ","ተዉ ሆዴ ተዉ","አይ አንተ!",
                   "እድሜሽ","ቁማሩን በልተሻል","ሰዉ እንዳለ..አወቅኩ","ፐፑፒፓ","ፍቅርሽና ፍቅሬ","ተረት","አልቻልኩም","ፍቅር ድሮ ድሮ..","ይሻለኛል",
                   "መነሻዉ..","እመጣለሁ"]
    
    let image1 = UIImage(named: "b1")
    let image2 = UIImage(named: "b2")
    let image3 = UIImage(named: "b3")
    let image4 = UIImage(named: "b4")
    let image5 = UIImage(named: "b5")
    let image6 = UIImage(named: "b6")
    let image7 = UIImage(named: "b7")
    let image8 = UIImage(named: "b8")
    let image9 = UIImage(named: "b9")
    let image10 = UIImage(named: "b10")
    let image11 = UIImage(named: "b11")
    let image12 = UIImage(named: "b12")
    let image13 = UIImage(named: "b13")
    let image14 = UIImage(named: "b14")
    let image15 = UIImage(named: "b15")
    let image16 = UIImage(named: "b16")
    let image17 = UIImage(named: "b17")
    let image18 = UIImage(named: "b18")
    let image19 = UIImage(named: "b19")
    let image20 = UIImage(named: "b20")
    let image21 = UIImage(named: "b21")
    let image22 = UIImage(named: "b22")
    
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
                let myArray = try JSONSerialization.jsonObject(with: data, options:[])
                
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
        

        // In TableView Three,the imageView are put in switch statement
        
        switch indexPath.row {
            
        case 0:
            
            cell.imageView!.image = image1
            
        case 1:
            
            cell.imageView!.image = image2
            
        case 2:
            
            cell.imageView!.image = image3
            
        case 3:
            
            cell.imageView!.image = image4
            
        case 4:
            
            cell.imageView!.image = image5
           
        case 5:
            
            cell.imageView!.image = image6
            
        case 6:
            
            cell.imageView!.image = image7
            
        case 7:
            
            cell.imageView!.image = image8
            
        case 8:
            
            cell.imageView!.image = image9
            
        case 9:
            
            cell.imageView!.image = image10
            
        case 10:
            
            cell.imageView!.image = image11
            
        case 11:
            
            cell.imageView!.image = image12
            
        case 12:
            
            cell.imageView!.image = image13
            
        case 13:
            
            cell.imageView!.image = image14
            
        case 14:
            
            cell.imageView!.image = image15
            
        case 15:
            
            cell.imageView!.image = image16
            
        case 16:
            
            cell.imageView!.image = image17
            
        case 17:
            
            cell.imageView!.image = image18
            
        case 18:
            
            cell.imageView!.image = image19
     
        case 19:
            
            cell.imageView!.image = image20
            
        case 20:
            
            cell.imageView!.image = image21
            
        case 21:
            
            cell.imageView!.image = image22
            
        default:
            
            print("Some of the images are missing..")
            
                }
        
        return cell

    
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
 
}




