//
//  ViewController.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit




class TableOne: UITableViewController{
    

    var detailViewController: DetailOne? = nil
    var contentArray = [String]()
    var contentString = ""
    var object = [String]()
    static var contentText = ""
    var objects = ["ከልቤ ወደድኩሽ ስላት...","ኢትዮጲያዊ ደብዳቤ","የአመታት ጉዞ…በፍቅር ጥያቄ","ብልጣብልጥነትና የፍቅር ፍርፋሪ","የጨረታ ማስታወቂያ","ሰሞኑን...","የስራ ማስታወቂያ"," ደብዳቤ ወ ሳይኮሎጂ","የስራ ፈላጊዎች አሳዛኝ ደብዳቤ","ይድረስ አሜሪካ ላለኸዉ ወንድሜ" ,"በፈጠረሽ"]
    
    let image1 = UIImage(named: "a1")
    let image2 = UIImage(named: "a2")
    let image3 = UIImage(named: "a3")
    let image4 = UIImage(named: "a4")
    let image5 = UIImage(named: "a5")
    let image6 = UIImage(named: "a6")
    let image7 = UIImage(named: "a7")
    let image8 = UIImage(named: "a8")
    let image9 = UIImage(named: "a9")
    let image10 = UIImage(named: "a10")
    let image11 = UIImage(named: "a11")
    var selectedImage = UIImage()
   
    enum jsonError: Error {
        
        case failed(String)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailOne
            
        }
    }
    
    func retrieveFromJson() -> [String] {
        
        do {
            
            if let file = Bundle.main.url(forResource: "contents", withExtension: "json"){
                let data = try Data(contentsOf: file)
                let myArray = try JSONSerialization.jsonObject(with: data, options:[])
                
                if let contentDictionary = myArray as? [String: Any]{
                    
                    contentArray = (contentDictionary["contentA"] as? [String])!
                }
            }
        } catch {
            
            print(jsonError.failed("Failed to Serialize Json file"))
        }
        return contentArray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        object = retrieveFromJson()
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailOne
                controller.detailItem = object[indexPath.row]
                TableOne.contentText = controller.detailItem!
                
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath)
        let zObject = objects[indexPath.row]
        
        cell.textLabel!.text = zObject
        
        
        switch(indexPath.row) {
            
        case 0:
            selectedImage = image1!
            
        case 1:
            selectedImage = image2!
            
        case 2:
             selectedImage = image3!
         
        case 3:
             selectedImage = image4!
        
        case 4:
             selectedImage = image5!
            
        case 5:
            selectedImage = image6!
            
        case 6:
             selectedImage = image7!
            
        case 8:
             selectedImage = image8!
            
        case 9:
             selectedImage = image9!
            
        case 10:
             selectedImage = image10!
        
            default:
                print("Some of the images are missing..")
            
        }
        cell.imageView!.image = selectedImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
    
}




