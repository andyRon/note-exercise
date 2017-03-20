//
//  DiscoverTableViewController.swift
//  FoodPin
//
//  Created by andyron on 2017/3/20.
//  Copyright © 2017年 andyron. All rights reserved.
//

import UIKit
import CloudKit

class DiscoverTableViewController: UITableViewController {

    var restaurants: [CKRecord] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchRecordsFromCloud()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let restaurant = restaurants[indexPath.row]
        cell.textLabel?.text = restaurant.object(forKey: "name") as? String
        
        if let image = restaurant.object(forKey: "image") {
            let imageAsset = image as! CKAsset
            // try? 代替 do-catch
            if let imageData = try? Data.init(contentsOf: imageAsset.fileURL) {
                cell.imageView?.image = UIImage(data: imageData)
            }
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // convenience API
    func fetchRecordsFromCloud() {
        
        let cloudContainer = CKContainer.default()
        let publicDatabase = cloudContainer.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        
        publicDatabase.perform(query, inZoneWith: nil, completionHandler:  {
            (results, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            
            if let results = results {
                print("Restaurant 数据下载完成")
                self.restaurants = results
                // 添加到main thread
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
                
            }
        })
    }
    // operational API
    func fetchRecordsFromCloud2() {
        
        let cloudContainer = CKContainer.default()
        let publicDatabase = cloudContainer.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        
        
        let queryOperation = CKQueryOperation(query: query)
        queryOperation.desiredKeys = ["name", "image"]
        queryOperation.queuePriority = .veryHigh
        queryOperation.resultsLimit = 50
        queryOperation.recordFetchedBlock = {
            (record) -> Void in
            self.restaurants.append(record)
        }
        
        queryOperation.queryCompletionBlock = {
            (cursor, error) -> Void in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            print("sucess")
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
            
        }
        
        publicDatabase.add(queryOperation)
    }

}
