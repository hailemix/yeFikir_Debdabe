//
//  ViewController.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit
import CoreData

class FavouriteTable: UITableViewController{
    
    
    var detailViewController: FavouriteDetail? = nil
    var objects = [""]
    var details = [""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "የወደድኩት"
      
       
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? FavouriteDetail
            
        }
    }
    
    
    
    
    // MARK: - Segues
    
    override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Favourites" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = details[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! FavouriteDetail
                controller.detailItem = object as AnyObject?
                
                
                
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShareCell" , for: indexPath)
        let object = objects[indexPath.row]
        
        cell.textLabel!.text = object
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
}




