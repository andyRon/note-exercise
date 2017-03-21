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
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    var imageCache = NSCache<CKRecordID, NSURL>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        spinner.hidesWhenStopped = true  // 当动画停止时消失
        spinner.center = view.center
        tableView.addSubview(spinner)
        spinner.startAnimating()
        
        fetchRecordsFromCloud2()
        
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.white
        refreshControl?.tintColor = UIColor.gray
        refreshControl?.addTarget(self, action: #selector(fetchRecordsFromCloud2), for: UIControlEvents.valueChanged)
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
        
//        if let image = restaurant.object(forKey: "image") {
//            let imageAsset = image as! CKAsset
//            // try? 代替 do-catch
//            if let imageData = try? Data.init(contentsOf: imageAsset.fileURL) {
//                cell.imageView?.image = UIImage(data: imageData)
//            }
//        }
        // lazy loading images
        cell.imageView?.image = UIImage(named: "photoalbum")
        
        if let imageFileURL = imageCache.object(forKey: restaurant.recordID) { // 从缓存中获取
            print("从缓存中获取图片")
            if let imageData = try? Data.init(contentsOf: imageFileURL as URL) {
                cell.imageView?.image = UIImage(data: imageData)
            }
            
        } else { // 在后台从iCloud中获取
            
            let publicDatabase = CKContainer.default().publicCloudDatabase
            // CKFetchRecordsOperation用来 fetch specific record
            let fetchRecordsImageOperation = CKFetchRecordsOperation(recordIDs: [restaurant.recordID])
            fetchRecordsImageOperation.desiredKeys = ["image"]
            fetchRecordsImageOperation.queuePriority = .veryHigh
            
            fetchRecordsImageOperation.perRecordCompletionBlock =  { 
                (record, recoreId, error) -> Void in
                if let error = error  {
                    print("失败加载图片:\(error.localizedDescription)")
                    return
                }
                
                if let restaurantRecord = record {
                    OperationQueue.main.addOperation {
                        if let image = restaurantRecord.object(forKey: "image") {
                            let imageAsset = image as! CKAsset
                            
                            if let imageData = try? Data.init(contentsOf: imageAsset.fileURL) {
                                cell.imageView?.image = UIImage(data: imageData)
                            }
                            // 添加图片url到缓存中
                            self.imageCache.setObject(imageAsset.fileURL as NSURL , forKey: restaurant.recordID)
                        }
                        
                    }
                }
            }
            
            publicDatabase.add(fetchRecordsImageOperation)
        }
        
        
        
        return cell
    }
    

   
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
        // 防止重复
        restaurants.removeAll()
        tableView.reloadData()
        
        
        let cloudContainer = CKContainer.default()
        let publicDatabase = cloudContainer.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        // 排序
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        
        let queryOperation = CKQueryOperation(query: query)
        queryOperation.desiredKeys = ["name"]
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
                self.spinner.stopAnimating()
                self.tableView.reloadData()
                // 隐藏刷新
                if let refreshControl = self.refreshControl {
                    if refreshControl.isRefreshing  {
                        refreshControl.endRefreshing()
                    }
                }
            }
        }
        
        publicDatabase.add(queryOperation)
    }

}
